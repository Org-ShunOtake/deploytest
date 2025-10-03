import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poptest/home.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

class PagePath {
  static final home = "/";
  static final next = "/next";
}

@riverpod
class Router extends _$Router {
  @override
  GoRouter build() {
    return GoRouter(
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return Scaffold(body: Center(child: child));
          },
          routes: [
            GoRoute(
              path: PagePath.home,
              builder: (context, state) => PopScope(
                canPop: false,
                child: HomePage(),
                onPopInvokedWithResult: (didPop, result) {
                  //あえて何もしない
                },
              ),
            ),
            GoRoute(
              path: PagePath.next,
              builder: (context, state) => PopScope(
                canPop: false,
                child: NextPage(),
                onPopInvokedWithResult: (didPop, result) {
                  //あえて何もしない
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
