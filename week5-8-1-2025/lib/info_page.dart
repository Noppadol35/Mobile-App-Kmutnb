import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  final double? soc;
  final double? tarSoc;
  final double? chargeRate;
  final double? voltage;
  final double? cap;
  final double? eiffic;

  final String? username;
  final String? password;

  const InfoPage(
      {super.key,
      this.soc,
      this.tarSoc,
      this.chargeRate,
      this.voltage,
      this.cap,
      this.eiffic,
      this.username,
      this.password});
  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "EV Charger info",
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
                Text('${widget.soc}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                const SizedBox(height: 10),
                Text('${widget.tarSoc}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                const SizedBox(height: 10),
                Text('${widget.chargeRate}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                const SizedBox(height: 10),
                Text('${widget.voltage}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                const SizedBox(height: 10),
                Text('${widget.cap}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                const SizedBox(height: 10),
                Text('${widget.eiffic}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                const SizedBox(height: 10),
                Text('${widget.username}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                const SizedBox(height: 10),
                Text('${widget.password}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(
                      context,
                      '/',
                    );
                  },
                  child: const Text('Back'),
                ),
              ],
            ),
          ),
        ));
  }
}
