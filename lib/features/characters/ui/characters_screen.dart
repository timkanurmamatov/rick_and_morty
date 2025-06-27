import 'package:flutter/material.dart';
import 'package:rick_and_morty/api/api_service.dart';
import 'package:rick_and_morty/api/dio_client.dart';
import 'package:rick_and_morty/data/models/character_model.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApiService(dioClient: DioClient())
        .getCharactersByIdList(
          [1, 4, 5],
        )
        .then(
          (value) => print(value[0].name),
        );
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
