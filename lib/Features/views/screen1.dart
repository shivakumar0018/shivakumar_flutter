import 'package:flutter/material.dart';

class Createsession extends StatefulWidget {
  const Createsession({super.key});

  @override
  State<Createsession> createState() => _CreatesessionState();
}

class _CreatesessionState extends State<Createsession> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("shiva"),),
      ),
    );
  }
}