import 'dart:convert';

import 'package:http/http.dart';

const baseUrl = "disease.sh";
class NetworkHelper {
  final String url;

  NetworkHelper(this.url);
  Future getAllData() async {
    var completeUrl = Uri.https(baseUrl, url);
    Response response = await get(completeUrl);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future getCountryData() async {
    Map<String, String> _queryParameters = {
      "yesterday": "false",
      "strict": "true",
    };
    var completeUrl = Uri.https(baseUrl, url, _queryParameters);
    Response response = await get(completeUrl);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
