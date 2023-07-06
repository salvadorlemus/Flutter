import 'dart:convert';

import 'package:http/http.dart' as http;

class WebUtilities {
  // This method returns a Json response from a REST api request
  static Future getWebData(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print('${response.statusCode} && ${response.reasonPhrase}');
      throw 'Problem with the get request';
    }
  }
}
