// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:date_field/date_field.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:task_app/gredient.dart';

class AddTest extends StatefulWidget 
{
    const AddTest({super.key});

    @override
    State<AddTest> createState() => _AddTestState();
}

class _AddTestState extends State<AddTest> 
{
    final GlobalKey<FormState> _formKey = GlobalKey();
    TextEditingController? _subjectController;
    DateTime? _dateAndTime;
    DateTime? _endTime;

    Map<String, Object> convertDynamicMap(Map<String, dynamic> map) 
    {
        Map<String, Object> result = {};
        map.forEach((key, value) {
            result[key] = value;
        });
        return result;
    }

    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            backgroundColor: const Color.fromARGB(255, 0, 7, 41),
            body: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
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
                                    "Add Test",
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
                        Form(
                            key: _formKey,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                textDirection: TextDirection.ltr,
                                children: [
                                    TextFormField(
                                        controller: _subjectController,
                                        decoration: InputDecoration(
                                            labelText: "Test Subject",
                                            labelStyle: GoogleFonts.chakraPetch(
                                                color: Color(0xFFD8A120),
                                            ),
                                            fillColor: Colors.white,
                                            focusedBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFFD8A120),
                                                    width: 2,
                                                ),
                                            ),
                                            enabledBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFFD8A120),
                                                    width: 2,
                                                ),
                                            )
                                        ),
                                        style: GoogleFonts.chakraPetch(color: Colors.white),
                                        validator: (String? value) {
                                            if (value == null || value.isEmpty) {
                                                return "Please enter the test subject";
                                            }
                                            return null;
                                        }
                                    ),

                                    const SizedBox(height: 50),

                                    DateTimeFormField(
                                        decoration: InputDecoration(
                                            labelText: "Test Date & Starting Time",
                                            labelStyle: GoogleFonts.chakraPetch(
                                                color: Color(0xFFD8A120),
                                            ),
                                            fillColor: Colors.white,
                                            focusedBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFFD8A120),
                                                    width: 2,
                                                ),
                                            ),
                                            enabledBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFFD8A120),
                                                    width: 2,
                                                ),
                                            )
                                        ),
                                        dateTextStyle: GoogleFonts.chakraPetch(color: Colors.white),
                                        mode: DateTimeFieldPickerMode.dateAndTime,
                                        autovalidateMode: AutovalidateMode.always,
                                        validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                                        onDateSelected: (DateTime value) {
                                            _dateAndTime = value;
                                        },
                                    ),

                                    const SizedBox(height: 20),

                                    DateTimeFormField(
                                        decoration: InputDecoration(
                                            labelText: "Test Ending Time",
                                            labelStyle: GoogleFonts.chakraPetch(
                                                color: Color(0xFFD8A120),
                                            ),
                                            fillColor: Colors.white,
                                            focusedBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFFD8A120),
                                                    width: 2,
                                                ),
                                            ),
                                            enabledBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFFD8A120),
                                                    width: 2,
                                                ),
                                            )
                                        ),
                                        dateTextStyle: GoogleFonts.chakraPetch(color: Colors.white),
                                        mode: DateTimeFieldPickerMode.time,
                                        autovalidateMode: AutovalidateMode.always,
                                        validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                                        onDateSelected: (DateTime value) {
                                            _endTime = value;
                                        },
                                    ),

                                    const SizedBox(height: 50),

                                    ElevatedButton(
                                        onPressed: () async {
                                            if (_formKey.currentState!.validate()) {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                    const SnackBar(content: Text('Processing Data')),
                                                );

                                                // save the test to the database
                                                final docRef = FirebaseFirestore.instance.collection('School').doc('tests');
                                                Map<String, dynamic> data = {};
                                                await docRef.get().then(
                                                    (DocumentSnapshot doc) {
                                                        data = doc.data() as Map<String, dynamic>;
                                                        print(data);
                                                    },
                                                    onError: (e) => print("Error getting document: $e"),
                                                );
                                                print(data);

                                                // generate the id
                                                String id = data.length.toString();


                                                //convert the [DateTime] to [Timestamp]
                                                Timestamp dateTimeStamp = Timestamp.fromDate(_dateAndTime!);
                                                Timestamp endTimeStamp = Timestamp.fromDate(_endTime!);

                                                data[id] = {
                                                    "subject": _subjectController!.text,
                                                    "time": dateTimeStamp,
                                                    "endTime": endTimeStamp,
                                                };

                                                FirebaseFirestore.instance.collection('School').doc('tests').set(data).onError((e, _) => print("Error writing document: $e"));
                                            }
                                        },
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
                                    )
                                ]
                            ),
                        ),
                    ],
                )
            )
        );
    }
}