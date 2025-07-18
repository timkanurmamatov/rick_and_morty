import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/constants/color_constants.dart';
import 'package:rick_and_morty/home_screen.dart';
import 'package:rick_and_morty/presentation/characters/ui/bloc/character_bloc/character_bloc.dart';

void main() {

  // Примеры сортировки элементов в списке
  // List<String> a = ["a", "d", "c", "ax", "qwe"];
  // List<int> b = [1,4,3452,45623,1,234,654];

  // a.sort((a, b) => b.compareTo(a));
  // b.sort((a, b) => b.compareTo(a));

  // print(b);


  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CharacterBloc(),
        ),
      ],
      child: MaterialApp(
        home: HomeScreen(),
        theme: ThemeData().copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: ColorConstants.primary,
            onSurface: ColorConstants.onSurface,
          ),
          dividerColor: ColorConstants.grey4,
          disabledColor: ColorConstants.grey3,
          textTheme: TextTheme().copyWith(
            labelSmall: TextStyle(
              fontFamily: "Roboto",
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: ColorConstants.onSurface,
            ),
            bodyMedium: TextStyle(
              fontFamily: "Roboto",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: ColorConstants.onSurface,
            ),
            bodySmall: TextStyle(
              fontFamily: "Roboto",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: ColorConstants.onSurface,
            ),
            titleMedium: TextStyle(
              fontFamily: "Roboto",
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ColorConstants.onSurface,
            ),
            headlineLarge: TextStyle(
              fontFamily: "Roboto",
              fontSize: 34,
              fontWeight: FontWeight.w400,
              color: ColorConstants.onSurface,
            ),
            headlineSmall: TextStyle(
              fontFamily: "Roboto",
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: ColorConstants.onSurface,
            ),
          ),
        ),
      ),
    ),
  );
}
