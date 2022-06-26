import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qradm/src/group_details/model/group_details.dart';
import 'package:qradm/src/group_details/ui/widgets/text_group_details.dart';
import 'package:qradm/src/group_details/ui/widgets/text_title_details.dart';
import 'package:qradm/src/navigation/navigation_screen.dart';
import 'package:qradm/src/service/api_client.dart';
import 'package:qradm/src/service/api_response.dart';
import 'package:qradm/src/service/api_route.dart';
import 'package:qradm/src/service/interceptors/auth_interceptor.dart';
import 'package:qradm/src/service/interceptors/log_interceptor.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GroupDetails extends StatefulWidget {
  @override
  _GroupDetails createState() => _GroupDetails();
}

class _GroupDetails extends State<GroupDetails> {
  late APIClient client;

  onPressed(QRScan group_details) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NavigationScreen()),
    );
  }

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

  Future<APIResponse> fetchQRScan() async {
    final result = await client.request<APIResponse<QRScan>>(
        route: APIRoute(APIType.api_group_details, routeParams: ''),
        create: () => APIResponse(create: () => QRScan())
    );
    return result.payload;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Grupos')),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextGroupTitle("Título"),
            TextGroupDetails("Nombre"),
            TextGroupDetails("Descripción"),
            TextGroupDetails("Código"),
            TextGroupDetails("Estado"),
            TextGroupDetails("Evento"),
          ],
        ),
      ),
    );
  }
}