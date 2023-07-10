import 'package:capstone/core/assets/assets.dart';
import 'package:capstone/core/navigation/router.dart';
import 'package:capstone/core/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final callback = useCallback(
        () => router.addListener(() {
              ref.read(routeProvider.notifier).state = router.location;
            }),
        [router]);

    useEffect(() {
      router.addListener(callback);
      return () => router.removeListener(callback);
    }, [router]);

    final name = ref.watch(routeNameProvider);

    return MaterialApp.router(
      routerConfig: router,
      title: name,
      theme: ThemeData(
        fontFamily: Fonts.sansation,
      ),
    );
  }
}

final routeProvider = StateProvider<String>((ref) {
  return "CockTail";
});

final routeNameProvider = Provider<String>((ref) {
  var name = ref.watch(routeProvider);
  if (name.contains("?")) {
    name = name.substring(1, name.indexOf("?"));
  } else {
    name = name.substring(1);
  }
  final nname = switch (name) {
    Routes.home => "CockTail",
    Routes.mixPage => "Mix Up",
    Routes.pickPage => "Pick Up",
    "pick/result" => "Picked Up CockTail",
    "mix/result" => "Mixed Up CockTail",
    Routes.topPage => "Top 10",
    _ => "CockTail",
  };
  return nname;
});
