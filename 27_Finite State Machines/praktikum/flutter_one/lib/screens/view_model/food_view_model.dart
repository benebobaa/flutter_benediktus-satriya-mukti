import 'package:flutter/cupertino.dart';
import 'package:flutter_one/models/api/food_api.dart';
import 'package:flutter_one/models/food_model.dart';

enum FoodViewState {
  none,
  loading,
  error,
}

class FoodViewModel with ChangeNotifier {
  FoodViewState _state = FoodViewState.none;

  FoodViewState get state => _state;

  List<Food> _foods = [];

  List<Food> get foods => _foods;

  changeState(FoodViewState s) {
    _state = s;
    notifyListeners();
  }

  getAllFoods() async {
    changeState(FoodViewState.loading);
    FoodAPI? foodAPI;
    try {
      final c = await foodAPI!.getFoods();
      _foods = c;
      notifyListeners();
    } catch (e) {
      changeState(FoodViewState.error);
    }
  }
}
