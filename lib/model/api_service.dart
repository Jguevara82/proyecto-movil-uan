import 'dart:convert' as JSON;
import 'package:http/http.dart' as http;
import 'user.dart';
import 'chicken.dart';

class ApiService {
  String apiUrl = 'https://script.google.com/macros/s/AKfycby2gO0HD2uddgcGqcw7-J5geFVqgOZN0St4mknwimbpg_Vc9HwVY70PUaRdPB67itPzCg/exec'; // Tu URL de la API

  Future<String> select(String table) async {
    //final url = Uri.parse('$apiUrl?acc=1&tbl=$table');
    var response = await http.get(Uri.parse('$apiUrl?acc=1&tbl=$table'));
    if (response.statusCode == 200) {
      return response.body; //me duevelve un futuro string con  los datos del json
    } else {
      return 'response status: ${response.statusCode}';
    }
  }

  Future<Map<String, dynamic>> login(User user) async {
    final url = Uri.parse('$apiUrl?acc=login&username=${user.username}&password=${user.password}');
    var response = await http.get(url);
    //print(response.body);
    if (response.statusCode == 200) {
      return JSON.jsonDecode(response.body)["data"][0]; //me duevelve un futuro string con  los datos del json
    } else {
      throw Exception('Failed to fetch data - response status: ${response.statusCode}');
    }
  }

  Future<List<Chicken>>? getChickens() {
    return null;// Realiza una solicitud GET a tu API y convierte la respuesta en una lista de objetos Chicken
  }

  Future<http.Response>? createChicken(Chicken chicken) {
    return null;// Realiza una solicitud POST a tu API con los datos de la gallina
  }

  Future<http.Response>? updateChicken(Chicken chicken) {
    return null;// Realiza una solicitud PUT a tu API con los datos de la gallina
  }

  Future<http.Response>? deleteChicken(int id) {
    return null;// Realiza una solicitud DELETE a tu API con el ID de la gallina
  }
}
