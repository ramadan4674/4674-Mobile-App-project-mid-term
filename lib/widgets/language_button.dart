import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});
  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    return TextButton.icon(
      onPressed: () {
        context.setLocale(isArabic ? const Locale('en') : const Locale('ar'));
      },
      icon: const Icon(Icons.language),
      label: Text(isArabic ? 'English' : 'العربية'),
    );
  }
}
