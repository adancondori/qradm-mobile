import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qradm/src/action_detail.dart/screens/ui/action_detail.dart';
import 'package:qradm/src/api_activitys/model/api_activitys.dart';
import 'package:qradm/src/detail_group/bloc/group_bloc.dart';
import 'package:qradm/src/guest/bloc/guest_detail_bloc.dart';
import 'package:qradm/src/guest_list/ui/bloc/bloc_list_bloc.dart';
import 'package:qradm/src/login/model/user.dart';
import 'package:qradm/src/model_generic/group_action.dart';

class GuestListScreen extends StatefulWidget {
  final User user;
  GuestListScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<GuestListScreen> createState() => _GuestListState();
}

class _GuestListState extends State<GuestListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final guestDetailBloc = BlocProvider.of<ListGuestBloc>(context);
    guestDetailBloc.add(RequestGuestListEvent(user: widget.user));
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Listado general",
        ),
      ),
      body: BlocListener<ListGuestBloc, GuestListState>(
        listener: (context, state) {
          if (state is AuthErrorGuestList) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is GuestDetailInitial) {}
        },
        child: BlocBuilder<ListGuestBloc, GuestListState>(
          builder: (context, state) {
            if (state is LoadingGuestList) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadedGuestList) {
              return ListView(
                // shrinkWrap: true,
                children: <Widget>[
                  titleAction("Actividades"),
                  _secondListView(state.apiActivitys),
                  titleAction("Sanciones"),
                  _secondListView(state.sanctions),
                  titleAction("Puntos Extras"),
                  _secondListView(state.extraPoints),
                ],
              );
              // bodyPrincipal(context, guestDetailBloc, state.apiActivitys);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Padding titleAction(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        top: 20,
        right: 30,
        bottom: 20,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: "Roboto",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 59, 135, 241),
        ),
      ),
    );
  }

  Widget _secondListView(List<GroupAction> actions) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: ListView.builder(
          itemCount: actions.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                onPressed(actions[index]);
              },
              child: _buildName2(index, actions[index]),
            );
          }),
    );
  }

  Widget _buildName2(int index, GroupAction action) {
    var exist = action.existMyAction();
    var points = action.getAmount().toInt().toString();
    if (exist) {
      points = points + " / " + action.getMyAmount().toInt().toString();
    } else {
      points = points + " / " + "000";
    }
    var container = Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Text(points),
      decoration: BoxDecoration(
        color: exist
            ? Color.fromARGB(255, 94, 248, 92)
            : Color.fromARGB(255, 245, 56, 56),
        borderRadius: BorderRadius.circular(20),
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 8,
        child: Column(
          children: <Widget>[
            SizedBox(height: 12),
            Row(
              children: <Widget>[
                SizedBox(width: 12),
                Text(
                  (index + 1).toString(),
                  style: const TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 12),
                SizedBox(
                  width: 170,
                  child: Text(
                    action.getName(),
                    style: const TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                container,
                SizedBox(width: 5),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  onPressed(GroupAction groupAction) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyActionDetail(groupAction)),
    );
  }
}
