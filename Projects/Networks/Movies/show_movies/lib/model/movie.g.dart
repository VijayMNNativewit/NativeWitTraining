// GENERATED CODE - DO NOT MODIFY BY HAND

part of movie;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Movie> _$movieSerializer = new _$MovieSerializer();
Serializer<MovieResults> _$movieResultsSerializer =
    new _$MovieResultsSerializer();
Serializer<MovieGenre> _$movieGenreSerializer = new _$MovieGenreSerializer();
Serializer<MovieGenreResults> _$movieGenreResultsSerializer =
    new _$MovieGenreResultsSerializer();
Serializer<MovieCast> _$movieCastSerializer = new _$MovieCastSerializer();
Serializer<MovieCastResults> _$movieCastResultsSerializer =
    new _$MovieCastResultsSerializer();
Serializer<MovieDetails> _$movieDetailsSerializer =
    new _$MovieDetailsSerializer();
Serializer<MovieCredits> _$movieCreditsSerializer =
    new _$MovieCreditsSerializer();
Serializer<TvCredits> _$tvCreditsSerializer = new _$TvCreditsSerializer();
Serializer<MovieCreditsResults> _$movieCreditsResultsSerializer =
    new _$MovieCreditsResultsSerializer();
Serializer<TvCreditsResults> _$tvCreditsResultsSerializer =
    new _$TvCreditsResultsSerializer();

class _$MovieSerializer implements StructuredSerializer<Movie> {
  @override
  final Iterable<Type> types = const [Movie, _$Movie];
  @override
  final String wireName = 'Movie';

