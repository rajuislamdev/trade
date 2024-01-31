import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trade/services/profile_service_provider.dart';

class AccountInfoController extends StateNotifier<AsyncValue> {
  final Ref ref;
  AccountInfoController(this.ref) : super(const AsyncLoading());

  Future<void> getAccountInfo() async {
    try {
      final response = await ref.read(profileServiceProvider).getTrades();
      // final data = OrderDetails.fromMap(response.data['data']['order']);
      state = const AsyncData('data');
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      state = AsyncError(e.toString(), stackTrace);
      rethrow;
    }
  }
}

final accountInfoControllerProvider =
    StateNotifierProvider.autoDispose<AccountInfoController, AsyncValue>(
  (ref) {
    final controler = AccountInfoController(ref);
    controler.getAccountInfo();
    return controler;
  },
);
