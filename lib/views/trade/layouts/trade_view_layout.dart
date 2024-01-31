import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trade/controllers/profile_controller.dart';

class TradeLayout extends StatelessWidget {
  const TradeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Trade List'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        resizeToAvoidBottomInset: false,
        body: Consumer(builder: (context, ref, _) {
          final asyncValue = ref.watch(tradeControllerProvider);
          return asyncValue.when(
            data: (tradeList) => const Text('data'),
            error: (error, stackTrace) => const Center(
              child: Text(
                'Something went wrong!',
              ),
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
