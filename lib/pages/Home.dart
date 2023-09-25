import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:task_app/gredient.dart';

class Home extends StatefulWidget 
{
    const Home({super.key});

    @override
    State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> 
{
    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            backgroundColor: Color.fromARGB(255, 0, 7, 41),
            body: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        const SizedBox(height: 100),

                        Text(
                            "Welcome to the",
                            style: GoogleFonts.chakraPetch(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                            ),
                        ),
                        GradientText(
                            "Task App",
                            style: GoogleFonts.philosopher(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                            ),
                            gradient: const LinearGradient(
                                colors: [
                                    Color.fromARGB(255, 113, 191, 255),
                                    Color(0xFF0079DB),
                                ],
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                            ),
                        ),

                        SizedBox(height: 250),

                        // 2 buttons
                        // 1 - Tests
                        // 2 - Projects

                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ElevatedButton(
                                onPressed: () => context.vRouter.to('/tests'),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(255, 0, 140, 255),
                                    padding: const EdgeInsets.symmetric(vertical: 20),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(35),
                                    ),
                                ),
                                child: Text(
                                    "Tests",
                                    style: GoogleFonts.chakraPetch(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                    ),
                                ),
                            ),
                        ),

                        const SizedBox(height: 30),

                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ElevatedButton(
                                onPressed: () => context.vRouter.to('/projects'),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(255, 0, 140, 255),
                                    padding: const EdgeInsets.symmetric(vertical: 20),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(35),
                                    ),
                                ),
                                child: Text(
                                    "Projects",
                                    style: GoogleFonts.chakraPetch(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                    ),
                                ),
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}