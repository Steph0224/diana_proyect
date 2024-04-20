import 'package:diana_proyect/presentation/pages/home_page.dart';
import 'package:diana_proyect/presentation/pages/test_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/home",
  routes: [
    GoRoute(
      builder: (context, state) => const HomePage(),
      path: "/home",
    ),
    GoRoute(
      builder: (context, state) => const TestPage(),
      path: "/test",
    )
  ],
);
