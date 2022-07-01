import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qradm/src/detail_group/bloc/group_bloc.dart';
import 'package:qradm/src/detail_group/screens/widget/text_label.dart';
import 'package:qradm/src/guest/bloc/guest_detail_bloc.dart';
import 'package:qradm/src/guest/model/guest.dart';
import 'package:qradm/src/guest/ui/widgets/button_update.dart';
import 'package:qradm/src/guest/ui/widgets/title_value.dart';
import 'package:qradm/src/login/model/user.dart';

class GuestDetailScreen extends StatefulWidget {
  final User user;
  GuestDetailScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<GuestDetailScreen> createState() => _GuestDetailState();
}

class _GuestDetailState extends State<GuestDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final guestDetailBloc = BlocProvider.of<GuestDetailBloc>(context);
    guestDetailBloc.add(RequestAPIGD(widget.user));
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Familia",
        ),
      ),
      body: BlocListener<GuestDetailBloc, GuestDetailState>(
        listener: (context, state) {
          // if (state is RedirectBackGuestDetail) {
          //   Navigator.pop(context);
          // } else
          if (state is AuthErrorGuestDetail) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is GuestDetailInitial) {}
        },
        child: BlocBuilder<GuestDetailBloc, GuestDetailState>(
          builder: (context, state) {
            if (state is GroupInitialAll || state is LoadingGuestDetail) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is RedirectBackGuestDetail) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
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
                                        TextLabel(
                                            "Nombre:", state.guestDetail.name),
                                        TextLabel("Descripción:",
                                            state.guestDetail.description),
                                        TextLabel(
                                            "Código", state.guestDetail.code),
                                        TitleValue("Eventos:",
                                            state.guestDetail.total_activity),
                                        TitleValue(
                                            "Puntos Extras:",
                                            state
                                                .guestDetail.total_extra_point),
                                        TitleValue("Sanciones:",
                                            state.guestDetail.total_sanction),
                                        TitleValue("TOTALES:",
                                            state.guestDetail.sum_total),
                                        ButtonUpdate(buttonText: "Ver Detalle")
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
            return Container();
          },
        ),
      ),
    );
  }

  Column bodyPrincipal(
    BuildContext context,
    GuestDetailBloc guestDetailBloc,
    GuestDetail guestDetail,
  ) {
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
                              TextLabel("Nombre:", guestDetail.name),
                              TextLabel(
                                  "Descripción:", guestDetail.description),
                              TextLabel("Código", guestDetail.code),
                              TitleValue(
                                  "Eventos:", guestDetail.total_activity),
                              TitleValue("Puntos Extras:",
                                  guestDetail.total_extra_point),
                              TitleValue(
                                  "Sanciones:", guestDetail.total_sanction),
                              TitleValue("TOTALES:", guestDetail.sum_total),
                              ButtonUpdate(buttonText: "EnviarXX")
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
