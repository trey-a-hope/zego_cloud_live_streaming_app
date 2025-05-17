import 'package:flutter/material.dart';
import 'package:zego_cloud_live_streaming_app/data/config/env_config.dart';
import 'package:zego_cloud_live_streaming_app/presentation/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvConfig().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}
