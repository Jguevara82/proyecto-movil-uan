import 'package:flutter/material.dart';
import '../model/chicken.dart';
import '../model/api_service.dart';

class ChickenViewModel extends ChangeNotifier {
  ApiService apiService = ApiService();

  List<Chicken> chickens = [];

  ChickenViewModel({id=0}) {
    if(id != 0){
      fetchChickensByJail(id);
    }else{
      fetchChickens();
    }
  }

  void fetchChickensByJail(id) async {
    chickens = (await apiService.getChickens(where: 'id_jaula', value: id))!;
    notifyListeners();
  }

  void fetchChickens() async {
    chickens = (await apiService.getChickens())!;
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
