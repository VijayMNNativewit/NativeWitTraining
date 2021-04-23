/// The programs are created as part of the Dart Training module in NativeWit.
/// Vijay is the author of the code.
/// Program 5 for lists and maps. (Print all keys in the map and all values separately.)

void main() {
  var map1 = {1: "I", 2: "Love", 3: "Dart"}; // creating a map
  print("Map1: $map1"); // print the map as <K,V> pair
  print(
      "Keys of Map1: ${map1.keys}"); // print all keys in the map using the property "keys"
  print(
      "Values of Map1: ${map1.values}"); // print all values in the map using the property "values"
}
