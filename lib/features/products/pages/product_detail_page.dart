import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/products_provider.dart';

class ProductDetailPage extends ConsumerWidget {
  const ProductDetailPage({
    required this.id,
    super.key,
  });

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productDetailProvider(id: id));

    return Scaffold(
      appBar: AppBar(title: const Text('Product Detail')),
      body: productAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (product) => Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.name, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text('Price: ${product.price}'),
              Text('Stock: ${product.stock}'),
              if (product.description != null) ...[
                const SizedBox(height: 12),
                Text(product.description!, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

