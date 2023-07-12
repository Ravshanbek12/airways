import 'dart:convert';

import '../models/product/product_model.dart';
import '../models/universal_response.dart';
import '../models/user/user_model.dart';
import 'package:http/http.dart'as http;

class ApiProvider {
  //------------------------------Login provider--------------------------------

  Future<UniversalResponse> loginUser({
    required String username,
    required String password,
  }) async {
    Uri url = Uri.parse('https://fakestoreapi.com/auth/login');
    try {
      final response = await http.post(
        url,
        body: {"username": username, "password": password},
      );
      if (response.statusCode == 200) {
        String token = jsonDecode(response.body)["token"];
        return UniversalResponse(data: token);
      }
      return UniversalResponse(error: 'Error: Status code not equal to 200');
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }

  //------------------------------Product provider------------------------------

  Future<UniversalResponse> getAllProducts() async {
    Uri url = Uri.parse('https://fakestoreapi.com/products');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => ProductModel.fromJson(e))
              .toList() ??
              [],
        );
      }
      return UniversalResponse(error: 'Error: Status code not equal to 200');
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }

  Future<UniversalResponse> getProductsByLimit({required int limit}) async {
    Uri url = Uri.parse('https://fakestoreapi.com/products?limit=$limit');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => ProductModel.fromJson(e))
              .toList() ??
              [],
        );
      }
      return UniversalResponse(error: 'Error: Status code not equal to 200');
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }

  Future<UniversalResponse> getProductById({required int id}) async {
    Uri url = Uri.parse('https://fakestoreapi.com/products/$id');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return UniversalResponse(
            data: ProductModel.fromJson(jsonDecode(response.body)));
      } else if (response.statusCode != 200) {
        return UniversalResponse(error: 'Error: Status code not equal to 200');
      }

      return UniversalResponse(error: 'Error: Product not found');
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }

  Future<UniversalResponse> addProduct(ProductModel product) async {
    Uri url = Uri.parse('https://fakestoreapi.com/products');
    try {
      final response = await http.post(
        url,
        body: jsonEncode(product.toJson()),
      );
      if (response.statusCode == 200) {
        return UniversalResponse(
          data: ProductModel.fromJson(jsonDecode(response.body)),
        );
      }
      return UniversalResponse(error: 'Error: Status code not equal to 200');
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }

  Future<UniversalResponse> productUpdate(ProductModel product) async {
    Uri url = Uri.parse('https://fakestoreapi.com/products/${product.id}');
    try {
      final response = await http.put(
        url,
        body: product.toJson(),
      );
      if (response.statusCode == 200) {
        return UniversalResponse(
            data: ProductModel.fromJson(jsonDecode(response.body)));
      }
      return UniversalResponse(error: 'Error: Status code not equal to 200');
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }

  Future<UniversalResponse> deleteProduct(int id) async {
    Uri url = Uri.parse('https://fakestoreapi.com/products/$id');
    try {
      final response = await http.delete(url);
      if (response.statusCode == 200) {
        return UniversalResponse(
            data: ProductModel.fromJson(jsonDecode(response.body)));
      }
      return UniversalResponse(error: 'Error: Status code not equal to 200');
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }

  Future<UniversalResponse> sortProducts(String sort) async {
    Uri url = Uri.parse('https://fakestoreapi.com/products?sort=$sort');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => ProductModel.fromJson(e))
              .toList() ??
              [],
        );
      }
      return UniversalResponse(error: 'Error: Status code not equal to 200');
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }

  Future<UniversalResponse> getProductsByCategory(
      {required String category, required String sort}) async {
    Uri url = Uri.parse(
      category.isNotEmpty
          ? 'https://fakestoreapi.com/products/category/$category?sort=$sort'
          : "https://fakestoreapi.com/products?sort=$sort",
    );
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return UniversalResponse(
            data: (jsonDecode(response.body) as List?)
                ?.map((e) => ProductModel.fromJson(e))
                .toList() ??
                []);
      }
      return UniversalResponse(error: 'Error: Status code not equal to 200');
    } catch (e) {
      print(e);
      return UniversalResponse(error: e.toString());
    }
  }

  //------------------------------User provider---------------------------------

  Future<UniversalResponse> getAllUsers() async {
    Uri url = Uri.parse('https://fakestoreapi.com/users');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => UserModel.fromJson(e))
              .toList() ??
              [],
        );
      }
      return UniversalResponse(error: 'Error: Status code not equal to 200');
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }

  //------------------------------Category provider-----------------------------

  Future<UniversalResponse> getAllCategories() async {
    Uri url = Uri.parse('https://fakestoreapi.com/products/categories');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => e as String)
              .toList(),
        );
      }
      return UniversalResponse(error: 'Error: Status code not equal to 200');
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }
}