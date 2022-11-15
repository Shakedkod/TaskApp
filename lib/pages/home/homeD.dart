// ignore_for_file: file_names

import 'package:flutter/material.dart';
//import 'package:vrouter/vrouter.dart';

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
        return Column(
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
                const TaskList(),
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
        );
    }
}

class TaskList extends StatefulWidget 
{
    const TaskList({Key? key}) : super(key: key);

    @override
    State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> 
{
    @override
    Widget build(BuildContext context) 
    {
        return SingleChildScrollView(
            child: SizedBox(
                width: 500,
                height: 920,
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) 
                    {
                        return TextButton(
                            child: Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(186, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                        BoxShadow(
                                            color: Color.fromARGB(31, 0, 0, 0),
                                            blurRadius: 10,
                                            spreadRadius: 5,
                                            offset: Offset(0, 5)
                                        )
                                    ]
                                ),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        const Text(
                                            "Task Title",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                decoration: TextDecoration.none
                                            )
                                        ),
                                        const SizedBox(height: 10),
                                        const Text(
                                            "Task Description",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey,
                                                decoration: TextDecoration.none
                                            )
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: const [
                                                Text(
                                                    "Task Date",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.grey,
                                                        decoration: TextDecoration.none
                                                    )
                                                ),
                                                Text(
                                                    "Task Time",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.grey,
                                                        decoration: TextDecoration.none
                                                    )
                                                )
                                            ]
                                        )
                                    ]
                                )
                            ),
                            onPressed: () => print("button ${index + 1} has been pressed")
                        );
                    }
                ),
            ),
        );
    }
}
