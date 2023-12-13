import 'package:ecommerce_backend/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'E-Commerce Admin',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  Get.to(() => const ProductScreen());
                },
                child: const Card(
                  child: Center(
                    child: Text('Go To Products'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
