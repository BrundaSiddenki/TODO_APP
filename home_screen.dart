import 'package:flutter/material.dart';
import 'done_screen.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> tasks = [
    '🛏️ Make the bed',
    '🥣 Eat breakfast',
    '🧘‍♀️ Meditate for 10 mins',
    '📚 Read 10 pages of a book',
    '📅 Review daily goals',
    '🚶‍♂️ Go for a walk',
    '🧹 Clean a room',
    '🛒 Buy groceries'
  ];

  final List<bool> completed = List.generate(8, (index) => false);

  final TextEditingController _taskController = TextEditingController();

  void _showReminderIfIncomplete() {
    if (completed.contains(false)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Reminder: You still have tasks to complete!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
      completed.removeAt(index);
    });
  }

  void _addTaskDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Add New Task'),
        content: TextField(
          controller: _taskController,
          decoration: InputDecoration(hintText: 'Enter your task'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_taskController.text.isNotEmpty) {
                setState(() {
                  tasks.add(_taskController.text);
                  completed.add(false);
                });
              }
              _taskController.clear();
              Navigator.pop(context);
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  void _checkAllTasksCompleted() {
    if (completed.isNotEmpty && completed.every((c) => c)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => DoneScreen()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(hours: 6), (_) => _showReminderIfIncomplete());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Your Daily Schedule',
          style: TextStyle(
            fontFamily: 'Times New Roman',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notification_important),
            onPressed: _showReminderIfIncomplete,
          )
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              leading: Icon(
                completed[index] ? Icons.check_circle : Icons.radio_button_unchecked,
                color: completed[index] ? Colors.green : Colors.grey,
                size: 28,
              ),
              title: Text(
                tasks[index],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Times New Roman',
                  decoration:
                      completed[index] ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => _removeTask(index),
              ),
              onTap: () {
                setState(() {
                  completed[index] = !completed[index];
                  _checkAllTasksCompleted();
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTaskDialog,
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}