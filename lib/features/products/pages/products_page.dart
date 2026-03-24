import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../helper/format_currency_helper.dart';
import '../../../helper/ref_listen_helper.dart';
import '../providers/products_provider.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productsProvider);

    ref.listenFuture(context, productsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Produk')),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(productsProvider);
          await ref.read(productsProvider.future);
        },
        child: productsAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, __) => ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: const [
              SizedBox(height: 300),
            ],
          ),
          data: (products) {
            if (products.isEmpty) {
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [
                  SizedBox(height: 220),
                  Center(child: Text('Produk kosong')),
                ],
              );
            }

            return ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: products.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              padding: const EdgeInsets.all(12),
              itemBuilder: (context, i) {
                final p = products[i];
                return Card(
                  child: ListTile(
                    onTap: () => context.push('/product/${p.id}'),
                    title: Text(p.name),
                    subtitle: Text('Harga: ${formatRupiah(p.price)}'),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        'Stok: ${p.stock}',
                        style: TextStyle(
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

