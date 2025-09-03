import 'package:app_billsplitter/Utility(ReuseFunctions)/page_type.dart';
import 'package:app_billsplitter/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../UniversalWidgets/themed_border_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Create appstate to access
    var appState = context.watch<MyAppState>();
    // Setup variables for page traversal
    int lastPage = appState.pageID;
    int nextPage = PageType.Scan;

    return ThemedBorderCard(
      appState: appState,
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10.0,
        children: [
          // Create the page title
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Welcome to Bill-Splitter",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),

          // Button to proceed
          ElevatedButton(
            onPressed: () {
              // Sends user to the page to scan their reciepts
              appState.changePage(nextPage);
            },
            child: Text("Next Page"),
          ),
          // Button to check reciepts
          ElevatedButton(
            onPressed: () {
              // Has blank print statement whilst this page displays nothing
              print("Printing old Reciepts... (It isnt though)");
            },
            child: Text("Old Reciepts"),
          ),
        ],
      ),
    );
  }
}
