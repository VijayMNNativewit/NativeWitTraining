library serializers;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'movie.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Movie,
  MovieResults,
  MovieGenre,
  MovieGenreResults,
  MovieCast,
  MovieCastResults,
  MovieDetails,
  MovieCredits,
  MovieCreditsResults,
  TvCredits,
  TvCreditsResults,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
