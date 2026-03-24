import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/auth/models/login_result.dart';
import '../features/products/models/product.dart';
import 'dio_client_provider.dart';
import 'api/converter.dart';

part 'api_service.g.dart';

@riverpod
ApiService apiService(Ref ref) {
  final dio = ref.watch(dioClientProvider);
  return ApiService(dio);
}

class ApiService {
  ApiService(this.dio);

  final Dio dio;

  Future<List<Product>> fetchProducts() async {
    final res = await dio.get('/products');
    return Converter.list(res.data, Product.fromJson);
  }

  Future<Product> fetchProductDetail(int id) async {
    final res = await dio.get('/products/$id');
    return Converter.single(res.data, Product.fromJson);
  }

  Future<LoginResult> login({
    required String email,
    required String password,
  }) async {
    final res = await dio.post(
      '/auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    return Converter.single(res.data, LoginResult.fromJson);
  }
}
