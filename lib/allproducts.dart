import 'package:apiapplication/productwidget.dart';
import 'package:flutter/material.dart';

import 'dio_functions.dart';


class DisplayAllProducts extends StatelessWidget {
  const DisplayAllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, size: 30),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                SizedBox(
                  child: Icon(Icons.delete_outline_outlined, size: 30,),
                ),
                SizedBox(width: 10),
                SizedBox(
                  child: Icon(
                    Icons.contacts_sharp,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Discover products",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                ),
                Icon(Icons.filter_alt_outlined),
              ],
            ),
          ),
        ),
      ),
      body: Column(

        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryBox("Men", Colors.grey),
                _buildCategoryBox("Chairs", Colors.black),
                _buildCategoryBox("Tables", Colors.grey),
                _buildCategoryBox("Kitchen", Colors.grey),
              ],
            ),
          ),
    Container(
    color: Colors.white,
    child: FutureBuilder<List<dynamic>>(
    future: fetchAllProducts(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
    return Center(child: CircularProgressIndicator());
    } else if (snapshot.hasData) {
    return SingleChildScrollView(
    scrollDirection: Axis.horizontal, // Makes the row scrollable horizontally
    child: Row(
    children: [
    for (var i = 0; i < snapshot.data!.length; i++)
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5.0), // Gap between items
    child: Productwidget(
    imagelink: snapshot.data![i]["image"],
    title: snapshot.data![i]['title'],
    price: snapshot.data![i]['price'].toString(),
    ),
    ),
    ],
    ),
    );
    } else if (snapshot.hasError) {
    return Center(child: Text('Error: ${snapshot.error}'));
    } else {
    return Center(child: Text('No products available.'));
    }
    },
    ),
    )

    ],
      ),
    );
  }

  Widget _buildCategoryBox(String title, Color backgroundColor , ) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 80,
      height: 50,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(18), // Rounded corners
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: Colors.white, // Text color for contrast
        ),
      ),
    );
  }
}
