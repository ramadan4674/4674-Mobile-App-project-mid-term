import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';
import 'home_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key, required this.onThemeChanged});
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
                context.tr('create_account'),
                style: text.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              AppTextField(
                label: context.tr('full_name'),
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              AppTextField(
                label: context.tr('confirm_password'),
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 24),
              AppButton(
                text: context.tr('create_account'),
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
              Text(context.tr('have_account'), textAlign: TextAlign.center),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(context.tr('login')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
