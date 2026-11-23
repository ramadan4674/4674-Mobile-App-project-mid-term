# متجر التقنية — النسخة المبسطة

تطبيق تعليمي بواجهات وتنقّل فقط، دون تسجيل حسابات حقيقية أو قاعدة بيانات.

## التشغيل

```text
flutter pub get
flutter run
```

## الملفات التي تراجعها

1. lib/main.dart: تشغيل التطبيق، الترجمة وحالة الثيم.
2. lib/pages/splash_page.dart: الشعار ثم الانتقال بعد 2.5 ثانية.
3. lib/pages/onboarding_page.dart: ثلاث صفحات تعريفية، التالي والتخطي والانتهاء.
4. lib/pages/login_page.dart: واجهة الدخول وفتح الرئيسية أو التسجيل.
5. lib/pages/sign_up_page.dart: واجهة إنشاء حساب والرجوع للدخول.
6. lib/pages/home_page.dart: قائمة بسيطة تعرض صور المنتجات وأسماءها وأسعارها.
7. lib/pages/settings_page.dart: تغيير الثيم واللغة.
8. lib/widgets/app_text_field.dart: حقل كتابة مشترك.
9. lib/widgets/app_button.dart: زر مشترك.
10. lib/theme/app_theme.dart: ألوان وتنسيقات الوضعين.
11. lib/data/products.dart: بيانات المنتجات الستة.

assets/translations/ar.json وen.json للنصوص. assets/images للصور.
pubspec.yaml لتعريف الحزم والصور والترجمة. test/widget_test.dart للفحص الآلي.

## علاقة الملفات

main → Splash → Onboarding → Login → Home → Settings.
Login يفتح SignUp، ومنها نفتح Home أو نرجع إلى Login.
main يمرّر دالة تغيير الثيم عبر الصفحات حتى تصل إلى Settings.
Home يقرأ قائمة products. Login وSignUp يستعملان الزر والحقل المشتركين.

## أهم ما تفهمه

- import لاستعمال ملف أو مكتبة.
- Navigator.push لفتح صفحة، pop للرجوع، pushReplacement لاستبدال البداية والتعريف.
- setState لتحديث الثيم في main.
- constructors لتمرير دالة تغيير الثيم.
- context.tr لقراءة النص وcontext.setLocale لتغيير اللغة.
- ListView وListTile لعرض المنتجات، بدون فلترة أو صفحة تفاصيل.

حافظنا على كل صفحة وكل عنصر مشترك في ملف مستقل حسب ورقة المشروع.
حُذفت صفحة التفاصيل الاختيارية، فلا تتضمن هذه النسخة ميزة البونص الخاصة بها.

## الفحص

```text
flutter analyze
flutter test
```
