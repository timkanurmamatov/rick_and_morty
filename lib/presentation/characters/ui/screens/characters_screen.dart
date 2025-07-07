import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/characters/ui/bloc/character_bloc.dart';
import 'package:rick_and_morty/presentation/characters/ui/widgets/character_list_content.dart';
import 'package:rick_and_morty/presentation/common/widgets/total_count_widget.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late bool isListView;

  @override
  void initState() {
    context.read<CharacterBloc>().add(LoadCharactersEvent());

    isListView = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchBar(
                  elevation: WidgetStatePropertyAll(0),
                  backgroundColor: WidgetStatePropertyAll(Color(0xFFF2F2F2)),
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  ),
                  hintText: "Поиск",
                  trailing: [
                    SizedBox(height: 26, child: VerticalDivider()),
                    IconButton(icon: Icon(Icons.filter_alt), onPressed: () {}),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TotalCountWidget(
                        title: "Всего персонажей",
                        amount: state.data.totalCount,
                      ),
                    ),
                    IconButton(
                      onPressed: () => setState(() => isListView = !isListView),
                      icon: Icon(
                        isListView ? Icons.grid_view : Icons.list,
                        color: Theme.of(context).disabledColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                if (state is CharacterLoaded)
                  Expanded(
                    child: CharacterListContent(
                      characters: state.data.characters,
                      isListView: isListView,
                    ),
                  )
                else if (state is CharacterLoading)
                  Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
