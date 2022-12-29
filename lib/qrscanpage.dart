




import 'package:barcode/barcode.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:laxmiflight_booking_app/flight_ticket.dart';



class QrScanPage extends StatefulWidget {
  FlightTicket? flightTicket;
  QrScanPage({Key? key,this.flightTicket}) : super(key: key);
@override
  _QrScanPageState  createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  final dm = Barcode.qrCode();
  String svg = "";

  @override
  void  initstate(){
    
    super.initState();
    setState(() {
     svg = dm.toSvg("test");
    });
  }
  @override
  Widget build(BuildContext context) {
    
  
    return Scaffold(
      body: SafeArea(
        child: Column(
        children: [
          Expanded(
            child:Padding(
              padding: const EdgeInsets.all(16.0),
             child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
              onTap: () => Get.back(),
              child:
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
                ),
                child: Center(
                  child: Icon(Icons.arrow_back,),
                ),
                ),
           ),  
              Center(
                child: Text("swipe down to view detail"),
              )
              ],
          ),
            ),
        flex: 3,
        ),
          Expanded(
             flex: 15,
            child:Stack(
            children: [
              Positioned(
                left: 0,
              right: 0,
              top: 0,
              bottom: 0,
                child: Row(children: [
                Expanded(child: Container()),
                Expanded(child: Container(
                  color: Colors.grey[200],
                )
                )
              ],
              ),
              ),
              Positioned(
              left: 0,
              right: 0,
              top: 64,
              bottom: 64,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("my ticket",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,fontSize: 24,
                  ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    height: 180,
                    width: 180,
                    child:Image.network(
                      "https://p.kindpng.com/picc/s/120-1202089_qr-code-transparent-png-qr-code-png-png.png")
                  ),
                  SizedBox(
                    height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,vertical: 24),
                  
                  child:
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${widget.flightTicket?.origin??"Got"}",
                          style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold
                          ),
                          ),
                          Expanded(
                            child: Stack(
                              children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  
                                  children: List.generate(13, (index) => Icon(
                                    Icons.keyboard_arrow_right,
                                  size: 20,color: Colors.indigo,
                                  ),
                                  ),
                              
                                  
                                ),),
                                Positioned(child: Center(
                                  child: RotatedBox(quarterTurns: 1,
                                  child: Icon(Icons.flight_outlined,
                                  color: Colors.indigo,
                                  )
                                  ,),
                                ),
                                ),
                              ],
                            ),
                            ),

                          Text("${widget.flightTicket?.destination??"CGN"}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                          ],

                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("CANADA",
                            style: TextStyle(color: Colors.grey),
                            ),
                            Text("NEWYORK",
                            style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                    ],
                  ),   
                    
                  ),
                  SizedBox(height: 58),
                  Container(
                    height: 48,
                    width: 240,
                    decoration: BoxDecoration(
                      color: Colors.black,borderRadius: BorderRadius.circular(24)
                       ),
                       child:Center(
                        child:
                       Text("Book now >>>>>",style: 
                        TextStyle(fontSize: 16,color: Colors.white),
                 ),
                )
              ),
           ],
          )
          )
          ],
          ),
        ),
        ],
      ),
      ),
    );
  }
}
