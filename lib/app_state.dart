import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  // Stores the ID for page number (ENUM eventually)
  int pageID = 1;

  // Stores the parties via name (could make class later on)
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
