// ignore_for_file: file_names

import 'package:flutter/material.dart';
import "package:task_app/pages/tasks/taskList.dart";

class HomeD extends StatefulWidget 
{
    const HomeD({Key? key}) : super(key: key);

    @override
    State<HomeD> createState() => _HomeDState();
}

class _HomeDState extends State<HomeD> 
{
    @override
    Widget build(BuildContext context)
    {
        return SingleChildScrollView(
            child: Column(
                children: [
                    const Text(
                        "ShakedKod's Tasks",
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 146, 211, 255),
                            fontStyle: FontStyle.normal,
                            debugLabel: "ShakedKod's Tasks",
                            decoration: TextDecoration.none
                        )
                    ),
                    TaskList(),
                    const SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            TextButton.icon(
                                onPressed: () {}, 
                                icon: const Icon(Icons.add), 
                                label: const Text("Add Task")
                            ),
                            const SizedBox(width: 15),
                            const Text(
                                "©ShakedKod 2022",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 114, 190),
                                    fontStyle: FontStyle.normal,
                                    debugLabel: "built by ShakedKod",
                                    decoration: TextDecoration.none
                                )
                            ),
                            const SizedBox(width: 15),
                            TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.search),
                                label: const Text("Search Task")
                            )
                        ]
                    )
                ]
            )
        );
    }
}