import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/models/character_entity.dart';
import 'package:rick_and_morty/presentation/characters/ui/widgets/character_list_tile.dart';

import 'character_grid_tile.dart';

class CharacterListContent extends StatelessWidget {
  final List<CharacterEntity> characters;
  final bool isListView;

  const CharacterListContent({
    super.key,
    required this.characters,
    required this.isListView,
  });

  @override
  Widget build(BuildContext context) {
    // todo: обновить виджеты [CharacterListTile] и [CharacterGridTile] чтобы они работали с enum
    return isListView
        ? ListView.separated(
            itemCount: characters.length,
            separatorBuilder: (context, index) => SizedBox(height: 12),
            itemBuilder: (context, index) {
              return CharacterListTile(
                gender: characters[index].gender,
                imageUrl: characters[index].image,
                name: characters[index].name,
                species: characters[index].species,
                status: characters[index].status,
              );
            },
          )
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 164 / 192,
              crossAxisSpacing: 16,
              mainAxisSpacing: 24,
            ),
            itemCount: characters.length,
            itemBuilder: (BuildContext context, int index) {
              return CharacterGridTile(
                gender: characters[index].gender,
                imageUrl: characters[index].image,
                name: characters[index].name,
                species: characters[index].species,
                status: characters[index].status,
              );
            },
          );
  }
}
