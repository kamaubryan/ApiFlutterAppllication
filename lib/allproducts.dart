import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisplayAllProducts extends StatelessWidget {
  const DisplayAllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [ Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            paddingOnly(top: 20, bottom: 15),
            Icon(Icons.draw_outlined),
            SizedBox(
              child:
              Icon(Icons.shopping_basket),
            ),
            SizedBox(
              child:
              Icon(Icons.contact_emergency),
            )
          ],
        )],
      ),
    );
  }
}

