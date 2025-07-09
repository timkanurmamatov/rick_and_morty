import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/constants/color_constants.dart';
import 'package:rick_and_morty/home_screen.dart';
import 'package:rick_and_morty/presentation/characters/ui/bloc/character_bloc/character_bloc.dart';

void main() {
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
          ),
        ),
      ),
    ),
  );
}
