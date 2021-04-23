library album;

import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';

part 'album.g.dart';

abstract class Album implements Built<Album, AlbumBuilder> {
  @nullable
  @BuiltValueField(wireName: 'userId')
  int get userId;

  @nullable
  @BuiltValueField(wireName: 'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: 'title')
  String get title;

  Album._();

  //factory Album([updates(AlbumBuilder album)]) = _$Album;
  factory Album([void Function(AlbumBuilder) updates]) = _$Album;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Album.serializer, this)
        as Map<String, dynamic>;
  }

  Album fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(Album.serializer, jsonString);
  }

  static Serializer<Album> get serializer => _$albumSerializer;
}
