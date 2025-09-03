import 'package:app_billsplitter/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../UniversalWidgets/page_change_bar.dart';
import '../../Utility(ReuseFunctions)/page_type.dart';

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key});

  @override
  // Create the type of widget build context (choose right one)
  Widget build(BuildContext context) {
    // grab appState
    var appState = context.watch<MyAppState>();

    int lastPage = PageType.Party;
    int nextPage = PageType.Home;

    return Center(
      child: PageSwapBar(
        appState: appState,
        lastPage: lastPage,
        nextPage: nextPage,
      ),
    );
  }
}
