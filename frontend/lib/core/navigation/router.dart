import 'package:capstone/core/navigation/routes.dart';
import 'package:capstone/data/api/api_models/mixup_result_request_model.dart';
import 'package:capstone/data/api/api_models/pick_up_result_request.dart';
import 'package:capstone/presentation/home_screen.dart';
import 'package:capstone/presentation/mix_result_screen/mix_result_screen.dart';
import 'package:capstone/presentation/mix_screen/mix_screen.dart';
import 'package:capstone/presentation/pick_result_screen/pick_result_screen.dart';
import 'package:capstone/presentation/pick_screen/pick_screen.dart';
import 'package:capstone/presentation/top_screen/top_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      name: Routes.home,
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
              path: Routes.resultPage,
              name: RouteNames.mixUpResult,
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
          path: Routes.pickPage,
          name: Routes.pickPage,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: PickScreen()),
          routes: [
            GoRoute(
              path: Routes.resultPage,
              name: RouteNames.pickUpResult,
              pageBuilder: (context, state) {
                final params = state.queryParameters;
                print(params);
                final alcoholFree =
                    bool.tryParse(params['alcohol_free'] ?? "false") ?? false;
                final minAlc = int.tryParse(params['min_alc'] ?? "0") ?? 0;
                final maxAlc = int.tryParse(params['max_alc'] ?? "55") ?? 55;
                final sweet = int.tryParse(params['sweet'] ?? "5") ?? 5;
                final sour = int.tryParse(params['sour'] ?? "5") ?? 5;
                final savory = int.tryParse(params['savory'] ?? "5") ?? 5;
                final bitter = int.tryParse(params['bitter'] ?? "5") ?? 5;
                final creamy =
                    bool.tryParse(params['creamy'] ?? "false") ?? false;
                final spicy =
                    bool.tryParse(params['spicy'] ?? "false") ?? false;
                final fruity =
                    bool.tryParse(params['fruity'] ?? "false") ?? false;

                return NoTransitionPage(
                  child: PickResultScreen(
                    request: PickUpResultRequest(
                      alcoolFree: alcoholFree,
                      minAlc: minAlc / 100,
                      maxAlc: maxAlc / 100,
                      sweet: sweet,
                      sour: sour,
                      savory: savory,
                      bitter: bitter,
                      cream: creamy,
                      spicy: spicy,
                      fruity: fruity,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
