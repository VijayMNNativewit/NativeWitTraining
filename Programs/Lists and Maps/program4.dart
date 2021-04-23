/// The programs are created as part of the Dart Training module in NativeWit.
/// Vijay is the author of the code.
/// Program 4 for lists and maps. (Combine 3 maps to form a new map)

void main() {
  var map1 = {1: "I"},
      map2 = {2: "Love"},
      map3 = {3: "Dart"}; // creating three maps
  var map4 = {
    ...map1,
    ...map2,
    ...map3
  }; // combining 3 maps to form a new map using Spread Operator (...)
  print("Map1: $map1, Map2: $map2, Map3: $map3");
  print("Combined Map -> Map4: $map4");
}
