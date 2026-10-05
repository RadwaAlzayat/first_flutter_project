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
            icon: const Icon(Icons.language),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "our_products".tr(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: PageView.builder(
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  final product = _products[index];
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Image.asset(product['image']!, fit: BoxFit.cover),
                  );
                },
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              // Prevent nested scrolling because the whole page uses SingleChildScrollView
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemCount: _products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = _products[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Image.asset(
                            product['image']!,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          product['name']!.tr(),
                          style: const TextStyle(fontSize: 20),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_shopping_cart),
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
              padding: const EdgeInsets.all(16),
              child: Text(
                "hot_offers".tr(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              itemCount: _hotOffers.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final offer = _hotOffers[index];
                return Card(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(
                            offer['image']!,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Expanded(child: Text(offer['name']!.tr())),
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
}

// Store translation KEYS only, and call .tr() inside build,
// so the names update when the language changes
const List<Map<String, String>> _products = [
  {'name': 'product_1', 'image': 'assets/dress.jpg'},
  {'name': 'product_2', 'image': 'assets/Blouse.jpg'},
  {'name': 'product_3', 'image': 'assets/pink_dress.jpg'},
  {'name': 'product_4', 'image': 'assets/skirt.jpg'},
  {'name': 'product_5', 'image': 'assets/tshirt.jpg'},
  {'name': 'product_6', 'image': 'assets/bag.jpg'},
];

// Hot offers are the same products except the t-shirt (no duplicated list)
final List<Map<String, String>> _hotOffers = _products
    .where((product) => product['name'] != 'product_5')
    .toList();
