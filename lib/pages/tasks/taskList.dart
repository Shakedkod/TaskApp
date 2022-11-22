// ignore_for_file: file_names, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:task_app/pages/tasks/task.dart';

Map GetTasks()
{
    return {
        "1": {
            "title": "tasktitle1",
            "type": "normal",
            "description": "taskdescription1",
            "date": "2021-01-01 00:00:00.000",
            "deadline": "2023-08-01 00:00:00.000"
        },
        "2": {
            "title": "tasktitle2",
            "type": "normal",
            "description": "taskdescription2",
            "date": "2021-01-01 00:00:00.000",
            "deadline": "2023-08-02 00:00:00.000"
        },
        "3": {
            "title": "tasktitle3",
            "type": "normal",
            "description": "taskdescription3",
            "date": "2021-01-01 00:00:00.000",
            "deadline": "2023-08-03 00:00:00.000"
        },
        "4": {
            "title": "tasktitle4",
            "type": "normal",
            "description": "taskdescription4",
            "date": "2021-01-01 00:00:00.000",
            "deadline": "2023-08-04 00:00:00.000"
        },
        "5": {
            "title": "tasktitle5",
            "type": "normal",
            "description": "taskdescription5",
            "date": "2021-01-01 00:00:00.000",
            "deadline": "2023-08-05 00:00:00.000"
        },
        "6": {
            "title": "tasktitle6",
            "type": "normal",
            "description": "taskdescription6",
            "date": "2021-01-01 00:00:00.000",
            "deadline": "2023-08-06 00:00:00.000"
        },
        "7": {
            "title": "tasktitle7",
            "type": "normal",
            "description": "taskdescription7",
            "date": "2021-01-01 00:00:00.000",
            "deadline": "2023-08-07 00:00:00.000"
        },
        "8": {
            "title": "tasktitle8",
            "type": "normal",
            "description": "taskdescription8",
            "date": "2021-01-01 00:00:00.000",
            "deadline": "2023-08-08 00:00:00.000"
        },
    };
}

List<Task> GetTaskList()
{
    List<Task> tasks = [];
    Map tasksMap = GetTasks();

    tasksMap.forEach((key, value) 
    {
        if (value["type"] == "normal")
        {
            tasks.add(Task(
                title: value["title"],
                description: value["description"],
                date: DateTime.parse(value["date"]),
                deadline: DateTime.parse(value["deadline"])
            ));
        }
        else if (value["type"] == "school")
        {
            tasks.add(SchoolTask(
                subject: value["subject"],
                teacher: value["teacher"],
                inPersonHandIn: value["inPersonHandIn"],
                title: value["title"],
                description: value["description"],
                date: DateTime.parse(value["date"]),
                deadline: DateTime.parse(value["deadline"])
            ));
        }
        else
        {
            tasks.add(Task(
                title: value["title"],
                description: value["description"],
                date: DateTime.parse(value["date"]),
                deadline: DateTime.parse(value["deadline"])
            ));
        }
    });

    return tasks;
}

//------------------------------------------------------------\\
// <------------------- TaskList Widget ---------------------->
//------------------------------------------------------------//

class TaskList extends StatefulWidget 
{
    int height = 0;
    int width = 0;
    TaskList({Key? key}) : super(key: key);

    @override
    State<TaskList> createState() => _TaskListState();

    int getHeight()
    {
        return height;
    }

    int getWidth()
    {
        return width;
    }
}

class _TaskListState extends State<TaskList> 
{
    @override
    Widget build(BuildContext context) 
    {
        List<Task> tasks = GetTaskList();

        widget.width = MediaQuery.of(context).size.width.toInt();
        widget.height = (tasks.length * 100).toInt();

        return SingleChildScrollView(
            child: SizedBox(
                width: 500,
                height: 900,
                child: ListView.builder(
                    itemCount: tasks.length,
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
                                        Text(
                                            tasks[index].title,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                decoration: TextDecoration.none
                                            )
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                            tasks[index].description,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey,
                                                decoration: TextDecoration.none
                                            )
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                                Text(
                                                    tasks[index].date.toString(),
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.grey,
                                                        decoration: TextDecoration.none
                                                    )
                                                ),
                                                Text(
                                                    tasks[index].deadline.toString(),
                                                    style: const TextStyle(
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
