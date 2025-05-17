import 'package:flutter/material.dart';
import 'package:zego_cloud_live_streaming_app/presentation/live_page.dart';

/// HomePage is the initial screen of the application that provides options
/// to either start a new live stream or watch an existing one.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Button to start a new live stream as a host
            ElevatedButton(
              child: const Text('Start a live'),
              onPressed: () => _jumpToLivePage(context, isHost: true),
            ),
            // Button to join an existing live stream as a viewer
            ElevatedButton(
              child: const Text('Watch a live'),
              onPressed: () => _jumpToLivePage(context, isHost: false),
            ),
          ],
        ),
      ),
    );
  }

  /// Navigates to the LivePage with the specified host status.
  ///
  /// [context] is used for navigation.
  /// [isHost] determines if the user is starting a new stream (true) or watching one (false).
  _jumpToLivePage(BuildContext context, {required bool isHost}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LivePage(isHost: isHost)),
    );
  }
}
