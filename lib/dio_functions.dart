import 'package:dio/dio.dart';

final options = BaseOptions(
  baseUrl: "https://fakestoreapi.com/products",
  connectTimeout: Duration(seconds: 30),
);

final Dio dio = Dio(options);

Future<List<dynamic>> fetchAllProducts() async {
  try {
    var response = await dio.get("");
    return response.data;
  } catch (e) {
    if (e is DioException) {
      print("DioException: ${e.message}");
    } else {
      print("Error: $e");
    }
    rethrow;
  }
}

Future<dynamic> fetchProductById(String id) async {
  try {
    var response = await dio.get("/$id");
    return response.data;
  } catch (e) {
    if (e is DioException) {
      print("DioException: ${e.message}");
    } else {
      print("Error: $e");
    }
    rethrow;
  }
}

Future<List<dynamic>> fetchTwoProducts() async {
  try {
    var response = await dio.get("?limit=2");
    return response.data;
  } catch (e) {
    if (e is DioException) {
      print("DioException: ${e.message}");
    } else {
      print("Error: $e");
    }
    rethrow;
  }
}
