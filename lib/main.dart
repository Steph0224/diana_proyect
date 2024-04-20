import 'package:diana_proyect/presentation/providers/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:diana_proyect/config/router/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ref) {
    return ProviderScope(
      child: Consumer(
        builder: (context, ref, child) {
          final themeColor = ref.watch(themeColorProvider);
          final themeBrightness = ref.watch(themeBrightnessProvider);

          return MaterialApp.router(
            title: 'Diana AI',
            routerConfig: appRouter,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: themeColor, brightness: themeBrightness),
              useMaterial3: true,
            ),
          );
        },
      ),
    );
  }
}
