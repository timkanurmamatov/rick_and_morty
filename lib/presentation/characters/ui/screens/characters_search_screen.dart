import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/constants/image_paths.dart';
import 'package:rick_and_morty/presentation/characters/ui/bloc/character_bloc/character_bloc.dart';
import 'package:rick_and_morty/presentation/characters/ui/widgets/character_list_tile.dart';

// Todo: добавить пагинацию

class CharactersSearchScreen extends StatefulWidget {
  const CharactersSearchScreen({super.key});

  @override
  State<CharactersSearchScreen> createState() => _CharactersSearchScreenState();
}

class _CharactersSearchScreenState extends State<CharactersSearchScreen> {
  final TextEditingController controller = TextEditingController();
  final CharacterBloc _characterBloc = CharacterBloc();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    controller.dispose();
    _characterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            TextField(
              autofocus: true,
              controller: controller,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: Navigator.of(context).pop,
                  icon: Icon(Icons.arrow_back),
                ),
                suffixIcon: IconButton(
                  onPressed: controller.clear,
                  icon: Icon(Icons.close),
                ),
              ),
              onChanged: _onSearchChanged,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "РЕЗУЛЬТАТЫ ПОИСКА",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).disabledColor,
                ),
              ),
            ),
            Expanded(
              child: BlocConsumer<CharacterBloc, CharacterState>(
                bloc: _characterBloc,
                listener: (context, state) {
                  if (state is CharacterError) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Понял"),
                            ),
                          ],
                          icon: Icon(
                            Icons.error,
                            size: 50,
                            color: Theme.of(context).colorScheme.error,
                          ),
                          content: Text(
                            state.message,
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    );
                  }
                },
                builder: (context, state) {
                  if (state is CharacterLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is CharacterLoaded) {
                    final characters = state.data.characters;
                    if (characters.isEmpty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImagePaths.mortyNoContent,
                            height: 251,
                            width: 150,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 80.0,
                            ),
                            child: Text(
                              "Персонаж с таким именем не найден",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    color: Theme.of(context).dividerColor,
                                  ),
                            ),
                          ),
                        ],
                      );
                    }
                    return ListView.separated(
                      itemCount: characters.length,
                      padding: EdgeInsets.all(16),
                      itemBuilder: (context, index) => CharacterListTile(
                        name: characters[index].name,
                        gender: characters[index].gender,
                        status: characters[index].status,
                        species: characters[index].species,
                        imageUrl: characters[index].image,
                      ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16),
                    );
                  }

                  return SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _characterBloc.add(LoadCharactersEvent(name: query));
    });
  }
}
