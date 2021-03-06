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

class CreateEventForm extends StatefulWidget {
  final List<CreateEventFields> fields;
  final List<String> dropDownFields = const ["Track by number", "Track by time"];
  const CreateEventForm({Key? key, required this.fields}) : super(key: key);

  @override
  State<CreateEventForm> createState() => _CreateEventForm();
}

class _CreateEventForm extends State<CreateEventForm> {

  //TODO: What is the best way to default this value??? I would assume there is state management I can use and this is kept in the CreateEventForm class?
  String? selectedItem = null;

  @override
  Widget build(BuildContext context) {

    //TODO: Wrap inside of form class... Form widget might actually be placed directly in CreateEvent widget....
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 2,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final field = widget.fields[index];
        switch (field) {

          case CreateEventFields.name: {
            return TextField(
              decoration: InputDecoration(
                label: Text(getLabelTxt(field)),
                contentPadding: EdgeInsets.fromLTRB(12, 8, 0, 8)
              ),
            );
          }

          case CreateEventFields.type: {
            return DropdownButtonFormField<String>(
                onChanged: (item) => setState(() => selectedItem = item),
                value: selectedItem,
                items: widget.dropDownFields
                    .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
            )).toList(),
              alignment: Alignment(0, 0),

            );
                // onChanged: )
          }
        }
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
    var month = DateTime
        .now()
        .month;
    var day = DateTime
        .now()
        .day;
    return " $month/$day ";
  }
