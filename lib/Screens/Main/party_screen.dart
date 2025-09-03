import 'package:app_billsplitter/Utility(ReuseFunctions)/page_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../SubWidgets/party_card.dart';
import '../../app_state.dart';
import '../../UniversalWidgets/page_change_bar.dart';

class PartyScreen extends StatelessWidget {
  const PartyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Gets access to the app state
    var appState = context.watch<MyAppState>();
    int parties = appState.parties.length;

    // Setup variables for page traversal
    int lastPage = PageType.Scan;
    int nextPage = PageType.Placeholder;

    // Variable to determine if user is added or removed
    bool adding = true;

    // Variable For Storing Value From TextBox
    final textController = TextEditingController();

    // Sets up header text for party
    String header = "Total Parties: $parties";
    if (parties == 0) {
      //defaults header
      header = "How many parties are there?";
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 80.0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    header,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: parties,
                        itemBuilder: (context, index) {
                          // Generates Colour to give each party tab
                          final color = Colors
                              .primaries[index % Colors.primaries.length]
                              .shade300;
                          // Creates each party tab
                          return PartyLabel(
                            appState: appState,
                            index: index,
                            tabColor: color,
                          );
                        },
                      ),
                    ),
                  ),

                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Add Button
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 100,
                              maxWidth: 200,
                            ),
                            child: TextField(
                              // Max characters is 15
                              maxLength: 15,
                              // Controller to hold text box data
                              controller: textController,
                              decoration: InputDecoration(
                                hintText: "Party Name",
                                filled: false,
                                border: InputBorder.none,
                              ),
                              // If the text is entered through
                              onSubmitted: (value) {
                                if (value != "") {
                                  appState.updatePartyTotal(
                                    adding,
                                    textController.text,
                                  );
                                  textController.clear();
                                }
                              },
                              buildCounter:
                                  (
                                    BuildContext context, {
                                    required int currentLength,
                                    required int? maxLength,
                                    required bool isFocused,
                                  }) {
                                    return Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "$currentLength / $maxLength",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: const Color.fromARGB(
                                            255,
                                            109,
                                            63,
                                            63,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                            ),
                          ),

                          SizedBox(width: 10.0),

                          ElevatedButton(
                            onPressed: () {
                              // add a new party (shouldnt submit if blank name)
                              if (textController.text != "" ||
                                  textController.text == "") {
                                appState.updatePartyTotal(
                                  adding,
                                  textController.text,
                                );
                                textController.clear();
                              }
                            },
                            child: Text("+"),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Creates spacing between page swap buttons
                  SizedBox(height: 20.0),

                  // Creates tab at the bootom of screen for swapping pages
                  PageSwapBar(
                    appState: appState,
                    lastPage: lastPage,
                    nextPage: nextPage,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
