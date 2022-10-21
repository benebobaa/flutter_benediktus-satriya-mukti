import 'package:flutter_one/models/api/food_api.dart';
import 'package:flutter_one/models/food_model.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'food_api_test.mocks.dart';

@GenerateMocks([FoodAPI])
void main() {
  group('FoodAPI', () {
    FoodAPI foodAPI = MockFoodAPI();
    test('get all data return foods data', () async {
      when(foodAPI.getFoods()).thenAnswer(
        (_) async => <Food>[
          Food(id: 1, name: 'Bakso'),
        ],
      );
      var foods = await foodAPI.getFoods();
      expect(foods.isNotEmpty, true);
    });
  });
}
