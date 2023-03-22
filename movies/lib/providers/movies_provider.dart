import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '32e5713a0414b8fd52b1ce4efb6043c1';
  final String _lenguage = 'es-ES';

  List<Movie> nowPlayingMovies = [];

  MoviesProvider() {
    getNowPlaying();
  }

  getNowPlaying() async {
    var url = Uri.https(_baseUrl, '/3/movie/now_playing',
        {'api_key': _apiKey, 'language': _lenguage, 'page': '1'});
    final response = await http.get(url);

    final NowPlayingResponse nowPlayingResponse =
        NowPlayingResponse.fromRawJson(response.body);

    nowPlayingMovies = nowPlayingResponse.results;
  }
}
