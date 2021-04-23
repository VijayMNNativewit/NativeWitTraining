library movie;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';

part 'movie.g.dart';

abstract class Movie implements Built<Movie, MovieBuilder> {
  factory Movie([void Function(MovieBuilder b) updates]) = _$Movie;

  Movie._();

  @nullable
  @BuiltValueField(wireName: 'adult')
  bool get adult;

  @nullable
  @BuiltValueField(wireName: 'backdrop_path')
  String get backDropPath;

  @nullable
  @BuiltValueField(wireName: 'genre_ids')
  BuiltList<int> get genreIds;

  @nullable
  @BuiltValueField(wireName: 'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: 'original_language')
  String get originalLanguage;

  @nullable
  @BuiltValueField(wireName: 'original_title')
  String get originalTitle;

  @nullable
  @BuiltValueField(wireName: 'overview')
  String get overview;

  @nullable
  @BuiltValueField(wireName: 'popularity')
  num get popularity;

  @nullable
  @BuiltValueField(wireName: 'poster_path')
  String get posterPath;

  @nullable
  @BuiltValueField(wireName: 'release_date')
  String get releaseDate;

  @nullable
  @BuiltValueField(wireName: 'title')
  String get title;

  @nullable
  @BuiltValueField(wireName: 'video')
  bool get video;

  @nullable
  @BuiltValueField(wireName: 'vote_average')
  num get voteAverage;

  @nullable
  @BuiltValueField(wireName: 'vote_count')
  int get voteCount;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Movie.serializer, this)
        as Map<String, dynamic>;
  }

  static Movie fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(Movie.serializer, jsonString);
  }

  static Serializer<Movie> get serializer => _$movieSerializer;
}

abstract class MovieResults
    implements Built<MovieResults, MovieResultsBuilder> {
  factory MovieResults([void Function(MovieResultsBuilder b) updates]) =
      _$MovieResults;

  MovieResults._();

  @nullable
  int get page;

  @nullable
  @BuiltValueField(wireName: 'total_pages')
  int get totalPages;

  @nullable
  @BuiltValueField(wireName: 'total_results')
  int get totalResults;

  @nullable
  BuiltList<Movie> get results;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(MovieResults.serializer, this)
        as Map<String, dynamic>;
  }

  static MovieResults fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(MovieResults.serializer, jsonString);
  }

  static Serializer<MovieResults> get serializer => _$movieResultsSerializer;
}

abstract class MovieGenre implements Built<MovieGenre, MovieGenreBuilder> {
  factory MovieGenre([void Function(MovieGenreBuilder b) updates]) =
      _$MovieGenre;

  MovieGenre._();

  @nullable
  @BuiltValueField(wireName: 'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: 'name')
  String get name;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(MovieGenre.serializer, this)
        as Map<String, dynamic>;
  }

  static MovieGenre fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(MovieGenre.serializer, jsonString);
  }

  static Serializer<MovieGenre> get serializer => _$movieGenreSerializer;
}

abstract class MovieGenreResults
    implements Built<MovieGenreResults, MovieGenreResultsBuilder> {
  factory MovieGenreResults(
          [void Function(MovieGenreResultsBuilder b) updates]) =
      _$MovieGenreResults;

  MovieGenreResults._();

  @nullable
  @BuiltValueField(wireName: 'genres')
  BuiltList<MovieGenre> get results;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(MovieGenreResults.serializer, this)
        as Map<String, dynamic>;
  }

  static MovieGenreResults fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(
        MovieGenreResults.serializer, jsonString);
  }

  static Serializer<MovieGenreResults> get serializer =>
      _$movieGenreResultsSerializer;
}

abstract class MovieCast implements Built<MovieCast, MovieCastBuilder> {
  factory MovieCast([void Function(MovieCastBuilder b) updates]) = _$MovieCast;
  MovieCast._();

  @nullable
  @BuiltValueField(wireName: 'adult')
  bool get adult;

  @nullable
  @BuiltValueField(wireName: 'gender')
  int get gender;

