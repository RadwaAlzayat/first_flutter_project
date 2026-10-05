// widgets/language_switch_button.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageSwitchButton extends StatelessWidget {
  const LanguageSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.language),
      onPressed: () {
        // Switch between English and Arabic
        final isEnglish = context.locale.languageCode == 'en';
        context.setLocale(Locale(isEnglish ? 'ar' : 'en'));
      },
    );
  }
}
