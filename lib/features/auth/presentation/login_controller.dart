import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mpstory/features/auth/data/auth_repository.dart';


enum AuthStatus { initial, loading, authenticated, unauthenticated }

final loginControllerProvider =
    StateNotifierProvider<LoginController, AuthStatus>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return LoginController(repo);
});

class LoginController extends StateNotifier<AuthStatus> {
  LoginController(this._repo)
      : super(_repo.isLoggedIn ? AuthStatus.authenticated : AuthStatus.initial);
  final AuthRepository _repo;

  Future<void> login() async {
    state = AuthStatus.loading;
    final success = await _repo.login();
    if (success) {
      state = AuthStatus.authenticated;
    } else {
      state = AuthStatus.unauthenticated;
    }
  }

  void logout() {
    _repo.logout();
    state = AuthStatus.unauthenticated;
  }
}
