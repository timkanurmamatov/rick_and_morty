import 'package:flutter/material.dart';
import 'package:rick_and_morty/common/extensions/build_context_extension.dart';

class TotalCountWidget extends StatelessWidget {
  final String title;
  final int amount;

  const TotalCountWidget({
    super.key,
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title: $amount",
      style: context.textTheme.labelSmall?.copyWith(
        color: Theme.of(context).disabledColor,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