  @override
  Iterable<Object> serialize(Serializers serializers, Movie object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.adult;
    if (value != null) {
      result
        ..add('adult')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.backDropPath;
    if (value != null) {
      result
        ..add('backdrop_path')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.genreIds;
    if (value != null) {
      result
        ..add('genre_ids')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.originalLanguage;
    if (value != null) {
      result
        ..add('original_language')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.originalTitle;
    if (value != null) {
      result
        ..add('original_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.overview;
    if (value != null) {
      result
        ..add('overview')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.popularity;
    if (value != null) {
      result
        ..add('popularity')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.posterPath;
    if (value != null) {
      result
        ..add('poster_path')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.releaseDate;
    if (value != null) {
      result
        ..add('release_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.video;
    if (value != null) {
      result
        ..add('video')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.voteAverage;
    if (value != null) {
      result
        ..add('vote_average')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.voteCount;
    if (value != null) {
      result
        ..add('vote_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Movie deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'adult':
          result.adult = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'backdrop_path':
          result.backDropPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'genre_ids':
          result.genreIds.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<Object>);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'original_language':
          result.originalLanguage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'original_title':
          result.originalTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'overview':
          result.overview = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'popularity':
          result.popularity = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'poster_path':
          result.posterPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'release_date':
          result.releaseDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'video':
          result.video = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'vote_average':
          result.voteAverage = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'vote_count':
          result.voteCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$MovieResultsSerializer implements StructuredSerializer<MovieResults> {
  @override
  final Iterable<Type> types = const [MovieResults, _$MovieResults];
  @override
  final String wireName = 'MovieResults';

  @override
  Iterable<Object> serialize(Serializers serializers, MovieResults object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.page;
    if (value != null) {
      result
        ..add('page')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.totalPages;
    if (value != null) {
      result
        ..add('total_pages')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.totalResults;
    if (value != null) {
      result
        ..add('total_results')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.results;
    if (value != null) {
      result
        ..add('results')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Movie)])));
    }
    return result;
  }

  @override
  MovieResults deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieResultsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'page':
          result.page = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'total_pages':
          result.totalPages = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'total_results':
          result.totalResults = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'results':
          result.results.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Movie)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$MovieGenreSerializer implements StructuredSerializer<MovieGenre> {
  @override
  final Iterable<Type> types = const [MovieGenre, _$MovieGenre];
  @override
  final String wireName = 'MovieGenre';

  @override
  Iterable<Object> serialize(Serializers serializers, MovieGenre object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  MovieGenre deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieGenreBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$MovieGenreResultsSerializer
    implements StructuredSerializer<MovieGenreResults> {
  @override
  final Iterable<Type> types = const [MovieGenreResults, _$MovieGenreResults];
  @override
  final String wireName = 'MovieGenreResults';

  @override
  Iterable<Object> serialize(Serializers serializers, MovieGenreResults object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.results;
    if (value != null) {
      result
        ..add('genres')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(MovieGenre)])));
    }
    return result;
  }

  @override
  MovieGenreResults deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieGenreResultsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'genres':
          result.results.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MovieGenre)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$MovieCastSerializer implements StructuredSerializer<MovieCast> {
  @override
  final Iterable<Type> types = const [MovieCast, _$MovieCast];
  @override
  final String wireName = 'MovieCast';

  @override
  Iterable<Object> serialize(Serializers serializers, MovieCast object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.adult;
    if (value != null) {
      result
        ..add('adult')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.knownForDepartment;
    if (value != null) {
      result
        ..add('known_for_department')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.originalName;
    if (value != null) {
      result
        ..add('original_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.popularity;
    if (value != null) {
      result
        ..add('popularity')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.profilePath;
    if (value != null) {
      result
        ..add('profile_path')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.castId;
    if (value != null) {
      result
        ..add('cast_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.character;
    if (value != null) {
      result
        ..add('character')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.creditId;
    if (value != null) {
      result
        ..add('credit_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.order;
    if (value != null) {
      result
        ..add('order')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  MovieCast deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieCastBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'adult':
          result.adult = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'known_for_department':
          result.knownForDepartment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'original_name':
          result.originalName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'popularity':
          result.popularity = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'profile_path':
          result.profilePath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'cast_id':
          result.castId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'character':
          result.character = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'credit_id':
          result.creditId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'order':
          result.order = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$MovieCastResultsSerializer
    implements StructuredSerializer<MovieCastResults> {
  @override
  final Iterable<Type> types = const [MovieCastResults, _$MovieCastResults];
  @override
  final String wireName = 'MovieCastResults';

  @override
  Iterable<Object> serialize(Serializers serializers, MovieCastResults object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.castResults;
    if (value != null) {
      result
        ..add('cast')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(MovieCast)])));
    }
    return result;
  }

  @override
  MovieCastResults deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieCastResultsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'cast':
          result.castResults.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MovieCast)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$MovieDetailsSerializer implements StructuredSerializer<MovieDetails> {
  @override
  final Iterable<Type> types = const [MovieDetails, _$MovieDetails];
  @override
  final String wireName = 'MovieDetails';

  @override
  Iterable<Object> serialize(Serializers serializers, MovieDetails object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.originalTitle;
    if (value != null) {
      result
        ..add('original_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.runtime;
    if (value != null) {
      result
        ..add('runtime')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('genres')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(MovieGenre)])));
    }
    value = object.premiere;
    if (value != null) {
      result
        ..add('release_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.budget;
    if (value != null) {
      result
        ..add('budget')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.revenue;
    if (value != null) {
      result
        ..add('revenue')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.homepage;
    if (value != null) {
      result
        ..add('homepage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imdbId;
    if (value != null) {
      result
        ..add('imdb_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  MovieDetails deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieDetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'original_title':
          result.originalTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'runtime':
          result.runtime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'genres':
          result.type.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MovieGenre)]))
              as BuiltList<Object>);
          break;
        case 'release_date':
          result.premiere = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'budget':
          result.budget = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'revenue':
          result.revenue = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'homepage':
          result.homepage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'imdb_id':
          result.imdbId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$MovieCreditsSerializer implements StructuredSerializer<MovieCredits> {
  @override
  final Iterable<Type> types = const [MovieCredits, _$MovieCredits];
  @override
  final String wireName = 'MovieCredits';

  @override
  Iterable<Object> serialize(Serializers serializers, MovieCredits object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.character;
    if (value != null) {
      result
        ..add('character')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.creditId;
    if (value != null) {
      result
        ..add('credit_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.releaseDate;
    if (value != null) {
      result
        ..add('release_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.voteCount;
    if (value != null) {
      result
        ..add('vote_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.video;
    if (value != null) {
      result
        ..add('video')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.adult;
    if (value != null) {
      result
        ..add('adult')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.voteAverage;
    if (value != null) {
      result
        ..add('vote_average')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.genre;
    if (value != null) {
      result
        ..add('genre_ids')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.originalLanguage;
    if (value != null) {
      result
        ..add('original_language')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.originalTitle;
    if (value != null) {
      result
        ..add('original_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.popularity;
    if (value != null) {
      result
        ..add('popularity')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.backDropPath;
    if (value != null) {
      result
        ..add('backdrop_path')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.overview;
    if (value != null) {
      result
        ..add('overview')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.posterPath;
    if (value != null) {
      result
        ..add('poster_path')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  MovieCredits deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieCreditsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'character':
          result.character = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'credit_id':
          result.creditId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'release_date':
          result.releaseDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'vote_count':
          result.voteCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'video':
          result.video = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'adult':
          result.adult = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'vote_average':
          result.voteAverage = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'genre_ids':
          result.genre.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<Object>);
          break;
        case 'original_language':
          result.originalLanguage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'original_title':
          result.originalTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'popularity':
          result.popularity = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'backdrop_path':
          result.backDropPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'overview':
          result.overview = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'poster_path':
          result.posterPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$TvCreditsSerializer implements StructuredSerializer<TvCredits> {
  @override
  final Iterable<Type> types = const [TvCredits, _$TvCredits];
  @override
  final String wireName = 'TvCredits';

  @override
  Iterable<Object> serialize(Serializers serializers, TvCredits object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.creditId;
    if (value != null) {
      result
        ..add('credit_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.originalName;
    if (value != null) {
      result
        ..add('original_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.genreIds;
    if (value != null) {
      result
        ..add('genre_ids')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.character;
    if (value != null) {
      result
        ..add('character')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.posterPath;
    if (value != null) {
      result
        ..add('poster_path')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.voteCount;
    if (value != null) {
      result
        ..add('vote_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.voteAverage;
    if (value != null) {
      result
        ..add('vote_average')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.popularity;
    if (value != null) {
      result
        ..add('popularity')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.episodeCount;
    if (value != null) {
      result
        ..add('episode_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.originalLanguage;
    if (value != null) {
      result
        ..add('original_language')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.firstAirDate;
    if (value != null) {
      result
        ..add('first_air_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.backDropPath;
    if (value != null) {
      result
        ..add('backdrop_path')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.overview;
    if (value != null) {
      result
        ..add('overview')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.originCountry;
    if (value != null) {
      result
        ..add('origin_country')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  TvCredits deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TvCreditsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'credit_id':
          result.creditId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'original_name':
          result.originalName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'genre_ids':
          result.genreIds.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<Object>);
          break;
        case 'character':
          result.character = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'poster_path':
          result.posterPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'vote_count':
          result.voteCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'vote_average':
          result.voteAverage = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'popularity':
          result.popularity = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'episode_count':
          result.episodeCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'original_language':
          result.originalLanguage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'first_air_date':
          result.firstAirDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'backdrop_path':
          result.backDropPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'overview':
          result.overview = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'origin_country':
          result.originCountry.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$MovieCreditsResultsSerializer
    implements StructuredSerializer<MovieCreditsResults> {
  @override
  final Iterable<Type> types = const [
    MovieCreditsResults,
    _$MovieCreditsResults
  ];
  @override
  final String wireName = 'MovieCreditsResults';

  @override
  Iterable<Object> serialize(
      Serializers serializers, MovieCreditsResults object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.movieCreditsResults;
    if (value != null) {
      result
        ..add('cast')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(MovieCredits)])));
    }
    return result;
  }

  @override
  MovieCreditsResults deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieCreditsResultsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'cast':
          result.movieCreditsResults.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MovieCredits)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$TvCreditsResultsSerializer
    implements StructuredSerializer<TvCreditsResults> {
  @override
  final Iterable<Type> types = const [TvCreditsResults, _$TvCreditsResults];
  @override
  final String wireName = 'TvCreditsResults';

  @override
  Iterable<Object> serialize(Serializers serializers, TvCreditsResults object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.tvCreditsResults;
    if (value != null) {
      result
        ..add('cast')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(TvCredits)])));
    }
    return result;
  }

  @override
  TvCreditsResults deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TvCreditsResultsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'cast':
          result.tvCreditsResults.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(TvCredits)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$Movie extends Movie {
  @override
  final bool adult;
  @override
  final String backDropPath;
  @override
  final BuiltList<int> genreIds;
  @override
  final int id;
  @override
  final String originalLanguage;
  @override
  final String originalTitle;
  @override
  final String overview;
  @override
  final num popularity;
  @override
  final String posterPath;
  @override
  final String releaseDate;
  @override
  final String title;
  @override
  final bool video;
  @override
  final num voteAverage;
  @override
  final int voteCount;

  factory _$Movie([void Function(MovieBuilder) updates]) =>
      (new MovieBuilder()..update(updates)).build();

  _$Movie._(
      {this.adult,
      this.backDropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount})
      : super._();

  @override
  Movie rebuild(void Function(MovieBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieBuilder toBuilder() => new MovieBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Movie &&
        adult == other.adult &&
        backDropPath == other.backDropPath &&
        genreIds == other.genreIds &&
        id == other.id &&
        originalLanguage == other.originalLanguage &&
        originalTitle == other.originalTitle &&
        overview == other.overview &&
        popularity == other.popularity &&
        posterPath == other.posterPath &&
        releaseDate == other.releaseDate &&
        title == other.title &&
        video == other.video &&
        voteAverage == other.voteAverage &&
        voteCount == other.voteCount;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc($jc(0, adult.hashCode),
                                                        backDropPath.hashCode),
                                                    genreIds.hashCode),
                                                id.hashCode),
                                            originalLanguage.hashCode),
                                        originalTitle.hashCode),
                                    overview.hashCode),
                                popularity.hashCode),
                            posterPath.hashCode),
                        releaseDate.hashCode),
                    title.hashCode),
                video.hashCode),
            voteAverage.hashCode),
        voteCount.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Movie')
          ..add('adult', adult)
          ..add('backDropPath', backDropPath)
          ..add('genreIds', genreIds)
          ..add('id', id)
          ..add('originalLanguage', originalLanguage)
          ..add('originalTitle', originalTitle)
          ..add('overview', overview)
          ..add('popularity', popularity)
          ..add('posterPath', posterPath)
          ..add('releaseDate', releaseDate)
          ..add('title', title)
          ..add('video', video)
          ..add('voteAverage', voteAverage)
          ..add('voteCount', voteCount))
        .toString();
  }
}

class MovieBuilder implements Builder<Movie, MovieBuilder> {
  _$Movie _$v;

  bool _adult;
  bool get adult => _$this._adult;
  set adult(bool adult) => _$this._adult = adult;

  String _backDropPath;
  String get backDropPath => _$this._backDropPath;
  set backDropPath(String backDropPath) => _$this._backDropPath = backDropPath;

  ListBuilder<int> _genreIds;
  ListBuilder<int> get genreIds => _$this._genreIds ??= new ListBuilder<int>();
  set genreIds(ListBuilder<int> genreIds) => _$this._genreIds = genreIds;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _originalLanguage;
  String get originalLanguage => _$this._originalLanguage;
  set originalLanguage(String originalLanguage) =>
      _$this._originalLanguage = originalLanguage;

  String _originalTitle;
  String get originalTitle => _$this._originalTitle;
  set originalTitle(String originalTitle) =>
      _$this._originalTitle = originalTitle;

  String _overview;
  String get overview => _$this._overview;
  set overview(String overview) => _$this._overview = overview;

  num _popularity;
  num get popularity => _$this._popularity;
  set popularity(num popularity) => _$this._popularity = popularity;

  String _posterPath;
  String get posterPath => _$this._posterPath;
  set posterPath(String posterPath) => _$this._posterPath = posterPath;

  String _releaseDate;
  String get releaseDate => _$this._releaseDate;
  set releaseDate(String releaseDate) => _$this._releaseDate = releaseDate;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  bool _video;
  bool get video => _$this._video;
  set video(bool video) => _$this._video = video;

  num _voteAverage;
  num get voteAverage => _$this._voteAverage;
  set voteAverage(num voteAverage) => _$this._voteAverage = voteAverage;

  int _voteCount;
  int get voteCount => _$this._voteCount;
  set voteCount(int voteCount) => _$this._voteCount = voteCount;

  MovieBuilder();

  MovieBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _adult = $v.adult;
      _backDropPath = $v.backDropPath;
      _genreIds = $v.genreIds?.toBuilder();
      _id = $v.id;
      _originalLanguage = $v.originalLanguage;
      _originalTitle = $v.originalTitle;
      _overview = $v.overview;
      _popularity = $v.popularity;
      _posterPath = $v.posterPath;
      _releaseDate = $v.releaseDate;
      _title = $v.title;
      _video = $v.video;
      _voteAverage = $v.voteAverage;
      _voteCount = $v.voteCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Movie other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Movie;
  }

  @override
  void update(void Function(MovieBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Movie build() {
    _$Movie _$result;
    try {
      _$result = _$v ??
          new _$Movie._(
              adult: adult,
              backDropPath: backDropPath,
              genreIds: _genreIds?.build(),
              id: id,
              originalLanguage: originalLanguage,
              originalTitle: originalTitle,
              overview: overview,
              popularity: popularity,
              posterPath: posterPath,
              releaseDate: releaseDate,
              title: title,
              video: video,
              voteAverage: voteAverage,
              voteCount: voteCount);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'genreIds';
        _genreIds?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Movie', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MovieResults extends MovieResults {
  @override
  final int page;
  @override
  final int totalPages;
  @override
  final int totalResults;
  @override
  final BuiltList<Movie> results;

  factory _$MovieResults([void Function(MovieResultsBuilder) updates]) =>
      (new MovieResultsBuilder()..update(updates)).build();

  _$MovieResults._(
      {this.page, this.totalPages, this.totalResults, this.results})
      : super._();

  @override
  MovieResults rebuild(void Function(MovieResultsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieResultsBuilder toBuilder() => new MovieResultsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MovieResults &&
        page == other.page &&
        totalPages == other.totalPages &&
        totalResults == other.totalResults &&
        results == other.results;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, page.hashCode), totalPages.hashCode),
            totalResults.hashCode),
        results.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MovieResults')
          ..add('page', page)
          ..add('totalPages', totalPages)
          ..add('totalResults', totalResults)
          ..add('results', results))
        .toString();
  }
}

class MovieResultsBuilder
    implements Builder<MovieResults, MovieResultsBuilder> {
  _$MovieResults _$v;

  int _page;
  int get page => _$this._page;
  set page(int page) => _$this._page = page;

  int _totalPages;
  int get totalPages => _$this._totalPages;
  set totalPages(int totalPages) => _$this._totalPages = totalPages;

  int _totalResults;
  int get totalResults => _$this._totalResults;
  set totalResults(int totalResults) => _$this._totalResults = totalResults;

  ListBuilder<Movie> _results;
  ListBuilder<Movie> get results =>
      _$this._results ??= new ListBuilder<Movie>();
  set results(ListBuilder<Movie> results) => _$this._results = results;

  MovieResultsBuilder();

  MovieResultsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _page = $v.page;
      _totalPages = $v.totalPages;
      _totalResults = $v.totalResults;
      _results = $v.results?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MovieResults other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MovieResults;
  }

  @override
  void update(void Function(MovieResultsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MovieResults build() {
    _$MovieResults _$result;
    try {
      _$result = _$v ??
          new _$MovieResults._(
              page: page,
              totalPages: totalPages,
              totalResults: totalResults,
              results: _results?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'results';
        _results?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MovieResults', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MovieGenre extends MovieGenre {
  @override
  final int id;
  @override
  final String name;

  factory _$MovieGenre([void Function(MovieGenreBuilder) updates]) =>
      (new MovieGenreBuilder()..update(updates)).build();

  _$MovieGenre._({this.id, this.name}) : super._();

  @override
  MovieGenre rebuild(void Function(MovieGenreBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieGenreBuilder toBuilder() => new MovieGenreBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MovieGenre && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MovieGenre')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class MovieGenreBuilder implements Builder<MovieGenre, MovieGenreBuilder> {
  _$MovieGenre _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  MovieGenreBuilder();

  MovieGenreBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MovieGenre other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MovieGenre;
  }

  @override
  void update(void Function(MovieGenreBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MovieGenre build() {
    final _$result = _$v ?? new _$MovieGenre._(id: id, name: name);
    replace(_$result);
    return _$result;
  }
}

class _$MovieGenreResults extends MovieGenreResults {
  @override
  final BuiltList<MovieGenre> results;

  factory _$MovieGenreResults(
          [void Function(MovieGenreResultsBuilder) updates]) =>
      (new MovieGenreResultsBuilder()..update(updates)).build();

  _$MovieGenreResults._({this.results}) : super._();

  @override
  MovieGenreResults rebuild(void Function(MovieGenreResultsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieGenreResultsBuilder toBuilder() =>
      new MovieGenreResultsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MovieGenreResults && results == other.results;
  }

  @override
  int get hashCode {
    return $jf($jc(0, results.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MovieGenreResults')
          ..add('results', results))
        .toString();
  }
}

class MovieGenreResultsBuilder
    implements Builder<MovieGenreResults, MovieGenreResultsBuilder> {
  _$MovieGenreResults _$v;

  ListBuilder<MovieGenre> _results;
  ListBuilder<MovieGenre> get results =>
      _$this._results ??= new ListBuilder<MovieGenre>();
  set results(ListBuilder<MovieGenre> results) => _$this._results = results;

  MovieGenreResultsBuilder();

  MovieGenreResultsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _results = $v.results?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MovieGenreResults other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MovieGenreResults;
  }

  @override
  void update(void Function(MovieGenreResultsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MovieGenreResults build() {
    _$MovieGenreResults _$result;
    try {
      _$result = _$v ?? new _$MovieGenreResults._(results: _results?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'results';
        _results?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MovieGenreResults', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MovieCast extends MovieCast {
  @override
  final bool adult;
  @override
  final int gender;
  @override
  final int id;
  @override
  final String knownForDepartment;
  @override
  final String name;
  @override
  final String originalName;
  @override
  final num popularity;
  @override
  final String profilePath;
  @override
  final int castId;
  @override
  final String character;
  @override
  final String creditId;
  @override
  final int order;

  factory _$MovieCast([void Function(MovieCastBuilder) updates]) =>
      (new MovieCastBuilder()..update(updates)).build();

  _$MovieCast._(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.castId,
      this.character,
      this.creditId,
      this.order})
      : super._();

  @override
  MovieCast rebuild(void Function(MovieCastBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieCastBuilder toBuilder() => new MovieCastBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MovieCast &&
        adult == other.adult &&
        gender == other.gender &&
        id == other.id &&
        knownForDepartment == other.knownForDepartment &&
        name == other.name &&
        originalName == other.originalName &&
        popularity == other.popularity &&
        profilePath == other.profilePath &&
        castId == other.castId &&
        character == other.character &&
        creditId == other.creditId &&
        order == other.order;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, adult.hashCode),
                                                gender.hashCode),
                                            id.hashCode),
                                        knownForDepartment.hashCode),
                                    name.hashCode),
                                originalName.hashCode),
                            popularity.hashCode),
                        profilePath.hashCode),
                    castId.hashCode),
                character.hashCode),
            creditId.hashCode),
        order.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MovieCast')
          ..add('adult', adult)
          ..add('gender', gender)
          ..add('id', id)
          ..add('knownForDepartment', knownForDepartment)
          ..add('name', name)
          ..add('originalName', originalName)
          ..add('popularity', popularity)
          ..add('profilePath', profilePath)
          ..add('castId', castId)
          ..add('character', character)
          ..add('creditId', creditId)
          ..add('order', order))
        .toString();
  }
}

class MovieCastBuilder implements Builder<MovieCast, MovieCastBuilder> {
  _$MovieCast _$v;

  bool _adult;
  bool get adult => _$this._adult;
  set adult(bool adult) => _$this._adult = adult;

  int _gender;
  int get gender => _$this._gender;
  set gender(int gender) => _$this._gender = gender;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _knownForDepartment;
  String get knownForDepartment => _$this._knownForDepartment;
  set knownForDepartment(String knownForDepartment) =>
      _$this._knownForDepartment = knownForDepartment;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _originalName;
  String get originalName => _$this._originalName;
  set originalName(String originalName) => _$this._originalName = originalName;

  num _popularity;
  num get popularity => _$this._popularity;
  set popularity(num popularity) => _$this._popularity = popularity;

  String _profilePath;
  String get profilePath => _$this._profilePath;
  set profilePath(String profilePath) => _$this._profilePath = profilePath;

  int _castId;
  int get castId => _$this._castId;
  set castId(int castId) => _$this._castId = castId;

  String _character;
  String get character => _$this._character;
  set character(String character) => _$this._character = character;

  String _creditId;
  String get creditId => _$this._creditId;
  set creditId(String creditId) => _$this._creditId = creditId;

  int _order;
  int get order => _$this._order;
  set order(int order) => _$this._order = order;

  MovieCastBuilder();

  MovieCastBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _adult = $v.adult;
      _gender = $v.gender;
      _id = $v.id;
      _knownForDepartment = $v.knownForDepartment;
      _name = $v.name;
      _originalName = $v.originalName;
      _popularity = $v.popularity;
      _profilePath = $v.profilePath;
      _castId = $v.castId;
      _character = $v.character;
      _creditId = $v.creditId;
      _order = $v.order;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MovieCast other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MovieCast;
  }

  @override
  void update(void Function(MovieCastBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MovieCast build() {
    final _$result = _$v ??
        new _$MovieCast._(
            adult: adult,
            gender: gender,
            id: id,
            knownForDepartment: knownForDepartment,
            name: name,
            originalName: originalName,
            popularity: popularity,
            profilePath: profilePath,
            castId: castId,
            character: character,
            creditId: creditId,
            order: order);
    replace(_$result);
    return _$result;
  }
}

class _$MovieCastResults extends MovieCastResults {
  @override
  final int id;
  @override
  final BuiltList<MovieCast> castResults;

  factory _$MovieCastResults(
          [void Function(MovieCastResultsBuilder) updates]) =>
      (new MovieCastResultsBuilder()..update(updates)).build();

  _$MovieCastResults._({this.id, this.castResults}) : super._();

  @override
  MovieCastResults rebuild(void Function(MovieCastResultsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieCastResultsBuilder toBuilder() =>
      new MovieCastResultsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MovieCastResults &&
        id == other.id &&
        castResults == other.castResults;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), castResults.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MovieCastResults')
          ..add('id', id)
          ..add('castResults', castResults))
        .toString();
  }
}

class MovieCastResultsBuilder
    implements Builder<MovieCastResults, MovieCastResultsBuilder> {
  _$MovieCastResults _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  ListBuilder<MovieCast> _castResults;
  ListBuilder<MovieCast> get castResults =>
      _$this._castResults ??= new ListBuilder<MovieCast>();
  set castResults(ListBuilder<MovieCast> castResults) =>
      _$this._castResults = castResults;

  MovieCastResultsBuilder();

  MovieCastResultsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _castResults = $v.castResults?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MovieCastResults other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MovieCastResults;
  }

  @override
  void update(void Function(MovieCastResultsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MovieCastResults build() {
    _$MovieCastResults _$result;
    try {
      _$result = _$v ??
          new _$MovieCastResults._(id: id, castResults: _castResults?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'castResults';
        _castResults?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MovieCastResults', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MovieDetails extends MovieDetails {
  @override
  final String originalTitle;
  @override
  final String status;
  @override
  final int runtime;
  @override
  final BuiltList<MovieGenre> type;
  @override
  final String premiere;
  @override
  final int budget;
  @override
  final int revenue;
  @override
  final String homepage;
  @override
  final String imdbId;

  factory _$MovieDetails([void Function(MovieDetailsBuilder) updates]) =>
      (new MovieDetailsBuilder()..update(updates)).build();

  _$MovieDetails._(
      {this.originalTitle,
      this.status,
      this.runtime,
      this.type,
      this.premiere,
      this.budget,
      this.revenue,
      this.homepage,
      this.imdbId})
      : super._();

  @override
  MovieDetails rebuild(void Function(MovieDetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieDetailsBuilder toBuilder() => new MovieDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MovieDetails &&
        originalTitle == other.originalTitle &&
        status == other.status &&
        runtime == other.runtime &&
        type == other.type &&
        premiere == other.premiere &&
        budget == other.budget &&
        revenue == other.revenue &&
        homepage == other.homepage &&
        imdbId == other.imdbId;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc(0, originalTitle.hashCode),
                                    status.hashCode),
                                runtime.hashCode),
                            type.hashCode),
                        premiere.hashCode),
                    budget.hashCode),
                revenue.hashCode),
            homepage.hashCode),
        imdbId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MovieDetails')
          ..add('originalTitle', originalTitle)
          ..add('status', status)
          ..add('runtime', runtime)
          ..add('type', type)
          ..add('premiere', premiere)
          ..add('budget', budget)
          ..add('revenue', revenue)
          ..add('homepage', homepage)
          ..add('imdbId', imdbId))
        .toString();
  }
}

class MovieDetailsBuilder
    implements Builder<MovieDetails, MovieDetailsBuilder> {
  _$MovieDetails _$v;

  String _originalTitle;
  String get originalTitle => _$this._originalTitle;
  set originalTitle(String originalTitle) =>
      _$this._originalTitle = originalTitle;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  int _runtime;
  int get runtime => _$this._runtime;
  set runtime(int runtime) => _$this._runtime = runtime;

  ListBuilder<MovieGenre> _type;
  ListBuilder<MovieGenre> get type =>
      _$this._type ??= new ListBuilder<MovieGenre>();
  set type(ListBuilder<MovieGenre> type) => _$this._type = type;

  String _premiere;
  String get premiere => _$this._premiere;
  set premiere(String premiere) => _$this._premiere = premiere;

  int _budget;
  int get budget => _$this._budget;
  set budget(int budget) => _$this._budget = budget;

  int _revenue;
  int get revenue => _$this._revenue;
  set revenue(int revenue) => _$this._revenue = revenue;

  String _homepage;
  String get homepage => _$this._homepage;
  set homepage(String homepage) => _$this._homepage = homepage;

  String _imdbId;
  String get imdbId => _$this._imdbId;
  set imdbId(String imdbId) => _$this._imdbId = imdbId;

  MovieDetailsBuilder();

  MovieDetailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _originalTitle = $v.originalTitle;
      _status = $v.status;
      _runtime = $v.runtime;
      _type = $v.type?.toBuilder();
      _premiere = $v.premiere;
      _budget = $v.budget;
      _revenue = $v.revenue;
      _homepage = $v.homepage;
      _imdbId = $v.imdbId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MovieDetails other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MovieDetails;
  }

  @override
  void update(void Function(MovieDetailsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MovieDetails build() {
    _$MovieDetails _$result;
    try {
      _$result = _$v ??
          new _$MovieDetails._(
              originalTitle: originalTitle,
              status: status,
              runtime: runtime,
              type: _type?.build(),
              premiere: premiere,
              budget: budget,
              revenue: revenue,
              homepage: homepage,
              imdbId: imdbId);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'type';
        _type?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MovieDetails', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MovieCredits extends MovieCredits {
  @override
  final String character;
  @override
  final String creditId;
  @override
  final String releaseDate;
  @override
  final int voteCount;
  @override
  final bool video;
  @override
  final bool adult;
  @override
  final num voteAverage;
  @override
  final String title;
  @override
  final BuiltList<int> genre;
  @override
  final String originalLanguage;
  @override
  final String originalTitle;
  @override
  final num popularity;
  @override
  final int id;
  @override
  final String backDropPath;
  @override
  final String overview;
  @override
  final String posterPath;

  factory _$MovieCredits([void Function(MovieCreditsBuilder) updates]) =>
      (new MovieCreditsBuilder()..update(updates)).build();

  _$MovieCredits._(
      {this.character,
      this.creditId,
      this.releaseDate,
      this.voteCount,
      this.video,
      this.adult,
      this.voteAverage,
      this.title,
      this.genre,
      this.originalLanguage,
      this.originalTitle,
      this.popularity,
      this.id,
      this.backDropPath,
      this.overview,
      this.posterPath})
      : super._();

  @override
  MovieCredits rebuild(void Function(MovieCreditsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieCreditsBuilder toBuilder() => new MovieCreditsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MovieCredits &&
        character == other.character &&
        creditId == other.creditId &&
        releaseDate == other.releaseDate &&
        voteCount == other.voteCount &&
        video == other.video &&
        adult == other.adult &&
        voteAverage == other.voteAverage &&
        title == other.title &&
        genre == other.genre &&
        originalLanguage == other.originalLanguage &&
        originalTitle == other.originalTitle &&
        popularity == other.popularity &&
        id == other.id &&
        backDropPath == other.backDropPath &&
        overview == other.overview &&
        posterPath == other.posterPath;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    0,
                                                                    character
                                                                        .hashCode),
                                                                creditId
                                                                    .hashCode),
                                                            releaseDate
                                                                .hashCode),
                                                        voteCount.hashCode),
                                                    video.hashCode),
                                                adult.hashCode),
                                            voteAverage.hashCode),
                                        title.hashCode),
                                    genre.hashCode),
                                originalLanguage.hashCode),
                            originalTitle.hashCode),
                        popularity.hashCode),
                    id.hashCode),
                backDropPath.hashCode),
            overview.hashCode),
        posterPath.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MovieCredits')
          ..add('character', character)
          ..add('creditId', creditId)
          ..add('releaseDate', releaseDate)
          ..add('voteCount', voteCount)
          ..add('video', video)
          ..add('adult', adult)
          ..add('voteAverage', voteAverage)
          ..add('title', title)
          ..add('genre', genre)
          ..add('originalLanguage', originalLanguage)
          ..add('originalTitle', originalTitle)
          ..add('popularity', popularity)
          ..add('id', id)
          ..add('backDropPath', backDropPath)
          ..add('overview', overview)
          ..add('posterPath', posterPath))
        .toString();
  }
}

class MovieCreditsBuilder
    implements Builder<MovieCredits, MovieCreditsBuilder> {
  _$MovieCredits _$v;

  String _character;
  String get character => _$this._character;
  set character(String character) => _$this._character = character;

  String _creditId;
  String get creditId => _$this._creditId;
  set creditId(String creditId) => _$this._creditId = creditId;

  String _releaseDate;
  String get releaseDate => _$this._releaseDate;
  set releaseDate(String releaseDate) => _$this._releaseDate = releaseDate;

  int _voteCount;
  int get voteCount => _$this._voteCount;
  set voteCount(int voteCount) => _$this._voteCount = voteCount;

  bool _video;
  bool get video => _$this._video;
  set video(bool video) => _$this._video = video;

  bool _adult;
  bool get adult => _$this._adult;
  set adult(bool adult) => _$this._adult = adult;

  num _voteAverage;
  num get voteAverage => _$this._voteAverage;
  set voteAverage(num voteAverage) => _$this._voteAverage = voteAverage;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  ListBuilder<int> _genre;
  ListBuilder<int> get genre => _$this._genre ??= new ListBuilder<int>();
  set genre(ListBuilder<int> genre) => _$this._genre = genre;

  String _originalLanguage;
  String get originalLanguage => _$this._originalLanguage;
  set originalLanguage(String originalLanguage) =>
      _$this._originalLanguage = originalLanguage;

  String _originalTitle;
  String get originalTitle => _$this._originalTitle;
  set originalTitle(String originalTitle) =>
      _$this._originalTitle = originalTitle;

  num _popularity;
  num get popularity => _$this._popularity;
  set popularity(num popularity) => _$this._popularity = popularity;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _backDropPath;
  String get backDropPath => _$this._backDropPath;
  set backDropPath(String backDropPath) => _$this._backDropPath = backDropPath;

  String _overview;
  String get overview => _$this._overview;
  set overview(String overview) => _$this._overview = overview;

  String _posterPath;
  String get posterPath => _$this._posterPath;
  set posterPath(String posterPath) => _$this._posterPath = posterPath;

  MovieCreditsBuilder();

  MovieCreditsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _character = $v.character;
      _creditId = $v.creditId;
      _releaseDate = $v.releaseDate;
      _voteCount = $v.voteCount;
      _video = $v.video;
      _adult = $v.adult;
      _voteAverage = $v.voteAverage;
      _title = $v.title;
      _genre = $v.genre?.toBuilder();
      _originalLanguage = $v.originalLanguage;
      _originalTitle = $v.originalTitle;
      _popularity = $v.popularity;
      _id = $v.id;
      _backDropPath = $v.backDropPath;
      _overview = $v.overview;
      _posterPath = $v.posterPath;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MovieCredits other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MovieCredits;
  }

  @override
  void update(void Function(MovieCreditsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MovieCredits build() {
    _$MovieCredits _$result;
    try {
      _$result = _$v ??
          new _$MovieCredits._(
              character: character,
              creditId: creditId,
              releaseDate: releaseDate,
              voteCount: voteCount,
              video: video,
              adult: adult,
              voteAverage: voteAverage,
              title: title,
              genre: _genre?.build(),
              originalLanguage: originalLanguage,
              originalTitle: originalTitle,
              popularity: popularity,
              id: id,
              backDropPath: backDropPath,
              overview: overview,
              posterPath: posterPath);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'genre';
        _genre?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MovieCredits', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$TvCredits extends TvCredits {
  @override
  final String creditId;
  @override
  final String originalName;
  @override
  final int id;
  @override
  final BuiltList<int> genreIds;
  @override
  final String character;
  @override
  final String name;
  @override
  final String posterPath;
  @override
  final int voteCount;
  @override
  final num voteAverage;
  @override
  final num popularity;
  @override
  final int episodeCount;
  @override
  final String originalLanguage;
  @override
  final String firstAirDate;
  @override
  final String backDropPath;
  @override
  final String overview;
  @override
  final BuiltList<String> originCountry;

  factory _$TvCredits([void Function(TvCreditsBuilder) updates]) =>
      (new TvCreditsBuilder()..update(updates)).build();

  _$TvCredits._(
      {this.creditId,
      this.originalName,
      this.id,
      this.genreIds,
      this.character,
      this.name,
      this.posterPath,
      this.voteCount,
      this.voteAverage,
      this.popularity,
      this.episodeCount,
      this.originalLanguage,
      this.firstAirDate,
      this.backDropPath,
      this.overview,
      this.originCountry})
      : super._();

  @override
  TvCredits rebuild(void Function(TvCreditsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TvCreditsBuilder toBuilder() => new TvCreditsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TvCredits &&
        creditId == other.creditId &&
        originalName == other.originalName &&
        id == other.id &&
        genreIds == other.genreIds &&
        character == other.character &&
        name == other.name &&
        posterPath == other.posterPath &&
        voteCount == other.voteCount &&
        voteAverage == other.voteAverage &&
        popularity == other.popularity &&
        episodeCount == other.episodeCount &&
        originalLanguage == other.originalLanguage &&
        firstAirDate == other.firstAirDate &&
        backDropPath == other.backDropPath &&
        overview == other.overview &&
        originCountry == other.originCountry;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    0,
                                                                    creditId
                                                                        .hashCode),
                                                                originalName
                                                                    .hashCode),
                                                            id.hashCode),
                                                        genreIds.hashCode),
                                                    character.hashCode),
                                                name.hashCode),
                                            posterPath.hashCode),
                                        voteCount.hashCode),
                                    voteAverage.hashCode),
                                popularity.hashCode),
                            episodeCount.hashCode),
                        originalLanguage.hashCode),
                    firstAirDate.hashCode),
                backDropPath.hashCode),
            overview.hashCode),
        originCountry.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TvCredits')
          ..add('creditId', creditId)
          ..add('originalName', originalName)
          ..add('id', id)
          ..add('genreIds', genreIds)
          ..add('character', character)
          ..add('name', name)
          ..add('posterPath', posterPath)
          ..add('voteCount', voteCount)
          ..add('voteAverage', voteAverage)
          ..add('popularity', popularity)
          ..add('episodeCount', episodeCount)
          ..add('originalLanguage', originalLanguage)
          ..add('firstAirDate', firstAirDate)
          ..add('backDropPath', backDropPath)
          ..add('overview', overview)
          ..add('originCountry', originCountry))
        .toString();
  }
}

class TvCreditsBuilder implements Builder<TvCredits, TvCreditsBuilder> {
  _$TvCredits _$v;

  String _creditId;
  String get creditId => _$this._creditId;
  set creditId(String creditId) => _$this._creditId = creditId;

  String _originalName;
  String get originalName => _$this._originalName;
  set originalName(String originalName) => _$this._originalName = originalName;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  ListBuilder<int> _genreIds;
  ListBuilder<int> get genreIds => _$this._genreIds ??= new ListBuilder<int>();
  set genreIds(ListBuilder<int> genreIds) => _$this._genreIds = genreIds;

  String _character;
  String get character => _$this._character;
  set character(String character) => _$this._character = character;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _posterPath;
  String get posterPath => _$this._posterPath;
  set posterPath(String posterPath) => _$this._posterPath = posterPath;

  int _voteCount;
  int get voteCount => _$this._voteCount;
  set voteCount(int voteCount) => _$this._voteCount = voteCount;

  num _voteAverage;
  num get voteAverage => _$this._voteAverage;
  set voteAverage(num voteAverage) => _$this._voteAverage = voteAverage;

  num _popularity;
  num get popularity => _$this._popularity;
  set popularity(num popularity) => _$this._popularity = popularity;

  int _episodeCount;
  int get episodeCount => _$this._episodeCount;
  set episodeCount(int episodeCount) => _$this._episodeCount = episodeCount;

  String _originalLanguage;
  String get originalLanguage => _$this._originalLanguage;
  set originalLanguage(String originalLanguage) =>
      _$this._originalLanguage = originalLanguage;

  String _firstAirDate;
  String get firstAirDate => _$this._firstAirDate;
  set firstAirDate(String firstAirDate) => _$this._firstAirDate = firstAirDate;

  String _backDropPath;
  String get backDropPath => _$this._backDropPath;
  set backDropPath(String backDropPath) => _$this._backDropPath = backDropPath;

  String _overview;
  String get overview => _$this._overview;
  set overview(String overview) => _$this._overview = overview;

  ListBuilder<String> _originCountry;
  ListBuilder<String> get originCountry =>
      _$this._originCountry ??= new ListBuilder<String>();
  set originCountry(ListBuilder<String> originCountry) =>
      _$this._originCountry = originCountry;

  TvCreditsBuilder();

  TvCreditsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _creditId = $v.creditId;
      _originalName = $v.originalName;
      _id = $v.id;
      _genreIds = $v.genreIds?.toBuilder();
      _character = $v.character;
      _name = $v.name;
      _posterPath = $v.posterPath;
      _voteCount = $v.voteCount;
      _voteAverage = $v.voteAverage;
      _popularity = $v.popularity;
      _episodeCount = $v.episodeCount;
      _originalLanguage = $v.originalLanguage;
      _firstAirDate = $v.firstAirDate;
      _backDropPath = $v.backDropPath;
      _overview = $v.overview;
      _originCountry = $v.originCountry?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TvCredits other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TvCredits;
  }

  @override
  void update(void Function(TvCreditsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TvCredits build() {
    _$TvCredits _$result;
    try {
      _$result = _$v ??
          new _$TvCredits._(
              creditId: creditId,
              originalName: originalName,
              id: id,
              genreIds: _genreIds?.build(),
              character: character,
              name: name,
              posterPath: posterPath,
              voteCount: voteCount,
              voteAverage: voteAverage,
              popularity: popularity,
              episodeCount: episodeCount,
              originalLanguage: originalLanguage,
              firstAirDate: firstAirDate,
              backDropPath: backDropPath,
              overview: overview,
              originCountry: _originCountry?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'genreIds';
        _genreIds?.build();

        _$failedField = 'originCountry';
        _originCountry?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TvCredits', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MovieCreditsResults extends MovieCreditsResults {
  @override
  final int id;
  @override
  final BuiltList<MovieCredits> movieCreditsResults;

  factory _$MovieCreditsResults(
          [void Function(MovieCreditsResultsBuilder) updates]) =>
      (new MovieCreditsResultsBuilder()..update(updates)).build();

  _$MovieCreditsResults._({this.id, this.movieCreditsResults}) : super._();

  @override
  MovieCreditsResults rebuild(
          void Function(MovieCreditsResultsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieCreditsResultsBuilder toBuilder() =>
      new MovieCreditsResultsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MovieCreditsResults &&
        id == other.id &&
        movieCreditsResults == other.movieCreditsResults;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), movieCreditsResults.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MovieCreditsResults')
          ..add('id', id)
          ..add('movieCreditsResults', movieCreditsResults))
        .toString();
  }
}

class MovieCreditsResultsBuilder
    implements Builder<MovieCreditsResults, MovieCreditsResultsBuilder> {
  _$MovieCreditsResults _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  ListBuilder<MovieCredits> _movieCreditsResults;
  ListBuilder<MovieCredits> get movieCreditsResults =>
      _$this._movieCreditsResults ??= new ListBuilder<MovieCredits>();
  set movieCreditsResults(ListBuilder<MovieCredits> movieCreditsResults) =>
      _$this._movieCreditsResults = movieCreditsResults;

  MovieCreditsResultsBuilder();

  MovieCreditsResultsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _movieCreditsResults = $v.movieCreditsResults?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MovieCreditsResults other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MovieCreditsResults;
  }

  @override
  void update(void Function(MovieCreditsResultsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MovieCreditsResults build() {
    _$MovieCreditsResults _$result;
    try {
      _$result = _$v ??
          new _$MovieCreditsResults._(
              id: id, movieCreditsResults: _movieCreditsResults?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'movieCreditsResults';
        _movieCreditsResults?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MovieCreditsResults', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$TvCreditsResults extends TvCreditsResults {
  @override
  final int id;
  @override
  final BuiltList<TvCredits> tvCreditsResults;

  factory _$TvCreditsResults(
          [void Function(TvCreditsResultsBuilder) updates]) =>
      (new TvCreditsResultsBuilder()..update(updates)).build();

  _$TvCreditsResults._({this.id, this.tvCreditsResults}) : super._();

  @override
  TvCreditsResults rebuild(void Function(TvCreditsResultsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TvCreditsResultsBuilder toBuilder() =>
      new TvCreditsResultsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TvCreditsResults &&
        id == other.id &&
        tvCreditsResults == other.tvCreditsResults;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), tvCreditsResults.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TvCreditsResults')
          ..add('id', id)
          ..add('tvCreditsResults', tvCreditsResults))
        .toString();
  }
}

class TvCreditsResultsBuilder
    implements Builder<TvCreditsResults, TvCreditsResultsBuilder> {
  _$TvCreditsResults _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  ListBuilder<TvCredits> _tvCreditsResults;
  ListBuilder<TvCredits> get tvCreditsResults =>
      _$this._tvCreditsResults ??= new ListBuilder<TvCredits>();
  set tvCreditsResults(ListBuilder<TvCredits> tvCreditsResults) =>
      _$this._tvCreditsResults = tvCreditsResults;

  TvCreditsResultsBuilder();

  TvCreditsResultsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _tvCreditsResults = $v.tvCreditsResults?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TvCreditsResults other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TvCreditsResults;
  }

  @override
  void update(void Function(TvCreditsResultsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TvCreditsResults build() {
    _$TvCreditsResults _$result;
    try {
      _$result = _$v ??
          new _$TvCreditsResults._(
              id: id, tvCreditsResults: _tvCreditsResults?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'tvCreditsResults';
        _tvCreditsResults?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TvCreditsResults', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
