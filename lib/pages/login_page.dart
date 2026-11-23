import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';
import '../widgets/language_button.dart';
import 'home_page.dart';
import 'sign_up_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.onThemeChanged});
  final ValueChanged<bool> onThemeChanged;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('app_name')),
        actions: const [LanguageButton(), SizedBox(width: 8)],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Image.asset(
                'assets/images/logo.png',
                width: 72,
                height: 72,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              context.tr('welcome_back'),
              style: text.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              context.tr('login_subtitle'),
              style: text.bodyLarge?.copyWith(color: colors.onSurfaceVariant),
            ),
            const SizedBox(height: 28),
            AppTextField(
              label: context.tr('email'),
              icon: Icons.alternate_email,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            AppTextField(
              label: context.tr('password'),
              icon: Icons.lock_outline,
              isPassword: true,
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(context.tr('reset_notice'))),
                  );
                },
                child: Text(context.tr('forgot_password')),
              ),
            ),
            const SizedBox(height: 24),
            AppButton(
              text: context.tr('login'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        HomePage(onThemeChanged: onThemeChanged),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Text(context.tr('no_account'), textAlign: TextAlign.center),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SignUpPage(onThemeChanged: onThemeChanged),
                  ),
                );
              },
              child: Text(context.tr('signup')),
            ),
            const SizedBox(height: 12),
            Text(
              context.tr('demo_notice'),
              textAlign: TextAlign.center,
              style: text.bodySmall?.copyWith(color: colors.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}
