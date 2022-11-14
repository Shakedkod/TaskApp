import 'dart:io';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:task_app/pages/home/homeD.dart';
import 'package:task_app/pages/home/homeM.dart';

class Home extends StatefulWidget 
{
    const Home({Key? key}) : super(key: key);

    @override
    State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> 
{
    @override
    Widget build(BuildContext context) 
    {
        if (Platform.isWindows)
        {
            return const HomeD();
        }

        return ScreenTypeLayout(
            mobile: const HomeM(),
            desktop: const HomeD()
        );
    }
}

