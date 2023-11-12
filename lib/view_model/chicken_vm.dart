import 'package:flutter/material.dart';
import 'chicken.dart';
import 'api_service.dart';

class ChickenViewModel extends ChangeNotifier {
  ApiService apiService = ApiService();

  List<Chicken> chickens = [];

  ChickenViewModel() {
    fetchChickens();
  }

  void fetchChickens() async {
    chickens = await apiService.getChickens();
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
