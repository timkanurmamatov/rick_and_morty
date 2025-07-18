import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/constants/color_constants.dart';
import 'package:rick_and_morty/home_screen.dart';
import 'package:rick_and_morty/presentation/characters/ui/bloc/character_bloc/character_bloc.dart';
import 'package:rick_and_morty/presentation/characters/ui/bloc/filter_cubit/cubit/filter_cubit.dart';
import 'package:rick_and_morty/theme_constants.dart';

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
        BlocProvider(
          create: (context) => FilterCubit(),
        ),
      ],
      child: MaterialApp(
        home: HomeScreen(),
        theme: ThemeConstants.lightTheme,
      ),
    ),
  );
}