  @nullable
  @BuiltValueField(wireName: 'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: 'known_for_department')
  String get knownForDepartment;

  @nullable
  @BuiltValueField(wireName: 'name')
  String get name;

  @nullable
  @BuiltValueField(wireName: 'original_name')
  String get originalName;

  @nullable
  @BuiltValueField(wireName: 'popularity')
  num get popularity;

  @nullable
  @BuiltValueField(wireName: 'profile_path')
  String get profilePath;

  @nullable
  @BuiltValueField(wireName: 'cast_id')
  int get castId;

  @nullable
  @BuiltValueField(wireName: 'character')
  String get character;

  @nullable
  @BuiltValueField(wireName: 'credit_id')
  String get creditId;

  @nullable
  @BuiltValueField(wireName: 'order')
  int get order;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(MovieCast.serializer, this)
        as Map<String, dynamic>;
  }

  static MovieCast fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(MovieCast.serializer, jsonString);
  }

  static Serializer<MovieCast> get serializer => _$movieCastSerializer;
}

abstract class MovieCastResults
    implements Built<MovieCastResults, MovieCastResultsBuilder> {
  factory MovieCastResults([void Function(MovieCastResultsBuilder b) updates]) =
      _$MovieCastResults;

  MovieCastResults._();
  @nullable
  @BuiltValueField(wireName: 'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: 'cast')
  BuiltList<MovieCast> get castResults;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(MovieCastResults.serializer, this)
        as Map<String, dynamic>;
  }

  static MovieCastResults fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(MovieCastResults.serializer, jsonString);
  }

  static Serializer<MovieCastResults> get serializer =>
      _$movieCastResultsSerializer;
}

abstract class MovieDetails
    implements Built<MovieDetails, MovieDetailsBuilder> {
  factory MovieDetails([void Function(MovieDetailsBuilder b) updates]) =
      _$MovieDetails;

  MovieDetails._();
  @nullable
  @BuiltValueField(wireName: 'original_title')
  String get originalTitle;

  @nullable
  @BuiltValueField(wireName: 'status')
  String get status;

  @nullable
  @BuiltValueField(wireName: 'runtime')
  int get runtime;

  @nullable
  @BuiltValueField(wireName: 'genres')
  BuiltList<MovieGenre> get type;

  @nullable
  @BuiltValueField(wireName: 'release_date')
  String get premiere;

  @nullable
  @BuiltValueField(wireName: 'budget')
  int get budget;

  @nullable
  @BuiltValueField(wireName: 'revenue')
  int get revenue;

  @nullable
  @BuiltValueField(wireName: 'homepage')
  String get homepage;

  @nullable
  @BuiltValueField(wireName: 'imdb_id')
  String get imdbId;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(MovieDetails.serializer, this)
        as Map<String, dynamic>;
  }

  static MovieDetails fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(MovieDetails.serializer, jsonString);
  }

  static Serializer<MovieDetails> get serializer => _$movieDetailsSerializer;
}

abstract class MovieCredits
    implements Built<MovieCredits, MovieCreditsBuilder> {
  factory MovieCredits([void Function(MovieCreditsBuilder b) updates]) =
      _$MovieCredits;

  MovieCredits._();

  @nullable
  @BuiltValueField(wireName: 'character')
  String get character;

  @nullable
  @BuiltValueField(wireName: 'credit_id')
  String get creditId;

  @nullable
  @BuiltValueField(wireName: 'release_date')
  String get releaseDate;

  @nullable
  @BuiltValueField(wireName: 'vote_count')
  int get voteCount;

  @nullable
  @BuiltValueField(wireName: 'video')
  bool get video;

  @nullable
  @BuiltValueField(wireName: 'adult')
  bool get adult;

  @nullable
  @BuiltValueField(wireName: 'vote_average')
  num get voteAverage;

  @nullable
  @BuiltValueField(wireName: 'title')
  String get title;

  @nullable
  @BuiltValueField(wireName: 'genre_ids')
  BuiltList<int> get genre;

  @nullable
  @BuiltValueField(wireName: 'original_language')
  String get originalLanguage;

  @nullable
  @BuiltValueField(wireName: 'original_title')
  String get originalTitle;

  @nullable
  @BuiltValueField(wireName: 'popularity')
  num get popularity;

  @nullable
  @BuiltValueField(wireName: 'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: 'backdrop_path')
  String get backDropPath;

  @nullable
  @BuiltValueField(wireName: 'overview')
  String get overview;

  @nullable
  @BuiltValueField(wireName: 'poster_path')
  String get posterPath;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(MovieCredits.serializer, this)
        as Map<String, dynamic>;
  }

  static MovieCredits fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(MovieCredits.serializer, jsonString);
  }

  static Serializer<MovieCredits> get serializer => _$movieCreditsSerializer;
}

