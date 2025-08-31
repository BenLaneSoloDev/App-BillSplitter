import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: Color.fromARGB(255, 45, 143, 255),
            onPrimary: Color.fromARGB(255, 255, 255, 255),
            secondary: Color.fromARGB(255, 45, 189, 255),
            onSecondary: Color.fromARGB(255, 0, 0, 0),
            surface: Color.fromARGB(255, 255, 255, 255),
            onSurface: Color.fromARGB(255, 0, 0, 0),
            error: Color.fromARGB(255, 255, 45, 45),
            onError: Color.fromARGB(255, 255, 255, 255),
          ),

          scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),

          cardTheme: CardThemeData(
            color: Color.fromARGB(255, 45, 189, 255),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 45, 143, 255),
              foregroundColor: Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),

          textTheme: TextTheme(
            bodyMedium: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 16,
            ),
            bodyLarge: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
            ),
            headlineMedium: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Styles Text Field
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
              color: const Color.fromARGB(83, 255, 255, 255),
            ),
            counterStyle: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            labelStyle: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var parties = <String>[];

  // Function to update party size, only in the positives
  void updatePartyTotal(bool added, String partyName) {
    if (added) {
      // Creates specific party
      parties.add(partyName);
    } else if (parties.contains(partyName)) {
      // Removes states party
      parties.removeAt(parties.indexOf(partyName));
    } else {
      print(added);
      print(partyName);
      print("Nothing Happened");
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    int parties = appState.parties.length;
    bool adding = true;

    String header = "Total Parties: $parties";
    if (parties == 0) {
      //defaults header
      header = "How many parties are there?";
    }

    // Creates a box with constraints so things can be scaled
    return LayoutBuilder(
      builder: (context, constraints) {
        // Variable For Storing Value From TextBox
        final textController = TextEditingController();
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class PartyLabel extends StatelessWidget {
  const PartyLabel({
    super.key,
    required this.appState,
    required this.index,
    required this.tabColor,
  });

  final MyAppState appState;
  final int index;
  final Color tabColor;

  @override
  Widget build(BuildContext context) {
    var parties = appState.parties.length;
    bool adding = true;
    String name = appState.parties[index];

    return Align(
      alignment: Alignment.center,
      child: Card(
        color: tabColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(color: Theme.of(context).primaryColorDark),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(name),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // Remove this party
                  appState.updatePartyTotal(!adding, name);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
