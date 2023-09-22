import 'package:flutter/material.dart';
Widget buildExtendedFAB() => AnimatedContainer(
  duration: const Duration(milliseconds: 200),
  curve: Curves.linear,
  width: 250,
  height: 50,
  child: FloatingActionButton.extended(
    backgroundColor: Colors.black,
    onPressed: () {},
    icon: const Icon(Icons.airplanemode_active_outlined,color: Colors.white,),
    label: Row(
      children: [
        const Center(
          child: Text(
            "Search Flight",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
        const  SizedBox(width: 5,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.green,
          ),

          child: const Text("On Sale",style: TextStyle(color: Colors.white),),
        ),
      ],
    ),
  ),
);