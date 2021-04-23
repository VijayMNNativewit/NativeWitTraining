/// The programs are created as part of the Dart Training module in NativeWit.
/// Vijay is the author of the code.
/// Program 2 for lists and maps. (Check if a <K,V> pair is present in a map and add it without using [])

void main() {
  var map1 = {1: "I", 2: "Love", 3: "Dart"}; // creating a map
  print("Initial State:");
  print("Map1: $map1");
  print("Checking:");
  // The pairExists function gets key and value pair as input.
  pairExists(k, v) {
    if (map1.containsKey(k)) {
      // If the map contains the key
      var value = map1[k]; // value of the map entry
      if (value == v) {
        // If the map contains the key and the same value is present
        print("<K,V> pair = <$k, $v> Present.");
      } else {
        // If the map contains the key and a different value is present
        print(
            "<K,V> pair = <$k, $v> Not Found. Same Key and Different Value Exists");
      }
    } else {
      // If the map doesn't contain the key
      print("<K,V> pair = <$k, $v> Not Found. Adding <K,V> pair to the map");
      map1.addAll({
        k: v
      }); // The <K,V> pair is added using the addAll() function instead of using []
    }
  }

  pairExists(4, "Programming");
  pairExists(5, "!");
  pairExists(4, "Programming");
  pairExists(4, "Prog");
  /* IGNORE THIS PART. ALTERNATE METHOD
  // There are two ways of checking whether a <K,V> pair is present in a map.
  // One is using containsKey() method to check if the key is present in the map.
  // Second is using containsValue() method to check if the value is present in the map.
  map1.containsValue("Programming")
      ? print("Found")
      : map1.addAll({4: "Programming"}); // containsValue() method
  map1.containsKey(5)
      ? print("Found")
      : map1.addAll({5: "!"}); // containsKey() method
      */
  print("Final State:");
  print("Map1: $map1");
}
