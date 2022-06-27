import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qradm/src/detail_group/bloc/group_bloc.dart';
import 'package:qradm/src/detail_group/model/group.dart';
import 'package:qradm/src/detail_group/screens/widget/text_label.dart';
import 'package:qradm/src/extra_point/model/extra_point.dart';
import 'package:qradm/src/extra_point/model/request_extrapoint.dart';
import 'package:qradm/src/login/bloc/login_bloc.dart';
import 'package:qradm/src/login/model/user.dart';
import 'package:qradm/src/model_generic/group_action.dart';
import 'package:qradm/src/service/app_constant.dart';

class ScreenGroup extends StatefulWidget {
  Group group;
  GroupAction groupaction;
  ScreenGroup({Key? key, required this.group, required this.groupaction})
      : super(key: key);

  @override
  State<ScreenGroup> createState() => _ScreenGroupState();
}

class _ScreenGroupState extends State<ScreenGroup> {
  final TextEditingController myController = TextEditingController();
  String selectedValue = "";

  List<DropdownMenuItem<String>> get dropdownItems {
    int percent1 = widget.groupaction.getAmount().toInt();
    int percent2 =
        (widget.groupaction.getAmount() * AppConstants.PERCENTAJE1).toInt();
    int percent3 =
        (widget.groupaction.getAmount() * AppConstants.PERCENTAJE2).toInt();
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        child: Text("${widget.groupaction.getName()}-${percent1.toString()}"),
        value: percent1.toString(),
      ),
      DropdownMenuItem(
        child: Text("${widget.groupaction.getName()}-${percent2.toString()}"),
        value: percent2.toString(),
      ),
      DropdownMenuItem(
        child: Text("${widget.groupaction.getName()}-${percent3.toString()}"),
        value: percent3.toString(),
      )
    ];
    return menuItems;
  }

  @override
  void initState() {
    super.initState();
    selectedValue = widget.groupaction.getAmount().toInt().toString();
  }

  final _dropdownFormKey = GlobalKey<FormState>();

  Form bodyForm(GroupBloc groupBloc) {
    LoginBloc _userBloc = BlocProvider.of<LoginBloc>(context);
    User user = User();
    user.id = 0;
    if (_userBloc.state is Authenticated) {
      user = (_userBloc.state as Authenticated).user;
    }

    return Form(
      key: _dropdownFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButtonFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              filled: true,
              fillColor: Colors.blueAccent,
            ),
            validator: (value) => value == null ? "Select a country" : null,
            dropdownColor: Colors.blueAccent,
            value: selectedValue,
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue!;
              });
            },
            items: dropdownItems,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: myController,
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(
              icon: Icon(Icons.edit_note),
              labelText: 'Observaciones',
            ),
            onSaved: (value) {},
            validator: (value) {
              return value!.contains('@') ? 'Do not use the @ char.' : null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              if (_dropdownFormKey.currentState!.validate()) {
                // getUser();
                groupBloc.add(
                  RequestAPI(
                    RequestGroup(
                      widget.group.code,
                      widget.groupaction.getId(),
                      int.parse(selectedValue),
                      myController.value.text,
                      user,
                    ),
                    widget.groupaction,
                  ),
                );
              }
            },
            child: Text("Enviar"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final groupBloc = BlocProvider.of<GroupBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Familia",
        ),
      ),
      body: BlocListener<GroupBloc, GroupState>(
        listener: (context, state) {
          if (state is RedirectBack) {
            Navigator.pop(context);
          }
          if (state is AuthErrorAll) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<GroupBloc, GroupState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GroupInitialAll ||
                state is AuthError ||
                state is RedirectBack) {
              return bodyPrincipal(context, groupBloc);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Column bodyPrincipal(BuildContext context, GroupBloc groupBloc) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width,
                      minHeight: MediaQuery.of(context).size.height,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              TextLabel("Nombre:", widget.group.name),
                              TextLabel(
                                  "Descripción:", widget.group.description),
                              TextLabel("Código", widget.group.code),
                              // TextLabel("Estado",widget.group.state ? "ACTIVO" : "INACTIVO"),
                              TextLabel(
                                  "SELECCIONE Y AGREGUE OBSERVACIONES", ""),
                              bodyForm(groupBloc),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]);
  }
}
