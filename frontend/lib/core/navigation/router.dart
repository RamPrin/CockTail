import 'package:capstone/core/navigation/routes.dart';
import 'package:capstone/presentation/home_screen.dart';
import 'package:capstone/presentation/mix_screen/mix_result_screen.dart';
import 'package:capstone/presentation/mix_screen/mix_screen.dart';
import 'package:capstone/presentation/pick_screen.dart';
import 'package:capstone/presentation/top_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: Routes.mixPage,
          name: Routes.mixPage,
          builder: (context, state) => const MixScreen(),
          routes: [
            GoRoute(
              path: Routes.mixResultPage,
              name: Routes.mixResultPage,
              builder: (context, state) => const MixResultScreen(),
            ),
          ],
        ),
        GoRoute(
          path: Routes.topPage,
          name: Routes.topPage,
          builder: (context, state) => const TopScreen(),
        ),
        GoRoute(
          path: Routes.search,
          name: Routes.search,
          builder: (context, state) => const PickScreen(),
        ),
      ],
    ),
  ],
);
