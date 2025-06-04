import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zego_cloud_live_streaming_app/data/config/env_config.dart';
import 'package:zego_cloud_live_streaming_app/presentation/cubits/user/user_cubit.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

class LivePage extends StatelessWidget {
  final bool isHost;
  final String liveId;

  const LivePage({
    super.key,
    required this.liveId,
    required this.isHost,
  });

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserCubit>().state!;

    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
        appID: EnvConfig().zegoAppId, // use your appID
        appSign: EnvConfig().zegoAppSign, // use your appSign
        userID: user.id,
        userName: user.email!,
        liveID: liveId,
        config: isHost
            ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
            : ZegoUIKitPrebuiltLiveStreamingConfig.audience(),
      ),
    );
  }
}
