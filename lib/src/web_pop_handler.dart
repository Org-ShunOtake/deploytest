// web_pop_handler.dart  (web 実装)
import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

void attachWebPopHandler(void Function() onPop) {
  // popstate を検知して即座に replaceState で元に戻す
  web.window.onPopState.listen((event) {
    debugPrint("${web.window.location.href}");
    // 直ちに履歴を同じ URL に戻す（履歴を変えない）
    web.window.history.replaceState(null, '', web.window.location.href);
    // 必要ならコールバックを呼ぶ（ログやフラグセット）
    onPop();
  });
}
