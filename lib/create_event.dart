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
      body: Column(
        children: <Widget>[
          CreateEventForm(fields: fields),
          Spacer(),
          submitButton(),
          cancelButton()

          // SizedBox(height: 10)
        ],
      )
    );
  }

  OutlinedButton submitButton() {
    return OutlinedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.green.withAlpha(100),
            minimumSize: const Size.fromHeight(100), // NEW
          ),
          onPressed: () {
            print("Handle submit action");
          },
          child: const Text(
            'Submit',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        );
  }

  OutlinedButton cancelButton() {
    return OutlinedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.red.withAlpha(100),
        minimumSize: const Size.fromHeight(100), // NEW
      ),
      onPressed: () {
        print("Handle cancel action");
      },
      child: const Text(
        'Cancel',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}

class CreateEventForm extends StatelessWidget {
  const CreateEventForm({
    Key? key,
    required this.fields,
  }) : super(key: key);

  final List<CreateEventFields> fields;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 2,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final field = fields[index];
        return TextField(
          decoration: InputDecoration(
            label: Text(getLabelTxt(field)),

            /*
             TODO: When coming back add drop down button for type... Might need
             to remove TextField option for Type & just use drop down option as seen in tutorial
             */

          ),
        );
      },
    );
  }

  getLabelTxt(CreateEventFields field) {
    switch (field) {
      case CreateEventFields.name: {
        return "Name";
      }
      case CreateEventFields.type: {
        return "Type";
      }
    }
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
