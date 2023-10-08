// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vrouter/vrouter.dart';
import 'package:intl/intl.dart';

import 'package:task_app/gredient.dart';

class TestDetails extends StatefulWidget 
{
    const TestDetails({super.key});

    @override
    State<TestDetails> createState() => _TestDetailsState();
}

class _TestDetailsState extends State<TestDetails> 
{
    @override
    Widget build(BuildContext context) 
    {
        final testId = context.vRouter.pathParameters['id'];

        return Scaffold(
            backgroundColor: const Color.fromARGB(255, 0, 7, 41),
            body: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                    children: [
                        const SizedBox(height: 20),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                IconButton(
                                    onPressed: () => context.vRouter.to("/"),
                                    icon: const Icon(Icons.arrow_back_ios),
                                    padding: const EdgeInsets.all(20),
                                    color: const Color(0xFFFFC400)
                                ),
                                GradientText(
                                    "Test Details",
                                    style: GoogleFonts.philosopher(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    gradient: const LinearGradient(
                                        colors: [
                                            Color(0xFFFFC400),
                                            Color(0xFFB37400)
                                        ],
                                        begin: Alignment.centerRight,
                                        end: Alignment.centerLeft,
                                    ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.arrow_forward_ios),
                                    padding: const EdgeInsets.all(20),
                                    color: Colors.transparent,
                                ),
                            ],
                        ),
                        const SizedBox(height: 50),

                        StreamBuilder(
                            stream: FirebaseFirestore.instance.collection('School')
                                .doc(testId).snapshots(),
                            builder: (context, snapshot)
                            {
                                if (snapshot.connectionState == ConnectionState.waiting)
                                    return const CircularProgressIndicator();
                                
                                if (snapshot.hasError)
                                    return Text('Error: ${snapshot.error}');

                                Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;

                                return Column(
                                    children: [
                                        Text(
                                            data["subject"],
                                            style: GoogleFonts.chakraPetch(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                            ),
                                        ),
                                        const SizedBox(height: 20),
                                        //Text(
                                        //    data["teacher"],
                                        //    style: GoogleFonts.chakraPetch(
                                        //        fontSize: 20,
                                        //        fontWeight: FontWeight.bold,
                                        //        color: Colors.white,
                                        //    ),
                                        //),
                                        //const SizedBox(height: 20),
                                        Text(
                                            DateFormat('dd-MM-yy hh:mm').format(data["date"].toDate()),
                                            style: GoogleFonts.chakraPetch(
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.white,
                                            ),
                                        ),
                                        const SizedBox(height: 20),
                                        //Text(
                                        //    data["description"],
                                        //    style: GoogleFonts.chakraPetch(
                                        //        fontSize: 20,
                                        //        fontWeight: FontWeight.bold,
                                        //        color: Colors.white,
                                        //    ),
                                        //),
                                    ],
                                );
                            }
                        )
                    ]
                )
            )
        );
    }
}