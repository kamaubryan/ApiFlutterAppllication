import 'package:apiapplication/allproducts.dart';
import 'package:apiapplication/dio_functions.dart';
import 'package:apiapplication/products_page.dart';
import 'package:apiapplication/productwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(GetMaterialApp(
    home: ProductPage(),
  ));
}

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(items: ),
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
                        fit: BoxFit.cover),

                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Elevate your Closet",
                          style: GoogleFonts.stixTwoText(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          width: 200,
                          height: 40,
                          child: FloatingActionButton(
                            backgroundColor: Colors.orangeAccent,
                            onPressed: () {},
                            child: Text('Go to Catalogue',
                              style: GoogleFonts.stixTwoText(
                                  fontWeight: FontWeight.w800, fontSize: 25),),
                          ),
                        ),
                      ])
              ),
              Positioned(
                  bottom: 0,
                  child: Container(width: Get.width,
                    height: 30,
                    decoration: BoxDecoration(color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                  ))

            ],
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular products", style: GoogleFonts.sahitya(
                    fontSize: 40, fontWeight: FontWeight.w500),),
                InkWell(
                  onTap: () {
                    Get.to(Allproducts());
                  },
                  child: Text("View all", style: GoogleFonts.sail(
                      fontSize: 22
                  ),),
                ),

              ],

            ),


          ),
          Container(
            child: FutureBuilder(
              future: getTwoProducts(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                else if (snapshot.hasData) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [for (var i in snapshot.data)
    Productwidget(imagelink: i["image"], title: i['title'], price: i['price'].toString(), )
                  ],);
                }
                return SizedBox();
              },
            ),
          )
        ],
      ),
    );
  }
}
