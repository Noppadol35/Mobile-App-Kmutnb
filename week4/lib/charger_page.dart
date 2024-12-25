import 'package:flutter/material.dart';

class ChargerPage extends StatefulWidget {
  const ChargerPage({super.key});

  @override
  State<ChargerPage> createState() => _ChargerPageState();
}

class _ChargerPageState extends State<ChargerPage> {
  final soc = TextEditingController();
  final tarSoc = TextEditingController();
  final chargeRate = TextEditingController();
  final voltage = TextEditingController();
  final cap = TextEditingController();
  final eiffic = TextEditingController();

  var time = 0.0;
  var power = 0.0;
  var formatTime = "00:00:00";

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
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "$power kWh\nCharging Power",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  Text(
                    "${chargeRate.text} kW\nCharging Rate",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Image.asset("assets/Porsche-Taycan-White.png", height: 170),
              const Text("Porsche Taycan",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const Text("Electric Vehicle",
                  style: TextStyle(fontSize: 13, color: Colors.black54)),
              const SizedBox(height: 10),
              Stack(
                children: [
                  Container(
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                "97%",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                formatTime,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),

              // TextFields in Two Columns
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Current SOC (%)",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          controller: soc,
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Charging Rate(kW)",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          controller: chargeRate,
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          decoration: InputDecoration(
                            hintText: " Capacity(kWh)",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          controller: cap,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Target SOC (%)",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          controller: tarSoc,
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Voltage(V)",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          controller: voltage,
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Efficiency(%)",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          controller: eiffic,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 2, 23, 127),
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  setState(() {
                    double volt = double.parse(voltage.text);
                    double rate = double.parse(chargeRate.text);

                    power = (volt * rate) / 1000;

                    double currentSoc = double.parse(soc.text);
                    double targetSoc = double.parse(tarSoc.text);
                    double efficiency = double.parse(eiffic.text);
                    double capacity = double.parse(cap.text);

                    if (currentSoc < targetSoc && efficiency > 0) {
                      time = ((targetSoc - currentSoc) * capacity) /
                          (power * efficiency) /
                          100;
                      final totalTime = (time * 3600).toInt();
                      final hours =
                          (totalTime ~/ 3600).toString().padLeft(2, '0');
                      final minutes =
                          ((totalTime % 3600) ~/ 60).toString().padLeft(2, '0');
                      final seconds =
                          (totalTime % 60).toString().padLeft(2, '0');

                      formatTime = '$hours:$minutes:$seconds';
                    } else {
                      time = 0.0;
                    }
                  });
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Start Charging",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.electric_car,
                      color: Colors.amber,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
