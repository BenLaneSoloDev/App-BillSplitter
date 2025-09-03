import 'package:app_billsplitter/UniversalWidgets/themed_border_card.dart';
import 'package:app_billsplitter/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../UniversalWidgets/page_change_bar.dart';
import '../../Utility(ReuseFunctions)/page_type.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // initilise appState
    var appState = context.watch<MyAppState>();

    // Setup variables for page traversal
    int lastPage = PageType.Home;
    int nextPage = PageType.Party;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // The title of the page
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "Scan Reciept",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),

        // The area where the camera visual will be for scanning
        ThemedBorderCard(
          appState: appState,
          widget: Container(
            color: Theme.of(context).colorScheme.secondary,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Icon(Icons.camera_alt, size: 80.0),
            ),
          ),
        ),

        // Padding between page
        SizedBox(height: 20.0),

        // Navigation bar for swapping page
        PageSwapBar(appState: appState, lastPage: lastPage, nextPage: nextPage),
      ],
    );
  }
}
