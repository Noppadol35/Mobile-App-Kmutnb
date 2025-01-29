import 'package:flutter/material.dart';
import 'package:ev_charge_car/future_page.dart';
import 'package:http/http.dart' as http;

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  final List<String> items =
      List<String>.generate(10, (int index) => 'Item $index');
  final List<int> colorCodes = <int>[600, 300, 30];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListView Example'),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int item) => ListTile(
                    title: Text(items[item]),
                    tileColor: Colors.amber[colorCodes[item % colorCodes.length]],
                    leading: Image.asset('assets/Porsche-Taycan-White.png'),
                  ),
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyFutureBuilderPage()),
                  );
                },
                child: const Text('Go!'),
              ),
            ],
          ),
        ));
  }
}
