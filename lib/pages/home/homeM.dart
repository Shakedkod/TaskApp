// ignore_for_file: file_names

import 'package:flutter/material.dart';
//import 'package:vrouter/vrouter.dart';

class HomeM extends StatefulWidget 
{
    const HomeM({Key? key}) : super(key: key);

    @override
    State<HomeM> createState() => _HomeMState();
}

class _HomeMState extends State<HomeM> 
{
    @override
    Widget build(BuildContext context)
    {
        return Container(
            color: const Color.fromARGB(74, 25, 0, 255),
            child: Column(
                children: [
                    const SizedBox(height: 60),
                    Row(
                        children: [
                            const Text(
                                "Tasks",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 146, 211, 255),
                                    fontStyle: FontStyle.normal,
                                    debugLabel: "ShakedKod's Tasks",
                                    decoration: TextDecoration.none
                                )
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.search),
                                            color: const Color.fromARGB(255, 146, 211, 255),
                                            iconSize: 30
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.add),
                                            color: const Color.fromARGB(255, 146, 211, 255),
                                            iconSize: 30
                                        )
                                    ]
                                )
                            )
                        ]
                    ),
                    const TaskList(),
                    const SizedBox(height: 15),
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
                    )
                ]
            )
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
                height: 625,
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
