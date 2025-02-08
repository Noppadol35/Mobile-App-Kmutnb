import 'package:ev_charge_car/landing_page.dart';
import 'package:flutter/material.dart';
import 'flutter_page.dart';
import 'list_view.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "EV Charging Status",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ChargingStatusPage(),
    );
  }
}

class ChargingStatusPage extends StatelessWidget {
  const ChargingStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage( title: 'KMUTNB APP'),
        '/listview': (context) => const MyListPage(),
        '/flutter': (context) => const MyFutureBuilderPage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}
