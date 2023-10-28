import 'dart:convert';
import 'package:http/http.dart' as http;

class SpreadsheetApi {
  final String apiUrl;

  SpreadsheetApi(this.apiUrl);

  Future<List<dynamic>> getData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> addData(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add data');
    }
  }
}
