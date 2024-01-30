import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trade/config/app_constants.dart';
import 'package:trade/utils/api_client.dart';

abstract class AuthProvider {
  Future<Response> login({required String contact, required String password});
}

class AuthService implements AuthProvider {
  final Ref ref;

  AuthService(this.ref);

  @override
  Future<Response> login(
      {required String contact, required String password}) async {
    final response = await ref.read(apiClientProvider).post(
      AppConstants.login,
      data: {
        'login': contact,
        'password': password,
      },
    );
    return response;
  }
}

final authServiceProvider = Provider((ref) => AuthService(ref));
