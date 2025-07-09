import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/characters/ui/bloc/character_bloc/character_bloc.dart';
import 'package:rick_and_morty/presentation/characters/ui/screens/characters_search_screen.dart';
import 'package:rick_and_morty/presentation/characters/ui/widgets/character_list_content.dart';
import 'package:rick_and_morty/presentation/common/widgets/total_count_widget.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  ScrollController controller = ScrollController();

  late bool isListView;

  CharacterBloc get bloc => context.read<CharacterBloc>();

  @override
  void initState() {
    bloc.add(LoadCharactersEvent());

    isListView = true;

    controller.addListener(
      () {
        final bool isCloseToEnd = controller.position.pixels > controller.position.maxScrollExtent - 200;

        final bool isNextPageLoadingPossible = bloc.state is! CharacterNextPageLoading && bloc.state.data.hasNextPage;

        if (isCloseToEnd && isNextPageLoadingPossible) {
          // Пробросить событие что нужно грузить следующую страницу
          bloc.add(LoadNextCharactersPageEvent());
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
                  // enabled: false,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CharactersSearchScreen(),
                      ),
                    );
                  },
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
                      controller: controller,
                      characters: state.data.characters,
                      isListView: isListView,
                      showLoadingIndicator: state is CharacterNextPageLoading,
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
