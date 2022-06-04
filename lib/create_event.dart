import 'package:flutter/material.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  State<CreateEvent> createState() => _CreateEvent();
}

class _CreateEvent extends State<CreateEvent> {
  var fields = [CreateEventFields.name, CreateEventFields.type];
  String? name;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: appBar(),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          final field = fields[index];
          // return Text(item.name);
          return TextField(
              decoration: InputDecoration(
                label: Text("COME BACK TO")
              ),
          );
        },
      ),
    );
  }
}

enum CreateEventFields {
  name,
  type
}

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
    );
  }

  getAppBarDateText() {
    var month = DateTime.now().month;
    var day = DateTime.now().day;
    return " $month/$day ";
  }
