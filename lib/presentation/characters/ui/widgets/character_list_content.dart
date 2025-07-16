import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/models/character_entity.dart';
import 'package:rick_and_morty/presentation/characters/ui/widgets/character_list_tile.dart';

import 'character_grid_tile.dart';

class CharacterListContent extends StatelessWidget {
  final List<CharacterEntity> characters;
  final bool isListView;
  final ScrollController controller;
  final bool showLoadingIndicator;

  const CharacterListContent({
    super.key,
    required this.characters,
    required this.isListView,
    required this.controller,
    this.showLoadingIndicator = false,
  });

  @override
  Widget build(BuildContext context) {
    return isListView
        ? ListView.separated(
            controller: controller,
            itemCount: showLoadingIndicator ? characters.length + 1 : characters.length,
            separatorBuilder: (context, index) => SizedBox(height: 12),
            itemBuilder: (context, index) {
              if (showLoadingIndicator && index >= characters.length) {
                return Center(child: CircularProgressIndicator());
              } else {
                return CharacterListTile(
                  gender: characters[index].gender,
                  imageUrl: characters[index].image,
                  name: characters[index].name,
                  species: characters[index].species,
                  status: characters[index].status,
                  id: characters[index].id,
                );
              }
            },
          )
        : GridView.builder(
            controller: controller,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 164 / 192,
              crossAxisSpacing: 16,
              mainAxisSpacing: 24,
            ),
            itemCount: showLoadingIndicator ? characters.length + 1 : characters.length,
            itemBuilder: (BuildContext context, int index) {
              if (showLoadingIndicator && index >= characters.length) {
                return Center(child: CircularProgressIndicator());
              } else {
                return CharacterGridTile(
                  gender: characters[index].gender,
                  imageUrl: characters[index].image,
                  name: characters[index].name,
                  species: characters[index].species,
                  status: characters[index].status,
                  id: characters[index].id,
                );
              }
            },
          );
  }
}
