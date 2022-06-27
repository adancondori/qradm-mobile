import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qradm/src/api_activitys/model/api_activitys.dart';
import 'package:qradm/src/api_activitys/ui/widgets/api_activitys_list.dart';
import 'package:qradm/src/navigation/navigation_screen.dart';
import 'package:qradm/src/read_qr/ui/screens/read_qr.dart';
import 'package:qradm/src/service/api_client.dart';
import 'package:qradm/src/service/api_response.dart';
import 'package:qradm/src/service/api_route.dart';
import 'package:qradm/src/service/app_constant.dart';
import 'package:qradm/src/service/interceptors/auth_interceptor.dart';
import 'package:qradm/src/service/interceptors/log_interceptor.dart';

class ApiActivitysScreen extends StatefulWidget {
  @override
  _ApiActivitysScreenState createState() => _ApiActivitysScreenState();
}

class _ApiActivitysScreenState extends State<ApiActivitysScreen> {
  List<ApiActivitys> apiActivitys = [];

  late APIClient client;

  onPressed(ApiActivitys apiActivity) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReadQR(groupaction: apiActivity)),
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
    // callAPI();
  }

  Future<List> fetchApiActivitys2() async {
    final result = await client.request<APIListResponse<ApiActivitys>>(
        route: APIRoute(APIType.api_activity, routeParams: ''),
        create: () => APIListResponse(create: () => ApiActivitys()));
    // if (result.type == 'SUCCESSFULLY') {
    apiActivitys.addAll(result.payload.payload as List<ApiActivitys>);
    return result.payload.payload;
  }

  @override
  Widget build(BuildContext context) {
    Widget listWidget = FutureBuilder(
      future: fetchApiActivitys2(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return (ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ApiActivitysList(
                  snapshot.data[index],
                  onPress: onPressed,
                );
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
