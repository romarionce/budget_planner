import 'package:budget_planner/app/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsTile extends StatelessWidget {
  final void Function() fun;
  final String asset;
  final String text;
  const SettingsTile(
      {super.key, required this.fun, required this.asset, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onTap: fun,
        titleAlignment: ListTileTitleAlignment.center,
        leading: Container(
          width: 36,
          height: 36,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset('assets/$asset.svg'),
        ),
        title: Text(text),
        trailing: const Icon(
          Icons.chevron_right,
          size: 23,
        ),
      ),
    );
  }
}
