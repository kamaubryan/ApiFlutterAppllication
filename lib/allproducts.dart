import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisplayAllProducts extends StatelessWidget {
  const DisplayAllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu,),
        actions: [

          SizedBox(
            child:
            Icon(Icons.delete_outline_outlined),
          ),
          SizedBox(width: 10,),
          SizedBox(
            child:
            Icon(Icons.contact_emergency,size: 40,),
          )
        ],
        bottom: 
        PreferredSize(preferredSize: Size(Get.width, height), child: child)
        ,
      ),
      
    );
  }
}

