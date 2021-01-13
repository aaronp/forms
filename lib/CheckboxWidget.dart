import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  List _choices =
      List.of(<TextEditingController>[TextEditingController()], growable: true);

  @override
  void dispose() {
    super.dispose();
    _choices.forEach((element) {
      element.dispose();
    });
  }

  _updateText(int index, TextEditingController controller) {
    return () {
      if (index == _choices.length - 1) {
        // if (controller.text.isNotEmpty) {
        //
        // }
        print("Updated $index: ${controller.text}");
        setState(() {
          _choices.add(TextEditingController());
        });
      } else if (controller.text.isEmpty) {
        var i = _choices.length - 1;
        while (i > index) {
          print("Checking $i / $index");
          if (_choices[i].text.isEmpty) {
            setState(() {
              _choices.removeAt(i);
            });
          }
          i = i - 1;
        }
      } else {
        var i = index;
        while (i >= 0) {
          if (_choices[i].text.isEmpty) {
            setState(() {
              _choices.removeAt(i);
            });
          }
          i = i - 1;
        }
      }
      return "";
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: ListView.builder(
          itemCount: _choices.length,
          itemBuilder: (BuildContext context, int index) {
            TextEditingController controller = _choices[index];

            final callback = _updateText(index, controller);
            controller.addListener(callback);

            // controller.ad
            // _printLatestValue() {
            //   print("Second text field: ${myController.text}");
            // }

            final txt = TextField(
              controller: controller,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange)),
                  hintText: '(Choice $index)'),
            );

            return txt;
          }),
    );
  }
}
