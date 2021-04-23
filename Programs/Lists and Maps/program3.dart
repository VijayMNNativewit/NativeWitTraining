/// The programs are created as part of the Dart Training module in NativeWit.
/// Vijay is the author of the code.
/// Program 3 for lists and maps. (Update a <K,V> pair in map without using [] and insert the element if it is not found)

void main() {
  var map1 = {1: "I", 2: "Love", 3: "Dart"}; // creating a map
  print("Initial State:");
  print("Map1: $map1");
  print("Updating:");
  // The pairExists function gets key and value pair as input.
  pairExists(k, v) {
    var updateValue = v; // create a variable to store the value to be updated
    if (map1.containsKey(k)) {
      // If the map contains the key
      var value = map1[k]; // value of the map entry
      if (value == v) {
        // If the map contains the key and the same value is present
        print("<K,V> pair = <$k, $v> Present. Already Updated");
      } else {
        // If the map contains the key and a different value is present
        print(
            "<K,V> pair = <$k, $value> Found. Same Key and Different Value Exists. Updating new <K,V> pair = <$k,$v>");
        map1.update(k, (v) => updateValue);
      }
    } else {
      // If the map doesn't contain the key the element is not found.
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
  // To Update a <K,V> pair in a map without using [], we use update() method
  // we make use of the optional parameter ifAbsent() in the update() method to insert the element if it is not found
  map1.update(1, (dynamic val) => "We");
  map1.update(4, (dynamic val) => " Programming",
      ifAbsent: () => "Programming!");
      */
  print("Final State:");
  print("Map1: $map1");
}
