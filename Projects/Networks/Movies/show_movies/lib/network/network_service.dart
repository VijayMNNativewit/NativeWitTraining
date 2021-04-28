import 'dart:async';
import 'dart:convert';
//import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:show_movies/model/movie.dart';

class Singleton {
  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();

  static final Singleton _singleton = Singleton._internal();
  MovieGenreResults genreParsed;
  static const String apiKey = '2a95a8623828ece97f84bbcdf783f5f6';
  static const String genreList =
      'https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey&language=en-US';

  MovieGenreResults parseGenre(String responseBody) {
    final Map<String, dynamic> parsed =
        jsonDecode(responseBody) as Map<String, dynamic>;
    final MovieGenreResults output = MovieGenreResults.fromJson(parsed);
    return output;
  }

  Future<MovieGenreResults> fetchMovieGenre() async {
    final http.Response response =
        await http.Client().get(Uri.parse(genreList));
    //print(response.body);
    return parseGenre(response.body);
  }

  Future<void> genreMapGenerator() async {
    genreParsed = await fetchMovieGenre();
    //print(genreParsed);
  }
}

class NetworkApiRoutes {
  static const String imageSource = 'https://image.tmdb.org/t/p/w500';
  static const String imageSourceSlash = 'https://image.tmdb.org/t/p/w500/';
  static const String apiKey = '2a95a8623828ece97f84bbcdf783f5f6';
  static const String popularMovies =
      'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=1';
  static const String topRatedMovies =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&language=en-US&page=1';
  static const String upcomingMovies =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&language=en-US&page=1';
  static const String genreList =
      'https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey&language=en-US';

  static Future<MovieResults> fetchPopularMovies(http.Client client) async {
    final http.Response response = await client.get(Uri.parse(popularMovies));

    return parseMovies(response.body);
  }

  static Future<MovieResults> fetchTopRatedMovies(http.Client client) async {
    final http.Response response = await client.get(Uri.parse(topRatedMovies));

    return parseMovies(response.body);
  }

  static Future<MovieResults> fetchUpcomingMovies(http.Client client) async {
    final http.Response response = await client.get(Uri.parse(upcomingMovies));

    return parseMovies(response.body);
  }

  static Future<MovieResults> fetchSimilarMovies(int id) async {
    final String similarMovie =
        'https://api.themoviedb.org/3/movie/$id/similar?api_key=2a95a8623828ece97f84bbcdf783f5f6&language=en-US&page=1';
    final http.Response response =
        await http.Client().get(Uri.parse(similarMovie));

    return parseMovies(response.body);
  }

  static Future<MovieCastResults> fetchCastDetails(int id) async {
    final String movieCast =
        'https://api.themoviedb.org/3/movie/$id/credits?api_key=2a95a8623828ece97f84bbcdf783f5f6&language=en-US';

    final http.Response response =
        await http.Client().get(Uri.parse(movieCast));

    return parseCast(response.body);
  }

  static Future<MovieDetails> fetchMovieDetails(int id) async {
    final String movieDetails =
        'https://api.themoviedb.org/3/movie/$id?api_key=2a95a8623828ece97f84bbcdf783f5f6&language=en-US';

    final http.Response response =
        await http.Client().get(Uri.parse(movieDetails));

    return parseMovieDetails(response.body);
  }

  static Future<MovieCreditsResults> fetchMovieCredits(int id) async {
    final String movieCredits =
        'https://api.themoviedb.org/3/person/$id/movie_credits?api_key=2a95a8623828ece97f84bbcdf783f5f6&language=en-US';

    final http.Response response =
        await http.Client().get(Uri.parse(movieCredits));

    return parseMovieCredits(response.body);
  }

  static Future<TvCreditsResults> fetchTvCredits(int id) async {
    final String tvCredits =
        'https://api.themoviedb.org/3/person/$id/tv_credits?api_key=2a95a8623828ece97f84bbcdf783f5f6&language=en-US';

    final http.Response response =
        await http.Client().get(Uri.parse(tvCredits));

    return parseTvCredits(response.body);
  }

  static MovieResults parseMovies(String responseBody) {
    final Map<String, dynamic> parsed =
        jsonDecode(responseBody) as Map<String, dynamic>;
    return MovieResults.fromJson(parsed);
  }

  static MovieCastResults parseCast(String responseBody) {
    final Map<String, dynamic> parsed =
        jsonDecode(responseBody) as Map<String, dynamic>;
    return MovieCastResults.fromJson(parsed);
  }

  static MovieDetails parseMovieDetails(String responseBody) {
    final Map<String, dynamic> parsed =
        jsonDecode(responseBody) as Map<String, dynamic>;
    return MovieDetails.fromJson(parsed);
  }

  static MovieCreditsResults parseMovieCredits(String responseBody) {
    final Map<String, dynamic> parsed =
        jsonDecode(responseBody) as Map<String, dynamic>;
    return MovieCreditsResults.fromJson(parsed);
  }

  static TvCreditsResults parseTvCredits(String responseBody) {
    final Map<String, dynamic> parsed =
        jsonDecode(responseBody) as Map<String, dynamic>;
    return TvCreditsResults.fromJson(parsed);
  }
}
