import 'dart:async';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:movies/models/search_response.dart';

import '../helpers/debouncer.dart';
import '../models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '32e5713a0414b8fd52b1ce4efb6043c1';
  final String _lenguage = 'es-ES';

  List<Movie> nowPlayingMovies = [];
  List<Movie> popularMovies = [];
  Map<int, List<Cast>> cast = {};
  int _popularPage = 0;

  final debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
  );

  final StreamController<List<Movie>> _suggestionStreamContoller =
      StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream => _suggestionStreamContoller.stream;

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

  Future<List<Cast>> getCreditsReponse(int movie) async {
    if (cast.containsKey(movie)) return cast[movie]!;
    final jsonData = await _fetchMovieList('3/movie/$movie/credits');
    final CreditsResponse creditsResponse =
        CreditsResponse.fromRawJson(jsonData);
    cast[movie] = creditsResponse.cast;
    return creditsResponse.cast;
  }

  Future<List<Movie>> getSearchResponse(String query) async {
    var url = Uri.https(_baseUrl, '3/search/movie', {
      'api_key': _apiKey,
      'language': _lenguage,
      'page': '1',
      'query': query
    });
    final response = await http.get(url);
    final SearchResponse searchResponse =
        SearchResponse.fromRawJson(response.body);
    return searchResponse.results;
  }

  Future<String> _fetchMovieList(String path, [int page = 1]) async {
    var url = Uri.https(_baseUrl, path,
        {'api_key': _apiKey, 'language': _lenguage, 'page': '$page'});
    final response = await http.get(url);
    return response.body;
  }

  void getSuggestionsByQuery(String searchTerm) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final results = await getSearchResponse(value);
      _suggestionStreamContoller.add(results);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debouncer.value = searchTerm;
    });

    Future.delayed(const Duration(milliseconds: 301))
        .then((_) => timer.cancel());
  }
}
