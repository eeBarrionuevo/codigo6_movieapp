import 'dart:convert';
import 'package:codigo6_movieapp/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieModel> moviesModel = [];

  @override
  void initState() {
    super.initState();
    getDataInternet();
  }

  getDataInternet() async {
    Uri url = Uri.parse(
        "https://api.themoviedb.org/3/discover/movie?api_key=&page=1");
    http.Response response = await http.get(url);
    Map data = json.decode(response.body);
    List movies = data["results"];
    moviesModel = movies.map((e) => MovieModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
