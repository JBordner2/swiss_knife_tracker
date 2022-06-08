import 'package:flutter/material.dart';
import 'mock_events.dart';
import 'DataModels/EventModel.dart';
import 'DataModels/HardcodedStringModels.dart';

class NestedColumns extends StatefulWidget {
  const NestedColumns({Key? key}) : super(key: key);

  @override
  State<NestedColumns> createState() => _NestedColumns();
}

class _NestedColumns extends State<NestedColumns> {
  List<EventModel> events = generateRandomEvents();

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Scaffold(
      appBar: appBar(),
      body:
      Column(
        children: <Widget> [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 2,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              if (index == 0) {
                final event = events[index];
                return Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    child: Row(
                      children: [
                        Text("IMG"),

                        Text("Jack Bordner"),
                      ],
                    )
                    ,
                  ));
                // return Container(
                //   child: Text("Jack"),
                // )
              } else {
                final event = events[index];
                return ListTile(
                  title: Text(event.name ?? invalid),
                  tileColor: getTileColor(index),
                  subtitle: Text(event.createdAtLongDisplayText() ?? invalid),
                );
              }
            },
          ),
        ],
      )
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