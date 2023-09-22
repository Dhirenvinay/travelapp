import 'package:epviassignment/ddatabase.dart';
import 'package:epviassignment/item_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class SuggestionList extends StatefulWidget {
   SuggestionList(this.title, this.hotel, {Key? key}) : super(key: key);
String? title;
   List<Hotel> hotel;
  @override
  State<SuggestionList> createState() => _SuggestionListState();
}

class _SuggestionListState extends State<SuggestionList> {
  bool startAnimation = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
   return Column(
     children: [
       Container(
         height: 150.0,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10.0),

         ),
    child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: widget.hotel.length,
    itemBuilder: (context, index) => item(index),
    ),
       ),
     ],
   );
  }
  Widget item(int index)
  { return AnimatedContainer(
    curve: Curves.easeInOut,
      transform: Matrix4.translationValues(startAnimation ? 0: MediaQuery.of(context).size.width, 0, 0),
      duration: Duration(microseconds: 300 + (index *100 ) ),
      child: ItemCard(widget.hotel[index], () {}),

  );

  }
}
