// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:budget_planner/app/core/theme.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class NavbarItem extends StatelessWidget {
  final String icon;
  final bool isActive;
  const NavbarItem({
    Key? key,
    required this.icon,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: SvgPicture.asset(
        'assets/$icon.svg',
        // ignore: deprecated_member_use
        color: isActive ? ColorsApp.main : ColorsApp.grey2,
      ),
    );
  }
}
