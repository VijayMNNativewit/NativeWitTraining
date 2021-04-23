/// The programs are created as part of the Dart Training module in NativeWit.
/// Vijay is the author of the code.
/// Program 9 for lists and maps. (Select the elements from Map<String,String> A where the values in A have a length >5 and construct a new Map<String,String> B with these values.)

void main() {
  var A = new Map<String, String>(); // create a map A<String, String>
  var B = new Map<String, String>(); // create a map B<String, String>
  A = {
    "1": "We",
    "2": "Love",
    "3": "Dart",
    "4": "Programming!",
    "5": "Hello World!"
  };
  print("Initial State:");
  print("Map A = $A");
  print("Map B = $B");
  var shortLength =
      0; // create a variable to keep track of the short length values
  A.forEach((k, v) => v.length > 5
      ? B.update(k, (v) => v, ifAbsent: () => v)
      : shortLength++); // if the values in map A have length greater than 5 then add it to the map B
  print("Final State:");
  print("Map A = $A");
  print("Map B = $B");
}
