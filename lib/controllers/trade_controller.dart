import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trade/models/trade.dart';
import 'package:trade/services/trade_service_provider.dart';

class TradeController extends StateNotifier<AsyncValue<List<Trade>>> {
  final Ref ref;
  TradeController(this.ref) : super(const AsyncLoading());

  Future<void> getTrades() async {
    try {
      final response = await ref.read(tradeServiceProvider).getTrades();
      final List<dynamic> tradesData = response.data;
      final List<Trade> trades =
          tradesData.map((trade) => Trade.fromMap(trade)).toList();
      state = AsyncData(trades);
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      state = AsyncError(e.toString(), stackTrace);
      rethrow;
    }
  }
}

final tradeControllerProvider =
    StateNotifierProvider.autoDispose<TradeController, AsyncValue<List<Trade>>>(
  (ref) {
    final controler = TradeController(ref);
    controler.getTrades();
    return controler;
  },
);
