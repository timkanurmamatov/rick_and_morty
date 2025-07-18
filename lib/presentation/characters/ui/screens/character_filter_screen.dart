import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/domain/extensions/character_status_extension.dart';
import 'package:rick_and_morty/domain/extensions/gender_extension.dart';
import 'package:rick_and_morty/domain/models/character_entity.dart';
import 'package:rick_and_morty/presentation/characters/ui/bloc/filter_cubit/cubit/filter_cubit.dart';

class CharacterFilterScreen extends StatefulWidget {
  const CharacterFilterScreen({super.key});

  @override
  State<CharacterFilterScreen> createState() => _CharacterFilterScreenState();
}

class _CharacterFilterScreenState extends State<CharacterFilterScreen> {
  late Map<CharacterStatus, bool> statusFilter;
  late Map<Gender, bool> genderFilter;

  FilterCubit get filterCubit => context.read<FilterCubit>();

  @override
  void initState() {
    statusFilter = filterCubit.state.statusFilter;
    genderFilter = filterCubit.state.genderFilter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        filterCubit.updateFilters(
          statusFilter: statusFilter,
          genderFilter: genderFilter,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Фильтры"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "СТАТУС",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).disabledColor,
                ),
              ),
              ...List.generate(
                statusFilter.keys.length,
                (index) {
                  // ключ это статус из мапы Map<CharacterStatus, bool>
                  final CharacterStatus key = statusFilter.keys.elementAt(
                    index,
                  );

                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Checkbox(
                      value: statusFilter[key],
                      onChanged: (value) {
                        setState(() {
                          statusFilter[key] = value ?? false;
                        });
                      },
                    ),
                    title: Text(
                      key.text,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  );
                },
              ),
              Divider(height: 40),
              Text(
                "ПОЛ",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).disabledColor,
                ),
              ),
              ...List.generate(
                genderFilter.keys.length,
                (index) {
                  final Gender key = genderFilter.keys.elementAt(index);

                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Checkbox(
                      value: genderFilter[key],
                      onChanged: (value) {
                        setState(() {
                          genderFilter[key] = value ?? false;
                        });
                      },
                    ),
                    title: Text(
                      key.text,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
