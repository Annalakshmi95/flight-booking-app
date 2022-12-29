
import 'package:flutter/material.dart';
import 'package:laxmiflight_booking_app/flight_ticket_page.dart';
import 'package:laxmiflight_booking_app/qrscanpage.dart';

class FlightBookingApp extends StatelessWidget {
  const FlightBookingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/":(context) => QrScanPage(),
        "/ticket":(context) => FlightTicketPage()
      },
    );
  }
}