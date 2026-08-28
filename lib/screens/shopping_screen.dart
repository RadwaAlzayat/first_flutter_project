import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("shopping_screen".tr()),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "our_products".tr(),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: PageView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(product['image']!, fit: BoxFit.cover),
                  );
                },
              ),
            ),

            GridView.builder(
              shrinkWrap: true,
              // Prevent nested scrolling because the whole page uses SingleChildScrollView
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Image.asset(
                            product['image']!,
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                        ),

                        Text(product['name']!, style: TextStyle(fontSize: 20)),
                        IconButton(
                          icon: Icon(Icons.add_shopping_cart),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("item_added".tr())),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "hot_offers".tr(),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "photo.jpg",
                            height: 80,
                            width: 80,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Expanded(flex: 1, child: Text(product['name']!)),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  final List<Map> products = [
    {'name': 'Product 1', 'image': 'assets/photo.jpg'},
    {'name': 'Product 2', 'image': 'assets/photo.jpg'},
    {'name': 'Product 3', 'image': 'assets/photo.jpg'},
    {'name': 'Product 4', 'image': 'assets/photo.jpg'},
    {'name': 'Product 5', 'image': 'assets/photo.jpg'},
    {'name': 'Product 6', 'image': 'assets/photo.jpg'},
  ];
}
