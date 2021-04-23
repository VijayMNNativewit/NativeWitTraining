import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:show_movies/model/movie.dart';

String imageSource = "https://image.tmdb.org/t/p/w500";
String imageSourceSlash = "https://image.tmdb.org/t/p/w500/";
String popularMovies =
    "https://api.themoviedb.org/3/movie/popular?api_key=2a95a8623828ece97f84bbcdf783f5f6&language=en-US&page=1";
String topRatedMovies =
    "https://api.themoviedb.org/3/movie/top_rated?api_key=2a95a8623828ece97f84bbcdf783f5f6&language=en-US&page=1";
String upcomingMovies =
    "https://api.themoviedb.org/3/movie/upcoming?api_key=2a95a8623828ece97f84bbcdf783f5f6&language=en-US&page=1";
String genreList =
    "https://api.themoviedb.org/3/genre/movie/list?api_key=2a95a8623828ece97f84bbcdf783f5f6&language=en-US";
Map<int, String> genre = {};

genreMapGenerator() async {
  MovieGenreResults genreParsed = await fetchMovieGenre();
  print(genreParsed.results[0].name);
}

Future<MovieGenreResults> fetchMovieGenre() async {
  final response = await http.Client().get(Uri.parse(genreList));
  //print(response.body);
  return parseGenre(response.body);
}

Future<MovieResults> fetchPopularMovies(http.Client client) async {
  final response = await client.get(Uri.parse(popularMovies));

  return parseMovies(response.body);
}

Future<MovieResults> fetchTopRatedMovies(http.Client client) async {
  final response = await client.get(Uri.parse(topRatedMovies));

  return parseMovies(response.body);
}

Future<MovieResults> fetchUpcomingMovies(http.Client client) async {
  final response = await client.get(Uri.parse(upcomingMovies));

  return parseMovies(response.body);
}

Future<MovieResults> fetchSimilarMovies(int id) async {
  String similarMovie =
      "https://api.themoviedb.org/3/movie/$id/similar?api_key=2a95a8623828ece97f84bbcdf783f5f6&language=en-US&page=1";
  final response = await http.Client().get(Uri.parse(similarMovie));

  return parseMovies(response.body);
}

Future<MovieCastResults> fetchCastDetails(int id) async {
  String movieCast =
      "https://api.themoviedb.org/3/movie/$id/credits?api_key=2a95a8623828ece97f84bbcdf783f5f6&language=en-US";

  final response = await http.Client().get(Uri.parse(movieCast));

  return parseCast(response.body);
}

Future<MovieDetails> fetchMovieDetails(int id) async {
  String movieDetails =
      "https://api.themoviedb.org/3/movie/$id?api_key=2a95a8623828ece97f84bbcdf783f5f6&language=en-US";

  final response = await http.Client().get(Uri.parse(movieDetails));

  return parseMovieDetails(response.body);
}

Future<MovieCreditsResults> fetchMovieCredits(int id) async {
  String movieCredits =
      "https://api.themoviedb.org/3/person/$id/movie_credits?api_key=2a95a8623828ece97f84bbcdf783f5f6&language=en-US";

  final response = await http.Client().get(Uri.parse(movieCredits));

  return parseMovieCredits(response.body);
}

Future<TvCreditsResults> fetchTvCredits(int id) async {
  String tvCredits =
      "https://api.themoviedb.org/3/person/$id/tv_credits?api_key=2a95a8623828ece97f84bbcdf783f5f6&language=en-US";

  final response = await http.Client().get(Uri.parse(tvCredits));

  return parseTvCredits(response.body);
}

MovieResults parseMovies(String responseBody) {
  final parsed = jsonDecode(responseBody);
  return MovieResults.fromJson(parsed);
}

MovieGenreResults parseGenre(String responseBody) {
  final parsed = jsonDecode(responseBody);
  print("Decoded Json = $parsed");
  final output = MovieGenreResults.fromJson(parsed);
  print(output);
  //return MovieGenreResults.fromJson(parsed);
  return output;
}

MovieCastResults parseCast(String responseBody) {
  final parsed = jsonDecode(responseBody);
  return MovieCastResults.fromJson(parsed);
}

MovieDetails parseMovieDetails(String responseBody) {
  final parsed = jsonDecode(responseBody);
  return MovieDetails.fromJson(parsed);
}

MovieCreditsResults parseMovieCredits(String responseBody) {
  final parsed = jsonDecode(responseBody);
  return MovieCreditsResults.fromJson(parsed);
}

TvCreditsResults parseTvCredits(String responseBody) {
  final parsed = jsonDecode(responseBody);
  return TvCreditsResults.fromJson(parsed);
}

class NetworkService extends StatefulWidget {
  @override
  _NetworkServiceState createState() => _NetworkServiceState();
}

class _NetworkServiceState extends State<NetworkService> {
  @override
  void initState() {
    //genreMapGenerator();
    //print("called");
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
