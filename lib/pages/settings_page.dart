import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key, required this.onThemeChanged});
  final ValueChanged<bool> onThemeChanged;

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    return Scaffold(
      appBar: AppBar(title: Text(context.tr('settings'))),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SwitchListTile(
              title: Text(context.tr('dark_mode')),
              secondary: const Icon(Icons.dark_mode_outlined),
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: onThemeChanged,
            ),
            const SizedBox(height: 16),
            Text(context.tr('language')),
            TextButton.icon(
              icon: const Icon(Icons.language),
              label: Text(isArabic ? 'English' : 'العربية'),
              onPressed: () {
                context.setLocale(
                  isArabic ? const Locale('en') : const Locale('ar'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
