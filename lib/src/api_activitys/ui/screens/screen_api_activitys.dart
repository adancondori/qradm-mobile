import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qradm/src/api_activitys/model/api_activitys.dart';
import 'package:qradm/src/api_activitys/ui/widgets/api_activitys_list.dart';
import 'package:qradm/src/navigation/navigation_screen.dart';
import 'package:qradm/src/service/api_client.dart';
import 'package:qradm/src/service/api_response.dart';
import 'package:qradm/src/service/api_route.dart';
import 'package:qradm/src/service/interceptors/auth_interceptor.dart';
import 'package:qradm/src/service/interceptors/log_interceptor.dart';
// import this to be able to call json.decode()
import 'dart:convert';

// import this to easily send HTTP request
import 'package:http/http.dart' as http;

class ApiActivitysScreen extends StatefulWidget {
  @override
  _ApiActivitysScreenState createState() => _ApiActivitysScreenState();
}

class _ApiActivitysScreenState extends State<ApiActivitysScreen> {
  List<ApiActivitys> apiActivitys = [];
  late Future<List<ApiActivitys>> _apiActivitys;


  late APIClient client;

  onPressed(ApiActivitys apiActivitys) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NavigationScreen()),
    );
  }

  // void callAPI() async {
  //   final result = await fetchExtraPoint();
  //   if (result.type=="SUCCESSFULLY") {
  //     extrapoints.addAll(result.payload as List<ExtraPoint>);
  //     _extrapoints = extrapoints as Future<List<ExtraPoint>>;
  //   } else {
  //     showDialog(
  //       context: context,
  //       builder: (ctx) => AlertDialog(
  //         title: Text("Mensaje"),
  //         content: Text("Ocurrio un error al intentar conectarse con se servidor."),
  //         actions: <Widget>[
  //           FlatButton(
  //             onPressed: () {
  //               Navigator.of(ctx).pop();
  //             },
  //             child: Text("Aceptar"),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  //
  // }


  @override
  void initState() {
    super.initState();
    client = APIClient(
        options: BaseOptions(
          connectTimeout: 10000,
          receiveTimeout: 10000,
          baseUrl: 'http://192.168.1.116:3200/api/v1/mobile',
        )
    );
    final interceptors = [
      AuthInterceptor(client, AuthToken(expiredTime: 1616142369958)),
      APILogInterceptor(),
    ];
    client.instance.interceptors.addAll(interceptors);
    // callAPI();
  }

  Future<APIListResponse> fetchApiActivitys() async {
    final result = await client.request<APIListResponse<ApiActivitys>>(
        route: APIRoute(APIType.api_activity, routeParams: ''),
        create: () => APIListResponse(create: () => ApiActivitys())
    );
    return result.payload;
  }

  Future<List> fetchApiActivitys2() async {
    final result = await client.request<APIListResponse<ApiActivitys>>(
        route: APIRoute(APIType.api_activity, routeParams: ''),
        create: () => APIListResponse(create: () => ApiActivitys())
    );
    // if (result.type == 'SUCCESSFULLY') {
    apiActivitys.addAll(result.payload.payload as List<ApiActivitys>);
    print("ENTROOOOO");
    // } else {
    //   showDialog(
    //     context: context,
    //     builder: (ctx) => AlertDialog(
    //       title: Text("Mensaje"),
    //       content: Text("Ocurrio un error al intentar conectarse con se servidor."),
    //       actions: <Widget>[
    //         FlatButton(
    //           onPressed: () {
    //             Navigator.of(ctx).pop();
    //           },
    //           child: Text("Aceptar"),
    //         ),
    //       ],
    //     ),
    //   );
    // }
    return result.payload.payload;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget listWidget = FutureBuilder(
      future: fetchApiActivitys2(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return (ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ApiActivitysList(snapshot.data[index]);
              }));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(title: Text('Api Actividades Prueba')),
      body: Container(
        color: Colors.white,
        child:  Stack(
          children: <Widget>[
            Container(
                child: listWidget
              // ListView.builder(
              //     padding: const EdgeInsets.all(8),
              //     itemCount: extrapoints.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       return ExtraPointList(extrapoints[index]);
              //     }
              // ),
            ),
          ],
        ),
      ),
    );

  }
}