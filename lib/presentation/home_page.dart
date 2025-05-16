import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Start a Live')),
            const SizedBox(height: 16), // Add spacing between buttons
            ElevatedButton(onPressed: () {}, child: const Text('Watch a Live')),
          ],
        ),
      ),
    );
  }
}
