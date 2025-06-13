import 'package:flutter/material.dart';
import '/util/smart_devices_box.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final double verticalPadding = 25.0;
  final double horizontalPadding = 25.0;

  List myDevices = [
    ["Smart Light", "images/lamp.png", false],
    ["Smart cam", "images/cam.png", true],
    ["Smart CR", "images/curtain.png", false],
    ["Smart board", "images/domotics.png", false],
  ];

  void powerSwitchChange(bool value, int index) {
    setState(() {
      myDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: verticalPadding,
                horizontal: horizontalPadding,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu_rounded,
                    size: 45,
                  ),
                  Icon(
                    Icons.person,
                    size: 45,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Home",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  Text(
                    "Ahmed Yasser",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
              child: Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
              child: const Text("Smart Devices",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(25.0),
                itemCount: myDevices.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.2,
                ),
                itemBuilder: (context, index) {
                  return SmartDevicesBox(
                    smartDevicesName: myDevices[index][0],
                    iconPath: myDevices[index][1],
                    powerOn: myDevices[index][2],
                    onChanged: (value) => powerSwitchChange(value, index),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 25, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "All Devices",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
