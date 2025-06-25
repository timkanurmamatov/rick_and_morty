import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/constants/icon_paths.dart';

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
    );
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
    index == _currentIndex
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.outline,
    BlendMode.srcIn,
  );
}
