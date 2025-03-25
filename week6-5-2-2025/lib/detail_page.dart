import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/product.dart';

class DetailPage extends StatefulWidget {
  final int productId;

  const DetailPage({super.key, required this.productId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String baseImgUrl = 'https://itpart.net/mobile/images/';
  String baseUrl = 'https://itpart.net/mobile/api/';

  Future<Product> fetchRecord(int productId) async {
    final response = await http.get(
      Uri.parse("${baseUrl}product$productId.php"),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      debugPrint('Failed to load data!');
      throw Exception('Failed to load data!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text('Detail Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              FutureBuilder<Product>(
                future: fetchRecord(widget.productId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    final product = snapshot.data!;
                    return Column(
                      children: [
                        Text(
                          product.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 10),
                        Image.network(
                          '$baseImgUrl${product.imageUrl}',
                          errorBuilder: (context, error, stackTrace) => 
                            const Icon(Icons.image_not_supported, size: 50),
                        ),
                        const SizedBox(height: 20),
                        Text(product.description,
                            style: const TextStyle(fontSize: 18)),
                        const SizedBox(height: 20),
                        Text('Price: ${product.price}',
                            style: const TextStyle(fontSize: 18)),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}',
                        style: const TextStyle(fontSize: 18, color: Colors.red));
                  }
                  return const Text('No data available!');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
