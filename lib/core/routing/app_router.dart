import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mpstory/features/auth/presentation/login_controller.dart';
import 'package:mpstory/features/auth/presentation/login_screen.dart';
import 'package:mpstory/features/home/presentation/home_screen.dart';



final appRouterProvider = Provider<GoRouter>((ref) {
  final status = ref.watch(loginControllerProvider);

  return GoRouter(
    initialLocation: '/',
    refreshListenable: GoRouterRefreshListenable(ref),
    redirect: (context, state) {
      final loggingIn = state.matchedLocation == '/';
      final isAuth = status == AuthStatus.authenticated;
      if (!isAuth && !loggingIn) return '/';
      if (isAuth && loggingIn) return '/home';
      return null;
    },
    routes: [
      GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
      GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    ],
  );
});

class GoRouterRefreshListenable extends ChangeNotifier {
  GoRouterRefreshListenable(this.ref) {
    ref.listen<AuthStatus>(loginControllerProvider, (_, __) {
      notifyListeners();
    });
  }
  final Ref ref;
}
