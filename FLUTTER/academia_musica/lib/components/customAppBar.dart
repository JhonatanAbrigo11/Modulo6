import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
AppBar CustomAppBar(String title, String subtitle, [VoidCallback? onPressed]) {
  return AppBar(
    elevation: 20,
    shadowColor: const Color.fromARGB(137, 126, 86, 2),
    backgroundColor: Colors.lightBlue,
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Text(subtitle, style: TextStyle(fontSize: 14)),
      ],
    ),
    centerTitle: true,
    actions: [IconButton(onPressed: onPressed, icon: Icon(Icons.refresh))],
  );
}
