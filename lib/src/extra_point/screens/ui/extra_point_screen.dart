import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qradm/src/extra_point/model/extra_point.dart';
import 'package:qradm/src/extra_point/screens/widget/extrapint_list.dart';
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

class ExtraPointScreen extends StatefulWidget {
  @override
  _ExtraPointScreenState createState() => _ExtraPointScreenState();
}

class _ExtraPointScreenState extends State<ExtraPointScreen> {
  List<ExtraPoint> extrapoints = [];
  late Future<List<ExtraPoint>> _extrapoints;


  late APIClient client;

  onPressed(ExtraPoint extraPoint) {
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

  Future<APIListResponse> fetchExtraPoint() async {
    final result = await client.request<APIListResponse<ExtraPoint>>(
        route: APIRoute(APIType.api_extrapoint, routeParams: ''),
        create: () => APIListResponse(create: () => ExtraPoint())
    );
    return result.payload;
  }

  Future<List> fetchExtraPoint2() async {
    final result = await client.request<APIListResponse<ExtraPoint>>(
        route: APIRoute(APIType.api_extrapoint, routeParams: ''),
        create: () => APIListResponse(create: () => ExtraPoint())
    );
    // if (result.type == 'SUCCESSFULLY') {
      extrapoints.addAll(result.payload.payload as List<ExtraPoint>);
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
      future: fetchExtraPoint2(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return (ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ExtraPointList(snapshot.data[index]);
              }));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(title: Text('Actividades')),
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