/// The programs are created as part of the Dart Training module in NativeWit.
/// Vijay is the author of the code.
/// Program 8 for lists and maps. (Transfer element of one map to another using spread operator.)

void main() {
  var map1 = {1: "I", 2: "Love", 3: "Dart"}; // creating a map
  var map2 = {
    ...map1
  }; // Transferring element of one map to another map using spread operator(...)
  print("Map1: $map1");
  print("Map2: $map2");
}
