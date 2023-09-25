import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'pages/Home.dart';
import 'pages/Projects.dart';
import 'pages/Tests.dart';
import 'pages/TestDetails.dart';
import 'package:task_app/pages/addTest.dart';
import 'pages/ProjectDetails.dart';

void main() async
{
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
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
    Widget build(BuildContext context) 
    {
        return VRouter(
            debugShowCheckedModeBanner: false,
            transitionDuration: const Duration(milliseconds: 0),
            routes: [
                VWidget(
                    path: '/',
                    widget: const Home(),
                ),
                VWidget(
                    path: '/tests',
                    widget: const Tests(),
                ),
                VWidget(
                    path: '/add-test',
                    widget: const AddTest(),
                ),
                VWidget(
                    path: '/test/:id',
                    widget: const TestDetails(),
                ),
                VWidget(
                    path: "/projects",
                    widget: const Projects(),
                ),
                VWidget(
                    path: "/project/:id",
                    widget: const ProjectDetails(),
                ),
            ],
        );
    }
}