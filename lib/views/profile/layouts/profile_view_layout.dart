import 'package:flutter/material.dart';

class ProfileLayout extends StatelessWidget {
  const ProfileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Text('Profile'),
        ),
      ),
    );
  }
}
