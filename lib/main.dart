// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';
import "package:awesome_notifications/awesome_notifications.dart";
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';

import 'firebase_options.dart';
import 'pages/Home.dart';
import 'pages/TestDetails.dart';
import 'package:task_app/pages/addTest.dart';
import 'pages/ProjectDetails.dart';
import 'package:task_app/addProject.dart';

void main() async
{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
    );
    AwesomeNotifications().initialize(
        null,
        [
            NotificationChannel(
                channelKey: 'basic_channel',
                channelName: 'Basic notifications',
                channelDescription: 'Notification channel for basic tests',
                defaultColor: const Color.fromARGB(255, 80, 176, 221),
                ledColor: Colors.white
            ),
        ],
        debug: true,
    );

    runApp(const TaskApp());
}

class TaskApp extends StatefulWidget 
{
    const TaskApp({super.key});

    @override
    State<TaskApp> createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> 
{
    @override
    void initState() 
    {
        super.initState();

        AwesomeNotifications().isNotificationAllowed().then((isAllowed) 
        {
            if (!isAllowed) 
            {
                AwesomeNotifications().requestPermissionToSendNotifications();
            }
        });
    }

    @override
    Widget build(BuildContext context) 
    {
        return StreamBuilder(
            stream: FirebaseFirestore.instance.collection('School')
                .where("date", isGreaterThanOrEqualTo: DateTime.now())
                .orderBy("date").snapshots(),
            builder: (context, snapshot)
            {
                if (snapshot.connectionState == ConnectionState.waiting)
                    return const CircularProgressIndicator();
                
                if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');

                for (var doc in snapshot.data!.docs) 
                {
                    DateTime docDate = doc['date'].toDate();
                    Duration difference = docDate.difference(DateTime.now());

                    String displayDate = DateFormat('dd.MM.yy').format(docDate);

                    if (difference.inDays <= 2) 
                    {
                        if (doc["type"] == "test") 
                        {
                            AwesomeNotifications().createNotification(
                                content: NotificationContent(
                                    id: 0,
                                    channelKey: 'basic_channel',
                                    title: 'מבחן מתקרב',
                                    body: "יש מבחן ב${doc["subject"]} בתאריך $displayDate",
                                    notificationLayout: NotificationLayout.Default,
                                )
                            );
                        }
                        else if (doc["type"] == "project")
                        {
                            AwesomeNotifications().createNotification(
                                content: NotificationContent(
                                    id: 0,
                                    channelKey: 'basic_channel',
                                    title: 'עבודה מתקרבת',
                                    body: 'יש עבודה ב${doc["subject"]} בתאריך $displayDate',
                                    notificationLayout: NotificationLayout.Default,
                                )
                            );
                        }
                        
                    }
                }

                return VRouter(
                    debugShowCheckedModeBanner: false,
                    transitionDuration: const Duration(milliseconds: 0),
                    routes: [
                        VWidget(
                            path: '/',
                            widget: const Home(),
                        ),
                        VWidget(
                            path: '/add-test',
                            widget: const AddTest(),
                        ),
                        VWidget(
                            path: '/add-project',
                            widget: const AddProject(),
                        ),
                        VWidget(
                            path: '/test/:id',
                            widget: const TestDetails(),
                        ),
                        VWidget(
                            path: "/project/:id",
                            widget: const ProjectDetails(),
                        ),
                    ]
                );
            }
        );
    }
}