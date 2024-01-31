import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trade/services/auth_service_provider.dart';
import 'package:trade/services/hive_service_provider.dart';
import 'package:trade/utils/api_client.dart';

class AuthController extends StateNotifier<bool> {
  final Ref ref;
  AuthController(this.ref) : super(false);

  // login
  Future<bool> login(
      {required String contact, required String password}) async {
    try {
      state = true;
      final response = await ref
          .read(authServiceProvider)
          .login(contact: contact, password: password);

      final accessToken = response.data['token'];
      ref.read(hiveStoreService).saveUserAuthToken(authToken: accessToken);
      ref.read(hiveStoreService).saveNumber(phoneNumber: contact);
      ref.read(apiClientProvider).updateToken(token: accessToken);
      state = false;
      return true;
    } catch (e) {
      debugPrint(e.toString());
      state = false;
      return false;
    }
  }
}

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) => AuthController(ref));
