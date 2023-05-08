import "package:http/http.dart" as http;

void main() async {
  print("Loading...");

  Set<int> mySet = {1, 2, 3, 4};
  Set<int> mySet2 = {1, 2, 3, 4, 5};

  print("iNTERSECTION: ${mySet.intersection(mySet2)}");

  var list = ["Hello", "world", "wow", "eye"];
  print("Before remove: $list");
  list.removeAt(1);
  print("After remove: $list");

  var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  var response = await http.get(url);

  if (response.statusCode == 200) {
    print("Response: ${response.body}");
  } else {
    print("Something is wrong....");
  }
}
