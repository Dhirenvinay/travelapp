import 'package:flutter/material.dart';

Widget buildFAB() => AnimatedContainer(
  duration: Duration(milliseconds: 200),
  curve: Curves.linear,
  width: 50,
  height: 50,
  child: FloatingActionButton.extended(
    backgroundColor: Colors.black,
    onPressed: () {},
    icon: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Icon(Icons.airplanemode_active_outlined,color: Colors.white,),
    ),
    label: SizedBox(),
  ),
);