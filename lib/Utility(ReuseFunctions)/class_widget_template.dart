import 'package:flutter/material.dart';

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({super.key, required this.appState});

  // Where static variables of this class lie
  final int appState;
  // final MyAppState appState;

  @override
  // Create the type of widget build context (choose right one)
  Widget build(BuildContext context) {
    // Where dynamic variables of this class lie

    // The return widget of this class
    return Text("Text");
  }
}
