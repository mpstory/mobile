import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

class AuthRepository {
  bool _loggedIn = false;

  bool get isLoggedIn => _loggedIn;

  Future<bool> login() async {
    // simulate a network delay
    await Future.delayed(const Duration(seconds: 2));
    _loggedIn = true;
    return _loggedIn;
  }

  void logout() {
    _loggedIn = false;
  }
}
