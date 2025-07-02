import 'package:flutter/material.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchBar(
              elevation: WidgetStatePropertyAll(0),
              backgroundColor: WidgetStatePropertyAll(Color(0xFFF2F2F2)),
              leading: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              hintText: "Поиск",
              trailing: [
                SizedBox(height: 26, child: VerticalDivider()),
                IconButton(icon: Icon(Icons.filter_alt), onPressed: () {}),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
