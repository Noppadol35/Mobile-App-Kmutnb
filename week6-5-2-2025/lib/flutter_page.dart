import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String> fetchData() async {
    // Simulate a network call
    final response = await http.get(Uri.parse('https://itpart.net/mobile/api/product1.php'));

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);
      String strBody = response.body.toString();

      return strBody;

    } else {
      throw Exception('Failed to load data');
    }
  }

class MyFutureBuilderPage extends StatefulWidget {
  const MyFutureBuilderPage({super.key});

  @override
  State<MyFutureBuilderPage> createState() => _MyFutureBuilderPageState();
}

class _MyFutureBuilderPageState extends State<MyFutureBuilderPage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: const Text('FutureBuilder Page'),
        ),
        body: Center(
          child: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('${snapshot.data}',
                    style: const TextStyle(fontSize: 20));
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ));
  }
}