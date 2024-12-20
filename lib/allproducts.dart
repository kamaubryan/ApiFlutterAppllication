import 'package:apiapplication/singleProduct.dart';
import 'package:flutter/material.dart';
import 'package:apiapplication/productwidget.dart';
import 'dio_functions.dart';


class DisplayAllProducts extends StatelessWidget {
  const DisplayAllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, size: 30),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(Icons.delete_outline_outlined, size: 30),
                SizedBox(width: 10),
                Icon(Icons.contacts_sharp, size: 30),
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
                _buildCategoryBox("Jewellery", Colors.black),
                _buildCategoryBox("Electronics", Colors.grey),
                _buildCategoryBox("Women", Colors.grey),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: fetchAllProducts(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.6,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SingleProduct(
                                imageLink: snapshot.data![index]["image"],
                                title: snapshot.data![index]['title'],
                                price: snapshot.data![index]['price'].toString(),
                              ),
                            ),
                          );
                        },
                        child: Productwidget(
                          imagelink: snapshot.data![index]["image"],
                          title: snapshot.data![index]['title'],
                          price: snapshot.data![index]['price'].toString(),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return const Center(child: Text('No products available.'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryBox(String title, Color backgroundColor) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 80,
      height: 50,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
