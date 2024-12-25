import 'package:ev_charge_car/charger_page.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "EV Charger",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 23, 127),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // Header Section
              const Text(
                "Welcome to EV Charger",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 2, 23, 127),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                "Effortlessly track and manage your EV charging needs.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // Image Section
              Image.asset(
                "assets/Porsche-Taycan-White.png",
                height: 200,
              ),

              const SizedBox(height: 20),

              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Icon(Icons.bolt, color: Colors.amber),
                    title: Text(
                      "Real-Time Charging Updates",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Monitor your EV's charging status and efficiency.",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.timer, color: Colors.blue),
                    title: Text(
                      "Charging Timer",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Estimate charging time based on your target SOC.",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.analytics, color: Colors.green),
                    title: Text(
                      "Advanced Analytics",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Optimize charging performance with detailed metrics.",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
              // Call to Action Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 2, 23, 127),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChargerPage(),
                    ),
                  );
                },
                child: const Text(
                  "Get Started",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),

              const SizedBox(height: 20),

              // Footer Section
              const Text(
                "Your partner for sustainable EV charging solutions.",
                style: TextStyle(fontSize: 14, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
    
  }
}
