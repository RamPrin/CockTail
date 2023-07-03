import 'package:capstone/core/navigation/routes.dart';
import 'package:capstone/data/api/api_models/mixup_result_request_model.dart';
import 'package:capstone/presentation/home_screen.dart';
import 'package:capstone/presentation/mix_result_screen/mix_result_screen.dart';
import 'package:capstone/presentation/mix_screen/mix_screen.dart';
import 'package:capstone/presentation/pick_screen/pick_screen.dart';
import 'package:capstone/presentation/top_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: Routes.home,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: HomeScreen()),
      routes: [
        GoRoute(
          path: Routes.mixPage,
          name: Routes.mixPage,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: MixScreen()),
          routes: [
            GoRoute(
              path: Routes.mixResultPage,
              name: Routes.mixResultPage,
              pageBuilder: (context, state) {
                final include = state.queryParametersAll['include'];
                final exclude = state.queryParametersAll['exclude'];

                return NoTransitionPage(
                  child: MixResultScreen(
                    request: MixUpResultRequest(
                      include: include ?? [],
                      exclude: exclude ?? [],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: Routes.topPage,
          name: Routes.topPage,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: TopScreen()),
        ),
        GoRoute(
          path: Routes.search,
          name: Routes.search,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: PickScreen()),
        ),
      ],
    ),
  ],
);
