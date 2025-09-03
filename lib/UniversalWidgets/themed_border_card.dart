import 'package:flutter/material.dart';
import '../app_state.dart';

class ThemedBorderCard extends StatelessWidget {
  const ThemedBorderCard({
    super.key,
    required this.appState,
    required this.widget,
  });

  final MyAppState appState;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      color: Theme.of(context).colorScheme.onPrimary,
      child: Container(
        padding: EdgeInsets.all(5.0),
        color: Theme.of(context).colorScheme.primary,
        child: Container(
          padding: EdgeInsets.all(5.0),
          color: Theme.of(context).colorScheme.onPrimary,
          child: widget,
        ),
      ),
    );
  }
}
