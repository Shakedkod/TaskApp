// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../tasks/taskList.dart';

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
                    TaskList(),
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