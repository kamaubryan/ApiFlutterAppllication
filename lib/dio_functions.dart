import 'package:dio/dio.dart';

final options = BaseOptions(
    baseUrl: "https://fakestoreapi.com/products",// The base URL for all API requests.
    connectTimeout: Duration(seconds: 30) // Timeout duration for connecting to the server.
);

// Initializing a Dio instance with predefined options.
Dio dio = Dio(
    options
);

// Function to fetch a list of products from the API.
Future<List<dynamic>> getProducts() async{
  try{
    var response = await dio.get("");
    if(response.statusCode==200){
      return response.data;  // Returning the list of products if the server responded with a status code of 200 (OK)
    }else{
      throw Exception('Failed to fetch products. Status code: ${response.statusCode}'); // Throwing an exception if the response status is not OK.
    }
  }catch(e){
    if(e is DioException){
      print(e.message);
    }
    rethrow;
  }
}

Future<dynamic> getProductById(String id) async{
  print("this is id  $id");
  try{
    var response = await dio.get("/$id");
    if(response.statusCode ==200){
      return response.data;
    }else{
      throw Exception('Failed to fetch products. Status code: ${response.statusCode}');
    }
  }catch(e){
    print("error from getProductById $e");
    if(e is DioException){
      print(e.message);
    }
    rethrow;
  }
}

Future<List<dynamic>> getTwoProducts() async{
  print("this are four products" );
   try{
     var response = await dio.get("?limit=2");
     if( response.statusCode == 200){
       print(response.data);
       return response.data;
     }
     else{
       throw Exception('Failed to fetch products Status code : ${response.statusCode}');
     }

   } catch(e){
     if(e is DioException){
       print(e.message);
     }
     rethrow;
   }
}