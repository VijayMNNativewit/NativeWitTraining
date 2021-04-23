// import 'package:flutter/material.dart';
//
// void main() {
//   ImmutableValue value = ImmutableValue((b) {
//     b.firstName = 'NW';
//     b.age = 19;
//   });
//   print([value.firstName, value.age]);
//   // you cannot do the following
//   // value.firstName = 'SomeName';
//
//   // to change name
//   // first conver value to builder
//   final builder = value.toBuilder();
//
//   // change all values on the builder
//   builder.firstName = 'SomeName';
//   builder.age = 25;
//
//   // again rebuild a new immutable value from the builder
//   value = builder.build();
//   var builders = value.rebuild();
//   print([value.firstName, value.age]);
// }
//
// class ImmutableValue {
//   // factory constructor to initialize the builder with initial values
//   factory ImmutableValue([Function(ImmutableValueBuilder) initialBuilder]) {
//     final b = ImmutableValueBuilder();
//     initialBuilder?.call(b);
//     return b.build();
//   }
//
//   ImmutableValue._(this.firstName, this.age);
//
//   // immutable name
//   final String firstName;
//   final int age;
//
//   // create a builder and copy all current values value
//   ImmutableValueBuilder toBuilder() {
//     return ImmutableValueBuilder()
//       ..firstName = firstName
//       ..age = age;
//   }
//
//   @override
//   ImmutableValue rebuild() => (toBuilder()..update()).build();
//
//   @override
//   void update(void Function(ImmutableValueBuilder)) {
//     if (updates != null) updates(this);
//   }
// }
//
// class ImmutableValueBuilder {
//   ImmutableValueBuilder();
//
//   // mutable name
//   String firstName;
//   int age;
//
//   // build new immutable value will all current values in builder
//   ImmutableValue build() {
//     return ImmutableValue._(firstName, age);
//   }
// }
