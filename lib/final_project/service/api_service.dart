import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../model/product.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://fakestoreapi.com")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/products")
  Future<List<Product>> getProducts();

  @GET("/products/categories")
  Future<List<String>> getCategories();

  @GET("/products/category/{category}")
  Future<List<Product>> getProductsByCategory(@Path("category") String category);
}