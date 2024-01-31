import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trade/config/app_constants.dart';
import 'package:trade/services/hive_service_provider.dart';
import 'package:trade/utils/api_client.dart';

abstract class TradeProvider {
  Future<Response> getTrades();
}

class TradeService implements TradeProvider {
  final Ref ref;

  TradeService(this.ref);

  @override
  Future<Response> getTrades() async {
    final String? token = await ref.read(hiveStoreService).getAuthToken();
    final response = await ref.read(apiClientProvider).post(
      AppConstants.getTrades,
      data: {
        "login": "2088888",
        "token": token,
      },
    );
    return response;
  }
}

final tradeServiceProvider = Provider((ref) => TradeService(ref));
