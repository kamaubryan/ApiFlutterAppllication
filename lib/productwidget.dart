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
           Text(title, style: TextStyle( fontSize: 17, fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
           Text(price, style: TextStyle( fontSize: 17, fontWeight: FontWeight.w600),textAlign: TextAlign.center,)
         ],
       ),
    );
  }
}

class AllProducts extends StatelessWidget {
  const AllProducts({super.key,   this.id, this.price,  this.image,  this.title});
  final String? id;
  final String? price;
  final String? image;
  final String? title;



  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Column(
        children: [
          paddingOnly(top: 20),
          SizedBox(
            width: Get.width,
            child: Image.network(image ?? ""),

          ),
          Text(id??"", style: TextStyle( fontSize: 17, fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
          Text(title??"", style: TextStyle( fontSize: 17, fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
          Text(price??"", style: TextStyle( fontSize: 17, fontWeight: FontWeight.w600),textAlign: TextAlign.center,)

        ],
      ),
    );
  }
}