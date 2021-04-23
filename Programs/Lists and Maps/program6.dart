/// The programs are created as part of the Dart Training module in NativeWit.
/// Vijay is the author of the code.
/// Program 6 for lists and maps. (Sort a map in ascending order of values)

void main() {
  var map1 = {1: "I", 2: "Love", 3: "Dart", 4: "Programming!"}; // create a map
  var sortedValues = map1.values.toList()
    ..sort(); // create a sortedValues List to store the sorted Values of the map in ascending order
  var map2 = {}; // create a empty map to store the sorted map
  for (var i in sortedValues) {
    var keys = map1.keys
        .firstWhere((k) => map1[k] == i); // get the key for the value in Map
    map2.addAll({keys: i}); // add the sorted elements to the map
  }
  print("Map1: $map1");
  print("Sorted Map: $map2");
}
