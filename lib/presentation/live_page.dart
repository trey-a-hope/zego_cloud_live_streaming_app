import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zego_cloud_live_streaming_app/data/config/env_config.dart';
import 'package:zego_cloud_live_streaming_app/data/models/user.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

class LivePage extends StatelessWidget {
  const LivePage({super.key, this.isHost = false});
  final bool isHost;

  @override
  Widget build(BuildContext context) {
    final user = User.empty();
    final user2 = User(userID: 'user2', userName: 'user2');
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
        appID: EnvConfig().zegoAppId, // use your appID
        appSign: EnvConfig().zegoAppSign, // use your appSign
        userID: '',
        userName: '',
        liveID: 'testLiveID',
        config:
            isHost
                ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
                : ZegoUIKitPrebuiltLiveStreamingConfig.audience(),
      ),
    );
  }
}
