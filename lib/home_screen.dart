import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/constants/icon_paths.dart';
import 'package:rick_and_morty/presentation/characters/ui/screens/characters_screen.dart';
import 'package:rick_and_morty/presentation/episodes/ui/episodes_screen.dart';
import 'package:rick_and_morty/presentation/locations/ui/locations_screen.dart';
import 'package:rick_and_morty/presentation/settings/ui/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _currentIndex;

  @override
  void initState() {
    _currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.outline,
        items: _buildTabs(),
        showUnselectedLabels: true,
        onTap: (value) => setState(() => _currentIndex = value),
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    switch (_currentIndex) {
      case 0:
        return CharactersScreen();
      case 1:
        return LocationsScreen();
      case 2:
        return EpisodesScreen();
      case 3:
        return SettingsScreen();
      default:
        return ErrorWidget(Exception("Неверный индекс на Главной Странице"));
    }
  }

  List<BottomNavigationBarItem> _buildTabs() {
    return [
      BottomNavigationBarItem(
        label: "Персонажи",
        icon: SvgPicture.asset(
          IconPaths.characters,
          colorFilter: getFilter(0),
        ),
      ),
      BottomNavigationBarItem(
        label: "Локации",
        icon: SvgPicture.asset(
          IconPaths.locations,
          colorFilter: getFilter(1),
        ),
      ),
      BottomNavigationBarItem(
        label: "Эпизоды",
        icon: SvgPicture.asset(
          IconPaths.episodes,
          colorFilter: getFilter(2),
        ),
      ),
      BottomNavigationBarItem(
        label: "Настройка",
        icon: SvgPicture.asset(
          IconPaths.settings,
          colorFilter: getFilter(3),
        ),
      ),
    ];
  }

  ColorFilter getFilter(int index) => ColorFilter.mode(
    index == _currentIndex ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.outline,
    BlendMode.srcIn,
  );
}
