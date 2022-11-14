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
    Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [
                    0.2,
                    0.5,
                    0.7
                ],
                colors: [
                    Color.fromARGB(255, 16, 39, 168),
                    Color.fromARGB(255, 0, 81, 233),
                    Color.fromARGB(255, 16, 39, 168)
                ]
            )
        ),
        child: const Center(
            child: Text("hi")
        )
    );
}
