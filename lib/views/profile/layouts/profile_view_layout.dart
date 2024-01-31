import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trade/controllers/trade_controller.dart';

class ProfileLayout extends StatelessWidget {
  const ProfileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        resizeToAvoidBottomInset: false,
        body: Consumer(builder: (context, ref, _) {
          final asyncValue = ref.watch(accountInfoControllerProvider);
          return asyncValue.when(
            data: (accountInfo) => const Center(
              child: Text('Profile'),
            ),
            error: (error, stracTrace) => const Center(
              child: Text('Somthing went wrong!'),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }),
      ),
    );
  }
}
