// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:task_app/gredient.dart';
import 'package:task_app/components/listItem.dart';

class Home extends StatefulWidget 
{
    const Home({super.key});

    @override
    State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> 
{
    triggerNotification() async
    {
        await AwesomeNotifications().createNotification(
            content: NotificationContent(
                id: 10,
                channelKey: 'basic_channel',
                title: 'Simple Notification',
                body: 'Simple body',
                notificationLayout: NotificationLayout.Default,
            ),
        );
    }

    @override
    Widget build(BuildContext context) 
    { 
        return Scaffold(
            backgroundColor: const Color.fromARGB(255, 0, 7, 41),
            body: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
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
                                        Color(0xFF91CDFF),
                                        Color(0xFF1594FC)
                                    ],
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                ),
                            ),
                    
                            const SizedBox(height: 50),

                            StreamBuilder(
                                stream: FirebaseFirestore.instance.collection('School').orderBy("date").snapshots(),
                                builder: (context, snapshot)
                                {
                                    print("snapshot2");

                                    if (!snapshot.hasData) return const Text("Loading...");

                                    return Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: ListView.builder(
                                            itemCount: snapshot.data!.docs.length,
                                            itemExtent: 80,
                                            physics: const ClampingScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index)
                                            {
                                                return buildListItem(context, snapshot.data!.docs[index]);
                                            },
                                        ),
                                    );
                                }
                            ),
                    
                            const SizedBox(height: 50),
                    
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                    SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.3,
                                        child: ElevatedButton(
                                            onPressed: () => context.vRouter.to('/add-test'),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: const Color.fromARGB(255, 0, 140, 255),
                                                padding: const EdgeInsets.symmetric(vertical: 20),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(35),
                                                ),
                                            ),
                                            child: Text(
                                                "Add Test",
                                                style: GoogleFonts.chakraPetch(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.normal,
                                                ),
                                            ),
                                        ),
                                    ),
                                    SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.3,
                                        child: ElevatedButton(
                                            onPressed: () => context.vRouter.to('/add-project'),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: const Color.fromARGB(255, 0, 140, 255),
                                                padding: const EdgeInsets.symmetric(vertical: 20),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(35),
                                                ),
                                            ),
                                            child: Text(
                                                "Add Project",
                                                style: GoogleFonts.chakraPetch(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.normal,
                                                ),
                                            ),
                                        ),
                                    ),
                                ],
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}