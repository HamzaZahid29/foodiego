import 'package:dio/dio.dart';

import '../../../../core/app_dio_service.dart';
import '../models/food_api_categories_data_model.dart.dart';

class CategoryRepository {
  final DioService _dioService = DioService();

  Future<List<Categories>?> fetchCategories() async {
    try {
      Response? response = await _dioService.getRequest("categories.php");
      if (response != null && response.statusCode == 200) {
        return FoodApiCategoriesDataModel.fromJson(response.data).categories;
      }
    } catch (e) {
      print("Error fetching categories: $e");
    }
    return null;
  }
}
