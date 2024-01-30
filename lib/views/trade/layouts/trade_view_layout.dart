import 'package:flutter/material.dart';

class TradeLayout extends StatelessWidget {
  const TradeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Text('Trading list'),
        ),
      ),
    );
  }
}
