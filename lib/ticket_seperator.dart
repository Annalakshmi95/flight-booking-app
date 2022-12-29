

import 'package:flutter/material.dart';


class TicketSeparator extends StatelessWidget {
  final double height;
  final Color color;
  const TicketSeparator({Key? key,this.height = 1,this.color = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      final boxwidth = constraints.constrainWidth();
      final dashwidth = 4.0;
      final dashHeight = height;
      final dashcount = (boxwidth /(2*dashwidth)).floor();
      return Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:List.generate(
          dashcount, 
          (index) => SizedBox(
          height: dashHeight,
          width: dashwidth,
          child: DecoratedBox(
            decoration: BoxDecoration(color: color),)
        )),
        );
      
    });
    
  }
}