import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../widgets/language_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key, required this.onThemeChanged});
  final ValueChanged<bool> onThemeChanged;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text(context.tr('settings'))),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              context.tr('preferences'),
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              context.tr('settings_subtitle'),
              style: TextStyle(color: colors.onSurfaceVariant),
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 0,
              color: colors.surfaceContainerLow,
              child: SwitchListTile(
                secondary: const Icon(Icons.dark_mode_outlined),
                title: Text(context.tr('dark_mode')),
                value: Theme.of(context).brightness == Brightness.dark,
                onChanged: onThemeChanged,
              ),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 0,
              color: colors.surfaceContainerLow,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.language),
                        const SizedBox(width: 12),
                        Text(context.tr('language')),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(context.tr('language_current')),
                    const SizedBox(height: 8),
                    const LanguageButton(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 28),
            Text(
              context.tr('about_app'),
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              context.tr('demo_notice'),
              style: TextStyle(color: colors.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}
