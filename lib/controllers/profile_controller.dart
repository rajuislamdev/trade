import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trade/services/trade_service_provider.dart';

class TradeController extends StateNotifier<AsyncValue> {
  final Ref ref;
  TradeController(this.ref) : super(const AsyncLoading());

  Future<void> getTrades() async {
    try {
      final response = await ref.read(tradeServiceProvider).getTrades();
      // final data = OrderDetails.fromMap(response.data['data']['order']);
      state = const AsyncData('data');
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      state = AsyncError(e.toString(), stackTrace);
      rethrow;
    }
  }
}

final tradeControllerProvider =
    StateNotifierProvider.autoDispose<TradeController, AsyncValue>(
  (ref) {
    final controler = TradeController(ref);
    controler.getTrades();
    return controler;
  },
);
