import 'package:flutter/material.dart';

import 'EditQuestionWidget.dart';
import 'model.dart';

class EditFormWidget extends StatefulWidget {
  EditFormWidget({Key key, this.title, this.questions}) : super(key: key);
  final String title;
  final List<Question> questions;

  @override
  _EditFormWidgetState createState() => _EditFormWidgetState();
}

class _EditFormWidgetState extends State<EditFormWidget> {
  final _titleController = TextEditingController();
  List<Widget> _questionWidgets;

  @override
  void initState() {
    super.initState();
    _titleController.text = "Title: ${widget.title}";
    _questionWidgets = List.empty(growable: true);
    if (widget.questions.isEmpty) {
      _questionWidgets.add(EditQuestionWidget(question: Question.empty()));
    } else {
      widget.questions.forEach((q) {
        _questionWidgets.add(EditQuestionWidget(question: q));
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _addQuestion() {
    setState(() {
      _questionWidgets.add(EditQuestionWidget(question: Question.empty()));
    });
  }

  @override
  Widget build(BuildContext context) {
    // assert(_questionWidgets != null, "_questionWidgets is null");
    return Scaffold(
      appBar: AppBar(
          title: Container(
        width: 400,
        height: 800,
        child: TextField(
          controller: _titleController,
          decoration:
              InputDecoration(border: InputBorder.none, hintText: 'Form name'),
        ),
      )),
      body: ListView.builder(

          // padding: const EdgeInsets.all(2),
          itemCount: _questionWidgets.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                // decoration: BoxDecoration(color: Colors.red),
                child: _questionWidgets[index]);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _addQuestion,
        tooltip: 'Add Question',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
