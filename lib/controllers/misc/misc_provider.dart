// Bottom Navigation Tab Controller
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomTabControllerProvider =
    Provider<PageController>((ref) => PageController());

// All State Provider
final selectedIndexProvider = StateProvider<int>((ref) => 0);
final activeTabIndex = StateProvider<int>((ref) => 0);
final obscureText1 = StateProvider<bool>((ref) => true);
