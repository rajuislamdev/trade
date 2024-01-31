import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trade/models/account_info.dart';
import 'package:trade/services/profile_service_provider.dart';

class AccountInfoController extends StateNotifier<AsyncValue<AccountInfo>> {
  final Ref ref;
  AccountInfoController(this.ref) : super(const AsyncLoading());

  Future<void> getAccountInfo() async {
    try {
      final response = await ref.read(profileServiceProvider).getAccountInfo();
      final dynamic data = response.data;
      final AccountInfo accountInfo = AccountInfo.fromMap(data);
      state = AsyncData(accountInfo);
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      state = AsyncError(e.toString(), stackTrace);
      rethrow;
    }
  }
}

final accountInfoControllerProvider = StateNotifierProvider.autoDispose<
    AccountInfoController, AsyncValue<AccountInfo>>(
  (ref) {
    final controler = AccountInfoController(ref);
    controler.getAccountInfo();
    return controler;
  },
);

class LastFourNumberController extends StateNotifier<AsyncValue<String>> {
  final Ref ref;
  LastFourNumberController(this.ref) : super(const AsyncLoading());

  Future<void> getLastFourNumber() async {
    try {
      final response =
          await ref.read(profileServiceProvider).getLastFourNumber();
      final dynamic data = response.data;
      state = AsyncData(data.toString());
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      state = AsyncError(e.toString(), stackTrace);
      rethrow;
    }
  }
}

final lastFourNumberControllerProvider = StateNotifierProvider.autoDispose<
    LastFourNumberController, AsyncValue<String>>(
  (ref) {
    final controler = LastFourNumberController(ref);
    controler.getLastFourNumber();
    return controler;
  },
);
