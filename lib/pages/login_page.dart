import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';
import 'home_page.dart';
import 'sign_up_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.onThemeChanged});
  final ValueChanged<bool> onThemeChanged;
  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text(context.tr('app_name'))),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                context.tr('welcome_back'),
                style: text.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
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
            ],
          ),
        ),
      ),
    );
  }
}
