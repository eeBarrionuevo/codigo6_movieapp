import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  getDataInternet() async {
    Uri url = Uri.parse(
        "https://api.themoviedb.org/3/discover/movie?api_key=077c6b8e215715b477754b84846c0f95&page=1");
    http.Response response = await http.get(url);
    print(response);
    print(response.statusCode);
    print(response.body);
    print("[1, 2, 3, 4]");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            child: Text("Get DATA"),
            onPressed: () {
              getDataInternet();
            },
          ),
        ),
      ),
    );
  }
}
