import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Live Streaming App'),
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClerkAuthentication(),
                ],
              ),
            ),
          ),
        ),
      );
}
