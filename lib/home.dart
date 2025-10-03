import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poptest/router_provider/router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ColoredBox(
        color: Colors.red.shade300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("home Page"),
            FilledButton(
              onPressed: () => context.push(PagePath.next),
              child: Text("go next"),
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ColoredBox(
        color: Colors.yellow.shade300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Next Page"),
            FilledButton(
              onPressed: () => context.pop(),
              child: Text("go back"),
            ),
          ],
        ),
      ),
    );
  }
}
