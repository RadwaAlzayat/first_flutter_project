import 'package:first_flutter_project/screens/shopping_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sign_up".tr()),
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(
            onPressed: () {
              // Switch between English and Arabic
              if (context.locale.languageCode == 'en') {
                context.setLocale(const Locale('ar'));
              } else {
                context.setLocale(const Locale('en'));
              }
              
            },
            icon: Icon(Icons.language),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(label: Text("full_name".tr())),
                  controller: fullNameController,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      // Check that the first letter is capitalized
                      if (value[0] == value[0].toUpperCase()) {
                        return null;
                      } else {
                        return "first_letter_capital".tr();
                      }
                    } else {
                      return "please_enter_full_name".tr();
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(label: Text("email".tr())),
                  controller: emailController,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      // Check that the email contains the @ symbol
                      if (value.contains('@')) {
                        return null;
                      } else {
                        return "email_must_contain_at".tr();
                      }
                    } else {
                      return "please_enter_email".tr();
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(label: Text("password".tr())),
                  controller: passwordController,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      // Check that the password has at least 6 characters
                      if (value.length >= 6) {
                        return null;
                      } else {
                        return "password_min_length".tr();
                      }
                    } else {
                      return "please_enter_password".tr();
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    label: Text("confirm_password".tr()),
                  ),
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      // Check that both passwords are identical
                      if (value == passwordController.text) {
                        return null;
                      } else {
                        return "passwords_not_match".tr();
                      }
                    } else {
                      return "please_confirm_password".tr();
                    }
                  },
                ),
              ),
              SizedBox(height: 70),
              ElevatedButton(
                onPressed: () async {
                  // Validate the form before navigating
                  if (_formKey.currentState!.validate()) {
                    await _showMyDialog();
                    if (!context.mounted) return;
                    Navigator.of(context).push(_createRoute());
                  }
                },
                child: Text("sign_up".tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("account_created".tr()),

          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('ok'.tr()),
            ),
          ],
        );
      },
    );
  }

  Route<void> _createRoute() {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) =>
          const ShoppingScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Apply a fade animation when opening the Shopping Screen
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
