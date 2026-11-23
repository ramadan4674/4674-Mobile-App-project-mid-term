import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../data/products.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.onThemeChanged});
  final ValueChanged<bool> onThemeChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('browse')),
        actions: [
          IconButton(
            tooltip: context.tr('settings'),
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SettingsPage(onThemeChanged: onThemeChanged),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            for (final product in products)
              Card(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  leading: Image.asset(product.image, width: 64, height: 64),
                  title: Text(context.tr('product_${product.id}')),
                  subtitle: Text(
                    context.tr(
                      'price',
                      namedArgs: {'value': '${product.price}'},
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
