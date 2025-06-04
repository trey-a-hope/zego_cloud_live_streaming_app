import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:zego_cloud_live_streaming_app/presentation/cubits/user/user_cubit.dart';
import 'package:zego_cloud_live_streaming_app/presentation/enter_live_id_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserCubit>().state!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: const [
          ClerkSignOutPanel(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${user.email}'),
            const Gap(32),
            ElevatedButton(
              child: const Text('Start a live'),
              onPressed: () => _jumpToEnterLiveIdPage(context, isHost: true),
            ),
            const Gap(8),
            ElevatedButton(
              child: const Text('Watch a live'),
              onPressed: () => _jumpToEnterLiveIdPage(context, isHost: false),
            ),
          ],
        ),
      ),
    );
  }

  _jumpToEnterLiveIdPage(BuildContext context, {required bool isHost}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EnterLiveIdPage(isHost: isHost),
      ),
    );
  }
}
