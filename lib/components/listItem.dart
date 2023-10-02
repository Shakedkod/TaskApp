// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

Widget _createListTile(String title, String? subtitle, Function? onTap)
{
    if (subtitle != null && onTap != null) return ListTile(
        title: Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.chakraPetch(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
        ),
        subtitle: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.chakraPetch(
                fontSize: 15,
                color: Colors.white,
            ),
        ),
        onTap: () => onTap(),
    );
    else if (subtitle != null) return ListTile(
        title: Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.chakraPetch(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
            ),
        ),
        subtitle: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.chakraPetch(
                fontSize: 15,
                color: Colors.white,
            ),
        ),
    );
    else if (onTap != null) return ListTile(
        title: Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.chakraPetch(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
            ),
        ),
        onTap: () => onTap(),
    );

    return ListTile(
        title: Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.chakraPetch(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
            ),
        )
    );
}

Widget buildListItem(BuildContext context, DocumentSnapshot doc) 
{
    if (doc.exists) 
    {
        final data = doc.data() as Map<String, dynamic>;

        if (data.containsKey("type")) 
        {
            if (data["type"] == "test")
            {
                String subject = data["subject"] ?? "Unknown Subject";
                if (subject != "Unknown Subject") subject = "מבחן ב$subject";

                DateTime dateTime = data["startTime"].toDate();
                String formattedDate = DateFormat('dd-MM-yy hh:mm').format(dateTime);

                return _createListTile(subject, formattedDate, () => context.vRouter.to("/test/${doc.id}"));
            } 
            else if (data["type"] == "project")
            {
                String subject = data["subject"] ?? "Unknown Subject";
                if (subject != "Unknown Subject") subject = "עבודה ב$subject";

                DateTime dateTime = data["date"].toDate();
                String formattedDate = DateFormat('dd-MM-yy').format(dateTime);

                return _createListTile(subject, formattedDate, () => context.vRouter.to("/project/${doc.id}"));
            }
            else
            {
                return ListTile(
                    title: Text(
                        "ERROR: Missing data",
                        style: GoogleFonts.chakraPetch(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                        ),
                    ),
                );
            }
        }
        else
        {
            return ListTile(
                title: Text(
                    "ERROR: Missing type",
                    style: GoogleFonts.chakraPetch(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                    ),
                ),
            );
        }
    }

    return ListTile(
        title: Text(
            "ERROR: Doc doesn't exist",
            style: GoogleFonts.chakraPetch(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
            ),
        ),
    );
}