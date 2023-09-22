import 'package:epviassignment/home.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for [SliverAppBar].

void main() {
  runApp(const StretchableSliverAppBar());
}

class StretchableSliverAppBar extends StatefulWidget {
  const StretchableSliverAppBar({super.key});

  @override
  State<StretchableSliverAppBar> createState() =>
      _StretchableSliverAppBarState();
}

class _StretchableSliverAppBarState extends State<StretchableSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen()

    );
  }
}