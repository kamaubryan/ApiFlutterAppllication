import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:apiapplication/dio_functions.dart';
import 'package:get/get.dart';

class ProductsPage extends GetView {
  var args = Get.arguments; //data passed from the previous page through arguments
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: FutureBuilder(
          future: fetchAllProducts(),//pass the future function here
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {//handles whats displayed during the call. in this case its a circular progress indicator
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {//handles whats displayed after the future function has made a successful call and returned some data
              return ListView(
                children: [
                  for (var i in snapshot.data) //snapshot.data contains the response from the function passed under the future property in the futurebuilder
                    ListTile(
                      leading: Text(i['id'].toString()),
                      title: Text(i['title']),
                      subtitle: Text(
                        i['description'],
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: SizedBox(
                        width: 30,
                        child: Image.network(
                          i['image'],
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                ],
              );
            }
            return const Center(
              child: Text("No data found"),
            );
          }),
    );
  }
}