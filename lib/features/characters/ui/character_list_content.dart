import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/models/character_model.dart';
import 'package:rick_and_morty/features/characters/ui/character_list_tile.dart';

class CharacterListContent extends StatefulWidget {
  final List<CharacterModel> characters;

  const CharacterListContent({super.key, required this.characters});

  @override
  State<CharacterListContent> createState() => _CharacterListContentState();
}

class _CharacterListContentState extends State<CharacterListContent> {
  late bool isListView;

  @override
  void initState() {
    isListView = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isListView
        ? ListView.separated(
            itemCount: widget.characters.length,
            separatorBuilder: (context, index) => SizedBox(height: 12),
            itemBuilder: (context, index) {
              return CharacterListTile(
                gender: widget.characters[index].gender,
                imageUrl: widget.characters[index].image,
                name: widget.characters[index].name,
                species: widget.characters[index].species,
                status: widget.characters[index].status,
              );
            },
          )
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: widget.characters.length,
            itemBuilder: (BuildContext context, int index) {
              return CharacterListTile(
                gender: widget.characters[index].gender,
                imageUrl: widget.characters[index].image,
                name: widget.characters[index].name,
                species: widget.characters[index].species,
                status: widget.characters[index].status,
              );
            },
          );
  }
}
