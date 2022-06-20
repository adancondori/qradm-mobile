import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qradm/src/navigation/employee.dart';
import 'package:qradm/src/service/api_client.dart';
import 'package:qradm/src/service/api_response.dart';
import 'package:qradm/src/service/api_route.dart';
import 'package:qradm/src/service/interceptors/auth_interceptor.dart';
import 'package:qradm/src/service/interceptors/log_interceptor.dart';

class TestAPI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Test();

  }

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   return Container(
  //     color: Colors.greenAccent,
  //   );
  // }
}

class _Test extends State<TestAPI> {
  String response = '';
  late APIClient client;

  @override
  void initState() {
    super.initState();
    client = APIClient( options: BaseOptions(baseUrl: 'http://dummy.restapiexample.com/api/v1')
    );
    final interceptors = [
      AuthInterceptor(client, AuthToken(expiredTime: 1616142369958)),
      APILogInterceptor(),
    ];
    client.instance.interceptors.addAll(interceptors);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.greenAccent,
      child: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Center(
          child: Column(
            children: <Widget>[
              FlatButton(
                color: Colors.yellowAccent,
                child: Text('Fetch Employees'),
                onPressed: () async {
                  try {
                    response = "empty";
                    final result = await fetchEmployeeList();
                    setState(() {
                      response = '${result.length} employees';
                    });
                  }
                  on Exception catch(err) {
                    setState(() {
                      response = err.toString();
                    });
                  }
                },
              ),
              const SizedBox(height: 16),
              FlatButton(
                color: Colors.yellowAccent,
                child: Text('Fetch User'),
                onPressed: () async {
                  try {
                    var dio = Dio();
                    //final response_git = await dio.get('https://api.github.com/users');
                    final response_git = await dio.get('https://gorest.co.in/public/v2/users/19');
                    print(response_git);
                    setState(() {
                      response = '${response_git} employees';
                    });
                  }
                  on Exception catch(err) {
                    setState(() {
                      response = err.toString();
                    });
                  }
                },
              ),
              const SizedBox(height: 16),
              Text(response),
            ],
          ),
        ),
      ),

    );
  }

  Future<List<Employee>> fetchEmployeeList() async {

    final result = await client.request<APIListResponse<Employee>>(
        route: APIRoute(APIType.listEmployees, routeParams: ''),
        create: () => APIListResponse(create: () => Employee())
    );

    final employees = result.payload.data;
    return employees;

  }
}