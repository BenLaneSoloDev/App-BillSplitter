import 'package:flutter/material.dart';
import '../../app_state.dart';

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
