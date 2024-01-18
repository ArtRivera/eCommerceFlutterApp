import 'dart:async';

import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fake_products_repository.g.dart';

class FakeProductsRepository {
  final List<Product> _products = kTestProducts;

  List<Product> getProductsList() {
    return _products;
  }

  Product? getProduct(String id) {
    return _products.firstWhere((product) => product.id == id);
  }

  Future<List<Product>> fetchProductsList() async {
    await Future.delayed(const Duration(seconds: 2));
    // throw Exception('Error fetching products');
    return Future.value(_products);
  }

  Stream<List<Product>> watchProductsList() async* {
    await Future.delayed(const Duration(seconds: 2));
    yield _products;
  }

  Stream<Product?> watchProduct(String id) {
    return watchProductsList()
        .map((products) => products.firstWhere((product) => product.id == id));
  }
}

@riverpod
FakeProductsRepository ProductsRepository(ProductsRepositoryRef ref) {
  return FakeProductsRepository();
}

@riverpod
FutureOr<List<Product>> productsList(ProductsListRef ref) {
  final productsRepository = ref.watch(productsRepositoryProvider);
  return productsRepository.fetchProductsList();
}

@riverpod
Stream<Product?> productDetail(ProductDetailRef ref, String id) {
  debugPrint('productDetail: $id');
  final link = ref.keepAlive();
  final timer = Timer(const Duration(seconds: 10), link.close);
  ref.onDispose(() {
    debugPrint('productDetail: onDispose');
    timer.cancel();
  });
  final productsRepository = ref.watch(productsRepositoryProvider);
  return productsRepository.watchProduct(id);
}
