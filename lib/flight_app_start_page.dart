
import 'package:flutter/material.dart';

import 'package:laxmiflight_booking_app/flight_ticket_page.dart';


class FlightAppStartPage extends StatelessWidget {
  const FlightAppStartPage({Key? key}) : super(key: key);

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 16,
              top: 84,
              right: 0,
              child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Easily book",style: TextStyle(
                  fontSize: 32
                ),),
                Text("flight",style: TextStyle(
                  fontSize: 32),
         ),
         SizedBox(height: 16,),
                Text("we can easily help you find the",style: TextStyle(
                  fontSize: 14
                 )),
            Text("best flight experience",style: TextStyle(
                  fontSize: 14)),
          ],
          )),
        Positioned(child: RotatedBox(quarterTurns: 1,
        child: Image.network(
          "https://www.pngall.com/wp-content/uploads/5/Flying-Aeroplane-PNG-Download-Image.png")),
        left:48,
        right:-160,
        top:160,
        bottom:120,
        ), 
        Positioned(
          left: 16,
          right: 16,
          bottom: 32,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("press right",),
          ElevatedButton(
            onPressed: (){
            Navigator.push(
              context,MaterialPageRoute(builder: (context)=>FlightTicketPage(),
            ));
          }, 
          child: 
          Text(
            "clickme",
          ),
          )
                ],
          
        ),),
        ],
        ),
        ),
    );   
     
    
  }
}