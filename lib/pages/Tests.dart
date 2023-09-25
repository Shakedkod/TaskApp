import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vrouter/vrouter.dart';

import 'package:task_app/gredient.dart';
import 'package:task_app/types.dart';

class Tests extends StatefulWidget 
{
    const Tests({super.key});

    @override
    State<Tests> createState() => _TestsState();
}

class _TestsState extends State<Tests> 
{
    List<Test> tests = [];

    @override
    Widget build(BuildContext context) 
    {
        CollectionReference schoolCollection = FirebaseFirestore.instance.collection('School');

        return Scaffold(
            backgroundColor: const Color.fromARGB(255, 0, 7, 41),
            body: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                                    "Tests",
                                    style: GoogleFonts.philosopher(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    gradient: const LinearGradient(
                                        colors: [
                                            Color(0xFFFFC400),
                                            Color(0xFFB37400),
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
                        FutureBuilder<DocumentSnapshot>(
                            future: schoolCollection.doc('tests').get(),
                            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) 
                            {
                                if (snapshot.hasError) 
                                {
                                    return Text(
                                        "The ERROR is: ${snapshot.error}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                        ),
                                    );
                                }

                                if (snapshot.connectionState == ConnectionState.done) 
                                {
                                    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                                    return ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: data.length,
                                        itemBuilder: (context, index) 
                                        {
                                            final id = data.keys.elementAt(index);
                                            final dataMap = data.values.elementAt(index);
                                            final subject = dataMap['subject'];
                                            final dateAndTime = dataMap['time'] as Timestamp;

                                            tests.add(Test(id, subject, dateAndTime));

                                            String stringDataAndTime = dateAndTime.toDate().toString();
                                            stringDataAndTime = stringDataAndTime.substring(0, stringDataAndTime.length - 4);

                                            return ListTile(
                                                onTap: () => context.vRouter.to('/test/$id'),
                                                title: Text(
                                                    "מבחן ב$subject",
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white
                                                    ),
                                                ),
                                                subtitle: Text(
                                                    stringDataAndTime,
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.normal,
                                                        color: Colors.white
                                                    ),
                                                ),
                                            );
                                        },
                                    );
                                }

                                return const Text(
                                    "loading",
                                    style: TextStyle(
                                        color: Colors.white,
                                    ),
                                );
                            }
                        ),
                        const SizedBox(height: 50),

                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
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
                    ],
                )
            )
        );
    }
}