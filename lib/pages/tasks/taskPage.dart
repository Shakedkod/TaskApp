// ignore_for_file: file_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:task_app/pages/tasks/task.dart';

class TaskPage extends StatefulWidget 
{
    Task task;
    TaskPage({required this.task, Key? key}) : super(key: key);

    @override
    State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> 
{
    @override
    Widget build(BuildContext context)
    {
        return Column(
            children: [
                Text(
                    widget.task.title,
                    style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 146, 211, 255),
                        fontStyle: FontStyle.normal,
                        debugLabel: "ShakedKod's Tasks",
                        decoration: TextDecoration.none
                    )
                ),
                const SizedBox(height: 15),
                Text(
                    widget.task.description,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 114, 190),
                        fontStyle: FontStyle.normal,
                        debugLabel: "built by ShakedKod",
                        decoration: TextDecoration.none
                    )
                ),
                const SizedBox(height: 15),
                Text(
                    widget.task.date.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 114, 190),
                        fontStyle: FontStyle.normal,
                        debugLabel: "built by ShakedKod",
                        decoration: TextDecoration.none
                    )
                ),
                const SizedBox(height: 15),
                Text(
                    widget.task.deadline.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 114, 190),
                        fontStyle: FontStyle.normal,
                        debugLabel: "built by ShakedKod",
                        decoration: TextDecoration.none
                    )
                ),
                const SizedBox(height: 15),
                Text(
                    widget.task.isDone.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 114, 190),
                        fontStyle: FontStyle.normal,
                        debugLabel: "built by ShakedKod",
                        decoration: TextDecoration.none
                    )
                )
            ]
        );
    }
}