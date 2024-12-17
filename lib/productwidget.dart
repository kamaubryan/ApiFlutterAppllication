import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Productwidget extends GetView {
  final String?  imagelink;
  final String title;
  final String price;
  const Productwidget({super.key,   this.imagelink,  required this.title,  required this.price});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 180,
       child: Column(
         children: [
           SizedBox(
               width: 120,
               child: Image.network(imagelink ?? "")),
           Text(title, style: TextStyle(),textAlign: TextAlign.center,),
           Text(price)

         ],
       ),
    );
  }
}
