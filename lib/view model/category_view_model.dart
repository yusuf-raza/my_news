import 'package:news_app/models/category_model.dart';
import 'package:news_app/repositories/category_repository.dart';

class CategoryViewModel {
  final _repository = CategoryRepository();

  Future<CategoryModel> fetchCategoryApi(String category) async {
    final response = await _repository.fetchCategoryApi(category.toLowerCase());
    return response;
  }
}
