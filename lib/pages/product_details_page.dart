import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.id, required this.price});
  final String id;
  final int price;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text(context.tr('details'))),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Container(
              height: 300,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: colors.surfaceContainerLow,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Image.asset('assets/images/$id.png', fit: BoxFit.contain),
            ),
            const SizedBox(height: 28),
            Text(
              context.tr('product_$id'),
              style: text.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              context.tr('price', namedArgs: {'value': '$price'}),
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
              context.tr('description_$id'),
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
    );
  }
}
