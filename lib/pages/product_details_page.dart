import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../data/products.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text(context.tr('details'))),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 300,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: colors.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Image.asset(product.image, fit: BoxFit.contain),
              ),
              const SizedBox(height: 28),
              Text(
                context.tr('product_${product.id}'),
                style: text.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                context.tr('price', namedArgs: {'value': '${product.price}'}),
                style: text.headlineSmall?.copyWith(
                  color: colors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 28),
              Text(
                context.tr('description'),
                style: text.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(
                context.tr('description_${product.id}'),
                style: text.bodyLarge?.copyWith(height: 1.6),
              ),
              const SizedBox(height: 28),
              Text(
                context.tr('catalogue_notice'),
                style: text.bodySmall?.copyWith(color: colors.onSurfaceVariant),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
