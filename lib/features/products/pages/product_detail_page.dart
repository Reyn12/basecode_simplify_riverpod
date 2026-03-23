import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../helper/format_currency_helper.dart';
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
      appBar: AppBar(title: const Text('Detail Produk')),
      body: productAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Gagal ambil detail: $e')),
        data: (product) => Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.name, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text('Harga: ${formatRupiah(product.price)}'),
              Text('Stok: ${product.stock}'),
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

