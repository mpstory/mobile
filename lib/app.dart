import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/routing/app_router.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    
    // return const MaterialApp(
    //   home: Scaffold(
    //     body: Center(
    //       child: Text('Hello World!'),
    //     ),
    //   ),
    // );

    return MaterialApp.router(
      title: 'Riverpod Starter',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: router,
    );
  }
}
