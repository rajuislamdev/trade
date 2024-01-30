import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trade/config/app_text_style.dart';
import 'package:trade/routes.dart';
import 'package:trade/services/hive_service_provider.dart';
import 'package:trade/utils/api_client.dart';
import 'package:trade/utils/context_less_navigation.dart';

class SplashLayout extends ConsumerStatefulWidget {
  const SplashLayout({super.key});

  @override
  ConsumerState<SplashLayout> createState() => _SplashLayoutState();
}

class _SplashLayoutState extends ConsumerState<SplashLayout> {
  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    Future.delayed(const Duration(seconds: 3), () async {
      ref.read(hiveStoreService).getAuthToken().then((token) async {
        if (token == null) {
          context.nav.pushNamedAndRemoveUntil(Routes.login, (route) => false);
        } else {
          ref.read(apiClientProvider).updateToken(token: token);
          context.nav
              .pushNamedAndRemoveUntil(Routes.dashboard, (route) => false);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Trade',
          style: AppTextStyle(context).title,
        ),
      ),
    );
  }
}
