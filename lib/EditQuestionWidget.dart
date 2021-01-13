import 'package:flutter/material.dart';

import 'CheckboxWidget.dart';
import 'RangeWidget.dart';
import 'model.dart';

class EditQuestionWidget extends StatefulWidget {
  EditQuestionWidget({Key key, this.question}) : super(key: key);
  final Question question;

  @override
  _EditQuestionWidgetState createState() => _EditQuestionWidgetState();
}

class _EditQuestionWidgetState extends State<EditQuestionWidget> {
  final _textController = TextEditingController();
  String _questionType = Kinds.Text;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [questionTextWidget(), questionTypeWidget()],
          ),
          Align(alignment: Alignment.topLeft, child: answerTypeWidget())
        ],
      ),
    );
  }

  Widget answerTypeWidget() {
    if (_questionType == Kinds.Text) {
      return Align(
          alignment: Alignment.topLeft, child: Text("(answer text goes here)"));
    } else if (_questionType == Kinds.Paragraph) {
      return Align(
          alignment: Alignment.topLeft, child: Text("(answer text goes here)"));
    } else if (_questionType == Kinds.Range) {
      return RangeWidget();
    } else if (_questionType == Kinds.MultipleChoice) {
      return CheckboxWidget();
    } else if (_questionType == Kinds.Checkbox) {
      return CheckboxWidget();
    } else {
      return Text("Choice");
    }
  }

  Container questionTextWidget() {
    return Container(
        decoration: BoxDecoration(color: Colors.grey[900]),
        // margin: EdgeInsets.all(8),
        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
        constraints: BoxConstraints(
          maxWidth: 200,
          maxHeight: 300,
        ),
        child: TextField(
          controller: _textController,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
              border: InputBorder.none, hintText: 'Question Text'),
        ));
  }

  Padding questionTypeWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
          value: _questionType,
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String newValue) {
            setState(() {
              _questionType = newValue;
            });
          },
          items: Kinds.list().map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList()),
    );
  }
}
