import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static final EnvConfig _instance = EnvConfig._internal();
  factory EnvConfig() => _instance;
  EnvConfig._internal();

  late int _zegoAppId;
  int get zegoAppId => _zegoAppId;

  late String _zegoAppSign;
  String get zegoAppSign => _zegoAppSign;

  late String _clerkKey;
  String get clerkKey => _clerkKey;

  Future<void> initialize() async {
    await dotenv.load();

    final zegoAppId = dotenv.env['ZEGO_APP_ID'];
    final zegoAppSign = dotenv.env['ZEGO_APP_SIGN'];
    final clerkKey = dotenv.env['CLERK_KEY'];

    if (zegoAppId == null || zegoAppSign == null || clerkKey == null) {
      throw Exception('One of more env vars are null');
    }

    _zegoAppId = int.parse(zegoAppId);
    _zegoAppSign = zegoAppSign;
    _clerkKey = clerkKey;
  }
}
