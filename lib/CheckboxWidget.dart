import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  var _from = 1;
  var _to = 7;

  final _fromTextController = TextEditingController();
  final _toTextController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _fromTextController.dispose();
    _toTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [fromChoice(), Text("to"), toChoice()]),
        Row(children: [Text("$_from : "), fromText()]),
        Row(children: [Text("$_to : "), toText()])
      ],
    );
  }

  Widget fromText() {
    return TextField(
      controller: _fromTextController,
      maxLines: null,
      decoration: InputDecoration(
          border: InputBorder.none, hintText: 'Label (optional)'),
    );
  }

  Widget toText() {
    return TextField(
      controller: _toTextController,
      maxLines: null,
      decoration: InputDecoration(
          border: InputBorder.none, hintText: 'Label (optional)'),
    );
  }

  Widget fromChoice() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<int>(
          value: _from,
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (int newValue) {
            setState(() {
              _from = newValue;
            });
          },
          items: [0, 1].map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text("$value"),
            );
          }).toList()),
    );
  }

  Widget toChoice() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<int>(
          value: _to,
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (int newValue) {
            setState(() => _to = newValue);
          },
          items: [2, 3, 4, 5, 6, 7, 8, 9, 10]
              .map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text("$value"),
            );
          }).toList()),
    );
  }
}
