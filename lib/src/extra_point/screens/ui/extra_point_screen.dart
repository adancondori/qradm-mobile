import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qradm/src/extra_point/model/extra_point.dart';
import 'package:qradm/src/extra_point/screens/widget/extrapint_list.dart';
import 'package:qradm/src/read_qr/ui/screens/read_qr.dart';
import 'package:qradm/src/service/api_client.dart';
import 'package:qradm/src/service/api_response.dart';
import 'package:qradm/src/service/api_route.dart';
import 'package:qradm/src/service/app_constant.dart';
import 'package:qradm/src/service/interceptors/auth_interceptor.dart';
import 'package:qradm/src/service/interceptors/log_interceptor.dart';

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
      MaterialPageRoute(builder: (context) => ReadQR(groupaction: extraPoint)),
    );
  }

  @override
  void initState() {
    super.initState();
    client = APIClient(
        options: BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 10000,
      baseUrl: AppConstants.BASE_URL,
    ));
    final interceptors = [
      AuthInterceptor(client, AuthToken(expiredTime: 1616142369958)),
      APILogInterceptor(),
    ];
    client.instance.interceptors.addAll(interceptors);
  }

  Future<APIListResponse> fetchExtraPoint() async {
    final result = await client.request<APIListResponse<ExtraPoint>>(
        route: APIRoute(APIType.api_extrapoint, routeParams: ''),
        create: () => APIListResponse(create: () => ExtraPoint()));
    return result.payload;
  }

  Future<List> fetchExtraPoint2() async {
    final result = await client.request<APIListResponse<ExtraPoint>>(
        route: APIRoute(APIType.api_extrapoint, routeParams: ''),
        create: () => APIListResponse(create: () => ExtraPoint()));
    return result.payload.payload;
  }

  @override
  Widget build(BuildContext context) {
    Widget listWidget = FutureBuilder(
      future: fetchExtraPoint2(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return (ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ExtraPointList(snapshot.data[index], onPress: onPressed);
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
        child: Stack(
          children: <Widget>[
            Container(child: listWidget),
          ],
        ),
      ),
    );
  }
}
