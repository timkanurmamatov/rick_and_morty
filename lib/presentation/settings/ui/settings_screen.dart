import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/settings/cubit/cubit/theme_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Настройки"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            "Внешний вид".toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall,
          ),
          SizedBox(height: 24),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    actions: [
                      TextButton(
                        onPressed: Navigator.of(context).pop,
                        child: Text("Отмена"),
                      ),
                    ],
                    content: BlocBuilder<ThemeCubit, ThemeMode>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Темная тема",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            ...List.generate(
                              ThemeMode.values.length,
                              (index) {
                                return ListTile(
                                  onTap: () {
                                    context.read<ThemeCubit>().updateThemeMode(
                                      ThemeMode.values[index],
                                    );
                                  },
                                  leading: Radio<ThemeMode>(
                                    value: ThemeMode.values[index],
                                    groupValue: state,
                                    onChanged: (value) {
                                      context
                                          .read<ThemeCubit>()
                                          .updateThemeMode(
                                            value ?? ThemeMode.system,
                                          );
                                    },
                                  ),
                                  title: Text(ThemeMode.values[index].text),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
              );
            },
            leading: Icon(Icons.palette_outlined),
            title: Text(
              "Темная тема",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, state) {
                return Text(
                  state.text,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).disabledColor,
                  ),
                );
              },
            ),
            trailing: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
