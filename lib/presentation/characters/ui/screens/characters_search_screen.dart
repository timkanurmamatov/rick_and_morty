import 'package:flutter/material.dart';

class CharactersSearchScreen extends StatefulWidget {
  const CharactersSearchScreen({super.key});

  @override
  State<CharactersSearchScreen> createState() => _CharactersSearchScreenState();
}

class _CharactersSearchScreenState extends State<CharactersSearchScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            TextField(
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
              child: ListView.builder(
                itemCount: 0,
                itemBuilder: (context, index) => Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
