import 'package:app_billsplitter/Utility(ReuseFunctions)/page_type.dart';
import 'package:flutter/material.dart';
import '../app_state.dart';

class PageSwapBar extends StatelessWidget {
  const PageSwapBar({
    super.key,
    required this.appState,
    required this.lastPage,
    required this.nextPage,
  });

  // Where static variables of this class lie
  final MyAppState appState;
  final int lastPage;
  final int nextPage;

  @override
  // Create the type of widget build context (choose right one)
  Widget build(BuildContext context) {
    // Where dynamic variables of this class lie

    // The return widget of this class
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10.0,
      children: [
        // The back button
        ElevatedButton(
          onPressed: () {
            // Sends user to the previously entered page
            appState.changePage(lastPage);
          },
          child: Icon(Icons.arrow_back),
        ),

        // The forward button
        ElevatedButton(
          onPressed: () {
            // Sends user to the previously entered page
            appState.changePage(nextPage);
          },
          child: Icon(Icons.arrow_forward),
        ),
      ],
    );
  }
}
