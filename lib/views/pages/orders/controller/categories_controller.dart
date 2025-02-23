import 'package:flutter/material.dart';

import '../models/food_api_categories_data_model.dart.dart';
import '../repository/category_repository.dart';

class CategoryController with ChangeNotifier {
  final CategoryRepository _repository = CategoryRepository();
  List<Categories>? _categories;
  bool _isLoading = false;
  String? _errorMessage;

  List<Categories>? get categories => _categories;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  Future<void> fetchCategories() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _categories = await _repository.fetchCategories();
    } catch (e) {
      _errorMessage = "Failed to load categories";
    }

    _isLoading = false;
    notifyListeners();
  }
}
