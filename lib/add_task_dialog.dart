import 'package:flutter/material.dart';
import 'task_model.dart';

class AddTaskDialog extends StatefulWidget {
  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final TextEditingController _controller = TextEditingController();
  String emoji = "✅";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add New Task", style: TextStyle(fontFamily: 'Times New Roman')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: "Enter task title"),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(hintText: "Emoji (e.g. 🎯)"),
            onChanged: (value) {
              setState(() {
                emoji = value;
              });
            },
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            final newTask = Task(title: _controller.text, icon: emoji);
            Navigator.of(context).pop(newTask);
          },
          child: Text("Add"),
        )
      ],
    );
  }
}