import 'package:first_flutter_project/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("firt_project".tr()),
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
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  "photo.jpg",
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                Image.network(
                  "https://images.stockcake.com/public/c/2/3/c23d2fe4-1e0b-4b6d-baf9-2ff1619caeb4_large/shopping-bag-exchange-stockcake.jpg",
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "two_images".tr(),
                style: TextStyle(
                  fontFamily: "Suwannaphum",
                  fontSize: 20,
                  color: Colors.deepPurpleAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
                );
              },
              child: Text("sign_up".tr()),
            ),
          ],
        ),
      ),
    );
  }
}