abstract class TvCredits implements Built<TvCredits, TvCreditsBuilder> {
  factory TvCredits([void Function(TvCreditsBuilder b) updates]) = _$TvCredits;

  TvCredits._();
  @nullable
  @BuiltValueField(wireName: 'credit_id')
  String get creditId;

  @nullable
  @BuiltValueField(wireName: 'original_name')
  String get originalName;

  @nullable
  @BuiltValueField(wireName: 'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: 'genre_ids')
  BuiltList<int> get genreIds;

  @nullable
  @BuiltValueField(wireName: 'character')
  String get character;

  @nullable
  @BuiltValueField(wireName: 'name')
  String get name;

  @nullable
  @BuiltValueField(wireName: 'poster_path')
  String get posterPath;

  @nullable
  @BuiltValueField(wireName: 'vote_count')
  int get voteCount;

  @nullable
  @BuiltValueField(wireName: 'vote_average')
  num get voteAverage;

  @nullable
  @BuiltValueField(wireName: 'popularity')
  num get popularity;

  @nullable
  @BuiltValueField(wireName: 'episode_count')
  int get episodeCount;

  @nullable
  @BuiltValueField(wireName: 'original_language')
  String get originalLanguage;

  @nullable
  @BuiltValueField(wireName: 'first_air_date')
  String get firstAirDate;

  @nullable
  @BuiltValueField(wireName: 'backdrop_path')
  String get backDropPath;

  @nullable
  @BuiltValueField(wireName: 'overview')
  String get overview;

  @nullable
  @BuiltValueField(wireName: 'origin_country')
  BuiltList<String> get originCountry;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(TvCredits.serializer, this)
        as Map<String, dynamic>;
  }

  static TvCredits fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(TvCredits.serializer, jsonString);
  }

  static Serializer<TvCredits> get serializer => _$tvCreditsSerializer;
}

abstract class MovieCreditsResults
    implements Built<MovieCreditsResults, MovieCreditsResultsBuilder> {
  factory MovieCreditsResults(
          [void Function(MovieCreditsResultsBuilder b) updates]) =
      _$MovieCreditsResults;

  MovieCreditsResults._();
  @nullable
  @BuiltValueField(wireName: 'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: 'cast')
  BuiltList<MovieCredits> get movieCreditsResults;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(MovieCreditsResults.serializer, this)
        as Map<String, dynamic>;
  }

  static MovieCreditsResults fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(
        MovieCreditsResults.serializer, jsonString);
  }

  static Serializer<MovieCreditsResults> get serializer =>
      _$movieCreditsResultsSerializer;
}

abstract class TvCreditsResults
    implements Built<TvCreditsResults, TvCreditsResultsBuilder> {
  factory TvCreditsResults([void Function(TvCreditsResultsBuilder b) updates]) =
      _$TvCreditsResults;

  TvCreditsResults._();

  @nullable
  @BuiltValueField(wireName: 'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: 'cast')
  BuiltList<TvCredits> get tvCreditsResults;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(TvCreditsResults.serializer, this)
        as Map<String, dynamic>;
  }

  static TvCreditsResults fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(TvCreditsResults.serializer, jsonString);
  }

  static Serializer<TvCreditsResults> get serializer =>
      _$tvCreditsResultsSerializer;
}
