import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/products_provider.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: productsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (products) => ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, i) {
            final p = products[i];
            return ListTile(
              title: Text(p.name),
              subtitle: Text('Price: ${p.price}'),
            );
          },
        ),
      ),
    );
  }
}

