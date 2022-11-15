// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:task_app/pages/home/home.dart';
import 'package:vrouter/vrouter.dart';

void main() async
{ 
    WidgetsFlutterBinding.ensureInitialized();
    
    if (Platform.isWindows)
    {
        await Window.initialize();
    }

    runApp(const TaskAppMain());

    if (Platform.isWindows)
    {
        const Size winSize = Size(500, 1040);

        doWhenWindowReady(() 
            {
                appWindow
                    ..size = winSize
                    ..title = "Task App"
                    ..minSize = winSize
                    ..maxSize = winSize
                    ..alignment = Alignment.center
                    ..show();
            }
        );
    }
}

class TaskAppMain extends StatefulWidget 
{
    const TaskAppMain({Key? key}) : super(key: key);

    @override
    State<TaskAppMain> createState() => _TaskAppMainState();
}

class _TaskAppMainState extends State<TaskAppMain> 
{
    WindowEffect effect = WindowEffect.transparent;
    
    @override
    void initState() 
    {
        super.initState();
        Window.setEffect(
            effect: effect,
            color: const Color.fromARGB(74, 25, 0, 255),
            dark: true
        );
    }

    @override
    Widget build(BuildContext context)
    {
        return VRouter(
            debugShowCheckedModeBanner: false,
            transitionDuration: const Duration(seconds: 0),
            mode: VRouterMode.history,
            title: "ShakedKod's Task App",
            initialUrl: "/",
            routes: [
                VRouteRedirector(path: "/", redirectTo: "/home"),
                VWidget(
                    path: "/home",
                    widget: const Home(),
                    name: "home"
                )
            ],
        );
    }
}