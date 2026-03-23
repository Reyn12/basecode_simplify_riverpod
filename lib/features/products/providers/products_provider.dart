import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../network/api_service.dart';
import '../models/product.dart';

part 'products_provider.g.dart';

@riverpod
Future<List<Product>> products(Ref ref) async {
  final api = ref.watch(apiServiceProvider);
  return api.fetchProducts();
}

@riverpod
Future<Product> productDetail(Ref ref, {required int id}) async {
  final api = ref.watch(apiServiceProvider);
  return api.fetchProductDetail(id);
}

