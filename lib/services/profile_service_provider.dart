import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trade/config/app_constants.dart';
import 'package:trade/services/hive_service_provider.dart';
import 'package:trade/utils/api_client.dart';

abstract class ProfileProvider {
  Future<Response> getTrades();
}

class ProfileService implements ProfileProvider {
  final Ref ref;

  ProfileService(this.ref);

  @override
  Future<Response> getTrades() async {
    String? token = await ref.refresh(hiveStoreService).getAuthToken();
    final response = await ref.read(apiClientProvider).post(
      AppConstants.getAccountInfo,
      data: {
        "login": '2088888',
        "token": token,
      },
    );
    return response;
  }
}

final profileServiceProvider = Provider((ref) => ProfileService(ref));
