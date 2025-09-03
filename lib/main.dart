import 'package:app_billsplitter/Screens/Main/home_screen.dart';
import 'package:app_billsplitter/Screens/Main/placeholder_screen.dart';
import 'package:app_billsplitter/Screens/Main/scan_screen.dart';
import 'package:app_billsplitter/Utility(ReuseFunctions)/page_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Importing used components
import 'app_state.dart';
import 'Screens/Main/party_screen.dart';

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
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

// Creates home screen/page and changes it based on state saved ID (could be enum eventually)
class _MainPageState extends State<MainPage> {
  final Map<int, Widget> _screens = {
    PageType.Placeholder: const PlaceholderScreen(),
    PageType.Home: const HomeScreen(),
    PageType.Party: const PartyScreen(),
    PageType.Scan: const ScanScreen(),
  };

  @override
  Widget build(BuildContext context) {
    // Setup default screen (using the state data)
    var appState = context.watch<MyAppState>();
    var page = _screens[appState.pageID];

    // Creates a box with constraints so things can be scaled
    return LayoutBuilder(
      builder: (context, constraints) {
        // Displays the current page ("??" is an alternative for if the [age is returned null])
        return page ?? const Center(child: Text("Page not found"));
      },
    );
  }
}
