import "package:http/http.dart" as http;

void main() {
  const API_KEYS = "TvlNJi12PweNnW4RZ9Cx7yjXi1xPjr0RnbnBqmxo";
  const headers = {'X-TheySaidSo-Api-Secret': API_KEYS};
  var url = Uri.parse("http://quotes.rest/qod.json?category=inspire");

  fetchAPI(url, API_KEYS, headers);
}

dynamic fetchAPI(Uri url, String API_KEYS, Map<String, String> headers) async {
  var response = await http.get(url, headers: headers);

  if (response.statusCode == 200) {
    print(response.body);
  } else {
    final err = Errors.firstWhere(
      (element) => element['code'] == response.statusCode,
      orElse: () => {'code': 0, 'message': "Oops, something is wrong"},
    );

    print(err['message']);
  }
}

const List<Map<String, dynamic>> Errors = [
  {'code': 400, 'message': "Not found"},
  {'code': 500, 'message': "Internal server error"},
  {'code': 401, 'message': "Unauthorized"},
];
