/// The programs are created as part of the Dart Training module in NativeWit.
/// Vijay is the author of the code.
/// Program 1 for lists and maps. (Add elements of one map to another)

void main() {
  var map1 = {1: "I", 2: "Love", 3: "Dart"}; // creating a map
  var map2 = {}; // creating a empty map
  print("Initial State:");
  print("Map1: $map1");
  print("Map2: $map2");
  map2.addAll(map1);
  // The elements of one map can be added to another map using the addAll() function
  print("After adding elements of map1 to map2:");
  print("Map1: $map1");
  print("Map2: $map2");
}
