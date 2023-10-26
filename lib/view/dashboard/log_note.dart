import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modul_mobile/controller/api.dart';

import '../../controller/api_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Data Fetcher',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ApiDataDisplay(),
    );
  }
}

class ApiDataDisplay extends StatefulWidget {
  @override
  _ApiDataDisplayState createState() => _ApiDataDisplayState();
}

class _ApiDataDisplayState extends State<ApiDataDisplay> {
  final apiService = ApiService(baseUrl: 'https://jsonplaceholder.typicode.com');
  late Future<Api> futureApiData;

  @override
  void initState() {
    super.initState();
    futureApiData = apiService.fetchApiData('todos/1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API Data')),
      body: Center(
        child: FutureBuilder<Api>(
          future: futureApiData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SpinKitFadingCircle(color: Colors.blue);
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Title: ${snapshot.data!.title}'),
                  SizedBox(height: 10),
                  Text('Completed: ${snapshot.data!.completed}'),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
