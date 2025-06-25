import 'package:flutter/material.dart';
import 'package:rick_and_morty/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomeScreen(),
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF22A2BD),
        ),
      ),
    ),
  );
}
