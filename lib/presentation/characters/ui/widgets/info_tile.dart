import 'package:flutter/material.dart';
import 'package:rick_and_morty/common/extensions/build_context_extension.dart';

class InfoTile extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback? onTap;

  const InfoTile({
    super.key,
    required this.label,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: context.textTheme.bodySmall?.copyWith(
          color: Theme.of(context).disabledColor,
        ),
      ),
      subtitle: Text(
        value,
        style: context.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: onTap != null ? Icon(Icons.chevron_right) : null,
      onTap: onTap,
    );
  }
}
