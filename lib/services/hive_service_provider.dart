import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trade/config/app_constants.dart';

class HiveService {
  final Ref ref;

  HiveService(this.ref);

  // save access token
  Future saveUserAuthToken({required String authToken}) async {
    final authBox = await Hive.openBox(AppConstants.authBox);
    authBox.put(AppConstants.authToken, authToken);
  }

  // save login
  Future saveNumber({required String phoneNumber}) async {
    final authBox = await Hive.openBox(AppConstants.authBox);
    authBox.put(AppConstants.phoneNumber, phoneNumber);
  }

  // get user auth token
  Future<String?> getAuthToken() async {
    final authToken = await Hive.openBox(AppConstants.authBox)
        .then((box) => box.get(AppConstants.authToken));

    if (authToken != null) {
      return authToken;
    }
    return null;
  }

  // get user number
  Future<String?> getUserNumber() async {
    final phoneNumber = await Hive.openBox(AppConstants.authBox)
        .then((box) => box.get(AppConstants.phoneNumber));

    if (phoneNumber != null) {
      return phoneNumber;
    }
    return null;
  }

  // remove access token
  Future<bool> logout() async {
    try {
      final authBox = await Hive.openBox(AppConstants.authBox);
      authBox.delete(AppConstants.authToken);
      authBox.delete(AppConstants.phoneNumber);
      return true;
    } catch (error) {
      debugPrint(error.toString());
      return false;
    }
  }
}

final hiveStoreService = Provider((ref) => HiveService(ref));
