import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zego_cloud_live_streaming_app/data/config/env_config.dart';
import 'package:zego_cloud_live_streaming_app/presentation/cubits/user/user_cubit.dart';
import 'package:zego_cloud_live_streaming_app/presentation/home_page.dart';
import 'package:zego_cloud_live_streaming_app/presentation/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvConfig().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserCubit(),
      child: ClerkAuth(
        config: ClerkAuthConfig(publishableKey: EnvConfig().clerkKey),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: ClerkErrorListener(
            child: ClerkAuthBuilder(signedInBuilder: (context, authState) {
              final user = authState.user!;
              context.read<UserCubit>().saveUser(user);
              return const HomePage();
            }, signedOutBuilder: (context, authState) {
              context.read<UserCubit>().clearUser();
              return const LoginPage();
            }),
          ),
        ),
      ),
    );
  }
}
