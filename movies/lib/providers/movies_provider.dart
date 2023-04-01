import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '32e5713a0414b8fd52b1ce4efb6043c1';
  final String _lenguage = 'es-ES';

  List<Movie> nowPlayingMovies = [];
  List<Movie> popularMovies = [];
  int _popularPage = 0;

  MoviesProvider() {
    getNowPlaying();
    getPopularMovies();
  }

  getNowPlaying() async {
    final jsonData = await _fetchMovieList('/3/movie/now_playing');
    final NowPlayingResponse nowPlayingResponse =
        NowPlayingResponse.fromRawJson(jsonData);

    nowPlayingMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;
    final jsonData = await _fetchMovieList('/3/movie/popular', _popularPage);
    final PopularResponse popularResponse =
        PopularResponse.fromRawJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }

  Future<String> _fetchMovieList(String path, [int page = 1]) async {
    var url = Uri.https(_baseUrl, path,
        {'api_key': _apiKey, 'language': _lenguage, 'page': '$page'});
    final response = await http.get(url);
    return response.body;
  }
}
