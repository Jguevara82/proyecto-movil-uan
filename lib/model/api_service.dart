import 'dart:convert' as JSON;
import 'package:http/http.dart' as http;
import 'user.dart';
import 'chicken.dart';

class ApiService {
  String apiUrl = 'https://script.google.com/macros/s/AKfycbzY8KOWiwfFGbIQBKae7vpbgTP0um_RG5d8LSDo_wvmog0qAumv8iQQsxgier20e-TrEQ/exec'; // Tu URL de la API

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

  Future<List<int>> getJails() async {
    List<int> lista_jaulas = [];
    var response = await http.get(Uri.parse('$apiUrl?acc=1&tbl=Jaulas'));
    if (response.statusCode == 200) {
      List aves = JSON.jsonDecode(response.body)['data'];
      for (var element in aves) {
        lista_jaulas.add(int.parse(element['id'].toString()));
      } //me duevelve un futuro string con  los datos del json
    }
    return lista_jaulas;
    //return null;// Realiza una solicitud GET a tu API y convierte la respuesta en una lista de objetos Chicken
  }

  Future<List<Chicken>> getChickens({where = '', value = ''}) async {
    List<Chicken> lista_aves = [];
    var response = await http.get(Uri.parse('$apiUrl?acc=1&tbl=Aves&where=$where&value=$value'));
    if (response.statusCode == 200) {
      List aves = JSON.jsonDecode(response.body)['data'];
      for (var element in aves) {
        lista_aves.add(Chicken.fromJson(element));
      } //me duevelve un futuro string con  los datos del json
    }
    return lista_aves;
    //return null;// Realiza una solicitud GET a tu API y convierte la respuesta en una lista de objetos Chicken
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
