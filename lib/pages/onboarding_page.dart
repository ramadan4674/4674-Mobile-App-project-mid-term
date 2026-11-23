import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../widgets/language_button.dart';
import 'login_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.onThemeChanged});
  final ValueChanged<bool> onThemeChanged;
  void openLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(onThemeChanged: onThemeChanged),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final pageDecoration = PageDecoration(
      pageColor: colors.surface,
      titleTextStyle: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: colors.onSurface,
      ),
      bodyTextStyle: TextStyle(fontSize: 17, color: colors.onSurfaceVariant),
    );

    return Scaffold(
      appBar: AppBar(actions: const [LanguageButton(), SizedBox(width: 12)]),
      body: SafeArea(
        child: IntroductionScreen(
          globalBackgroundColor: colors.surface,
          pages: [
            for (int i = 1; i <= 3; i++)
              PageViewModel(
                title: context.tr('onboarding_title_$i'),
                body: context.tr('onboarding_body_$i'),
                image: Image.asset(
                  'assets/images/onboarding_$i.png',
                  height: 260,
                ),
                decoration: pageDecoration,
              ),
          ],
          showSkipButton: true,
          skip: Text(
            context.tr('skip'),
            style: TextStyle(color: colors.primary),
          ),
          next: Text(
            context.tr('next'),
            style: TextStyle(color: colors.primary),
          ),
          done: Text(
            context.tr('done'),
            style: TextStyle(
              color: colors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          onSkip: () => openLogin(context),
          onDone: () => openLogin(context),
          dotsDecorator: DotsDecorator(
            activeColor: colors.primary,
            color: colors.outlineVariant,
          ),
        ),
      ),
    );
  }
}
