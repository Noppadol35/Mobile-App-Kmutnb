// ListView

import 'dart:developer';

import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'models/product.dart';
import 'services/http_service.dart';

class MyListPage extends StatefulWidget {
  const MyListPage({super.key});

  @override
  State<MyListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  HttpService httpService = HttpService();

  static const String baseUrl =
      'https://itpart.net/mobile/api/products.php'; // API json
  String baseImgUrl = 'https://itpart.net/mobile/images/'; // base Image

  @override
  Widget build(BuildContext context) {
    // debugPrint("myapp: $baseUrl & $baseImgUrl");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text('ListView Page'),
      ),
      body: Center(
        child: 
        FutureBuilder(
          future: httpService.fetchData(strUrl: baseUrl),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              List<Product>? products = snapshot.data;
              return ListView.separated(
                itemCount: products!.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Image.network(
                    '$baseImgUrl/${products[index].imageUrl}',
                    width: 86,
                  ),
                  title: Text(products[index].title,
                      style: const TextStyle(fontSize: 18)),
                  subtitle: Text(products[index].description),
                  trailing: Column(
                    children: [
                      Text(
                        'Price:${products[index].price}',
                        style: const TextStyle(fontSize: 11),
                      ),
                      //IconButton(onPressed: (){}, icon: const Icon(Icons.add_shopping_cart, size: 18,))
                    ],
                  ),
                      
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          productId: products[index].id,
                        ),
                      )),
                ),
                separatorBuilder: (context, int index) => const Divider(),
              );
            } else {
              return const Text('No data found.');
            }
          },
        ),
      ),
    );
  }
}
