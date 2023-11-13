import 'package:flutter/material.dart';
import '../model/chicken.dart';
import '../model/api_service.dart';

class JailsViewModel extends ChangeNotifier {
  ApiService apiService = ApiService();

  List<int> jails = [];

  JailsViewModel() {
    fetchJails();
  }

  void fetchJails() async {
    jails = (await apiService.getJails())!;
    notifyListeners();
  }

  void fetchChickens() async {
    (await apiService.getChickens())!;
    notifyListeners();
  }

  void createChicken(Chicken chicken) async {
    await apiService.createChicken(chicken);
    fetchChickens();
  }

  void updateChicken(Chicken chicken) async {
    await apiService.updateChicken(chicken);
    fetchChickens();
  }

  void deleteChicken(int id) async {
    await apiService.deleteChicken(id);
    fetchChickens();
  }
}
