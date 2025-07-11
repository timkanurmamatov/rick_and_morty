import 'package:flutter/material.dart';

class SearchContainer extends StatelessWidget {
  final String label;
  final VoidCallback onSearchPressed;
  final VoidCallback? onFilterPressed;

  const SearchContainer({
    super.key,
    required this.label,
    required this.onSearchPressed,
    this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSearchPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          // todo: надо привязать цвет к теме, для корректной работы темной темы
          color: Color(0xFFF2F2F2),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: onSearchPressed,
              icon: Icon(Icons.search),
            ),
            Expanded(
              child: Text(
                "Найти персонажа",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            if (onFilterPressed != null) ...[
              SizedBox(height: 26, child: VerticalDivider()),
              IconButton(
                icon: Icon(Icons.filter_alt),
                onPressed: onFilterPressed,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
