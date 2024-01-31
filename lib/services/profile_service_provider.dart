import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trade/config/app_constants.dart';
import 'package:trade/services/hive_service_provider.dart';
import 'package:trade/utils/api_client.dart';

abstract class ProfileProvider {
  Future<Response> getAccountInfo();
  Future<Response> getLastFourNumber();
}

class ProfileService implements ProfileProvider {
  final Ref ref;

  ProfileService(this.ref);

  @override
  Future<Response> getAccountInfo() async {
    String? token = await ref.refresh(hiveStoreService).getAuthToken();
    final String? number = await ref.read(hiveStoreService).getUserNumber();

    final response = await ref.read(apiClientProvider).post(
      AppConstants.getAccountInfo,
      data: {
        "login": number,
        "token": token,
      },
    );
    return response;
  }

  @override
  Future<Response> getLastFourNumber() async {
    String? token = await ref.refresh(hiveStoreService).getAuthToken();
    final String? number = await ref.read(hiveStoreService).getUserNumber();

    final response = await ref.read(apiClientProvider).post(
      AppConstants.getLastFourNumbersPhone,
      data: {
        "login": number,
        "token": token,
      },
    );
    return response;
  }
}

final profileServiceProvider = Provider((ref) => ProfileService(ref));
