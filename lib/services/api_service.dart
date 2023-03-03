import 'package:codigo6_movieapp/models/character_model.dart';
import 'package:codigo6_movieapp/models/image_model.dart';
import 'package:codigo6_movieapp/models/movie_detail_model.dart';
import 'package:codigo6_movieapp/models/movie_model.dart';
import 'package:codigo6_movieapp/models/review_model.dart';
import 'package:codigo6_movieapp/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future<List<MovieModel>> getMovies() async {
    Uri url = Uri.parse("$apiUrl/discover/movie?api_key=$apiKey&page=1");
    http.Response response = await http.get(url);
    Map data = json.decode(response.body);
    List movies = data["results"];
    List<MovieModel> moviesModel = [];
    moviesModel = movies.map((e) => MovieModel.fromJson(e)).toList();
    return moviesModel;
  }

  Future<MovieDetailModel> getMovieDetails(int idMovie) async {
    Uri url =
        Uri.parse("$apiUrl/movie/$idMovie?api_key=$apiKey&language=en-US");
    http.Response response = await http.get(url);
    Map<String, dynamic> data = json.decode(response.body);
    MovieDetailModel movieDetailModel = MovieDetailModel.fromJson(data);
    return movieDetailModel;
  }

  Future<List<CharacterModel>> getCharacteres(int idMovie) async {
    Uri url = Uri.parse(
        "$apiUrl/movie/$idMovie/credits?api_key=$apiKey&language=en-US");
    http.Response response = await http.get(url);
    Map data = json.decode(response.body);
    List castList = data["cast"];
    List<CharacterModel> characteres = [];
    characteres = castList.map((e) => CharacterModel.fromJson(e)).toList();
    print(characteres);
    return characteres;
  }

  Future<List<ImageModel>> getImages(int idMovie) async {
    Uri url = Uri.parse("$apiUrl/movie/$idMovie/images?api_key=$apiKey");
    http.Response response = await http.get(url);
    Map data = json.decode(response.body);
    List images = data["backdrops"];
    List<ImageModel> imagesModel = [];
    imagesModel = images.map((e) => ImageModel.fromJson(e)).toList();
    return imagesModel;
  }

  Future<List<ReviewModel>> getReviews(int idMovie) async {
    Uri url = Uri.parse(
        "$apiUrl/movie/$idMovie/reviews?api_key=$apiKey&language=en-US&page=1");
    http.Response response = await http.get(url);
    Map data = json.decode(response.body);
    List reviews = data["results"];
    List<ReviewModel> reviewsModel = [];
    reviewsModel = reviews.map((e) => ReviewModel.fromJson(e)).toList();
    print(reviewsModel);
    return reviewsModel;
  }
}
