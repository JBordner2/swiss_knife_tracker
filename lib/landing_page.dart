import 'package:flutter/material.dart';
import 'mock_events.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<Event> events = generateRandomEvents();

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Scaffold(
      appBar: appBar(),
      floatingActionButton: floatingActionButton(),
      body: ListView.builder(
        // Let the ListView know how many items it needs to build.
        itemCount: events.length,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.
        itemBuilder: (context, index) {
          final event = events[index];
          // return Text(item.name);
          return ListTile(
            title: Text(event.name),
            tileColor: getTileColor(index),
            subtitle: Text(event.createdAtLongDisplayText()),
          );
        },
      ),
    );
  }

  // Can delete this... Just using this so I'm able to see height of tile...
  Color getTileColor(int index) {
    if (index.isOdd) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  AppBar appBar() {
    return AppBar(
      title: Text(getAppBarDateText()),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20, top: 20),
          child:  GestureDetector(
            onTap: () {
              print("SORT ME");
            },
            child: Text(
                "Sort"
            ),
          ),
        )
      ],
    );
  }

  FloatingActionButton floatingActionButton() {
    return FloatingActionButton(
      onPressed: () { print("TODO: GO TO CREATE EVENT PAGE");},
      // tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }

  getAppBarDateText() {
    var month = DateTime.now().month;
    var day = DateTime.now().day;
    return " $month/$day ";
  }
}

