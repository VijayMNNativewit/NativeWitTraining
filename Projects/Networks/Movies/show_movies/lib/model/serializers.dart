library serializers;

import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'movie.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[
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
