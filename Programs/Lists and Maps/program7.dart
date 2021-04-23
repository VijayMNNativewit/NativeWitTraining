/// The programs are created as part of the Dart Training module in NativeWit.
/// Vijay is the author of the code.
/// Program 7 for lists and maps. (Construct a <String, int> map and remove the elements where values are not divisible by 2.)

void main() {
  var map1 = new Map<String, int>(); // create a <String, int> map
  map1 = {
    "1": 1,
    "2": 2,
    "3": 3,
    "4": 4
  }; // adding <K,V> = <String, int> pairs to the map
  var removeKeysList =
      []; // create a list to contain the keys of the Map which need to be removed from the map
  var correct =
      0; // create a variable to keep track of the values which are divisible by 2
  print("Initial State: Map1 = $map1");
  map1.forEach((k, v) => v % 2 != 0
      ? removeKeysList.add(k)
      : correct++); // if the value is not divisible by 2 then add the keys to the removeKeysList
  for (var i in removeKeysList) {
    map1.remove(
        i); // remove the elements from the map whose values are not divisible by 2 and their keys are present in the removeKeysList
  }
  print("Final State: Map1 = $map1");
}
