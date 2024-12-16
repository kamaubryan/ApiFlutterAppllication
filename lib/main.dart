import 'package:apiapplication/products_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp( GetMaterialApp(
    home: ProductsPage(),
  ));
}

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                  height: 550,
                  width: Get.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/background.jpeg'),
                          fit: BoxFit.cover)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Elevate your Closet",
                          style: GoogleFonts.stixTwoText(
                              fontSize: 40, fontWeight: FontWeight.w900, color: Colors.grey),
                        ),
                        FloatingActionButton(
                          onPressed: (){},
                        child: Text('Go to Catalogue'),

                        )

                      ]))
            ],
          ),
          Container(

          )
        ],
      ),
    );
  }
}
