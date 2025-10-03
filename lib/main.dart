import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poptest/router_provider/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(child: App());
  }
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return PopScope(
      canPop: false,
      child: MaterialApp.router(
        routerConfig: router,
        theme: ThemeData(
          fontFamily: 'NotoSansJP',
          fontFamilyFallback: kIsWeb ? ['NotoColorEmoji'] : null,
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: Color(0x3370A6A8), // 選択範囲の色
            cursorColor: Color(0xFF70A6A8), // カーソルの色
            selectionHandleColor: Color(0xFF70A6A8),
          ), // ハンドルの色
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
      ),
    );
  }
}
