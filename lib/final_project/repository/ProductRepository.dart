

import '../model/product.dart';
import '../service/api_service.dart';

class ProductRepository {
  final ApiService apiService;

  ProductRepository(this.apiService);

  Future<List<Product>> fetchProducts() async {
    try {
      return await apiService.getProducts();
    } catch (e) {
      throw Exception('Failed to load products');
    }
  }
  Future<List<Product>> fetchProductsByCategory(String category) async {
    try {
      return await apiService.getProductsByCategory(category);
    } catch (e) {
      throw Exception('Failed to load products');
    }
  }
}