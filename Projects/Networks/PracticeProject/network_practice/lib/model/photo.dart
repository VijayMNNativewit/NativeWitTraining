library photo;

import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';

part 'photo.g.dart';

abstract class Photo implements Built<Photo, PhotoBuilder> {
  @nullable
  @BuiltValueField(wireName: 'albumId')
  int get albumId;

  @nullable
  @BuiltValueField(wireName: 'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: 'title')
  String get title;

  @nullable
  @BuiltValueField(wireName: 'url')
  String get url;

  @nullable
  @BuiltValueField(wireName: 'thumbnailUrl')
  String get thumbnailUrl;

  Photo._();

  //factory Photo([updates(PhotoBuilder Photo)]) = _$Photo;
  factory Photo([void Function(PhotoBuilder) updates]) = _$Photo;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Photo.serializer, this)
        as Map<String, dynamic>;
  }

  Photo fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(Photo.serializer, jsonString);
  }

  static Serializer<Photo> get serializer => _$photoSerializer;
}
