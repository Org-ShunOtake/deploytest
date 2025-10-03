// web_pop_handler.dart  (web 実装)
import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

void attachWebPopHandler(void Function() onPop) {
  // popstate を検知して即座に replaceState で元に戻す
  web.window.onPopState.listen((event) {
    debugPrint("${web.window.location.href}");
    // Flutterへの伝達をブロック
    event.preventDefault();
    event.stopImmediatePropagation();
    onPop();
  });
}
