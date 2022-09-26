import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';

class AuthBar extends StatelessWidget {
  const AuthBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SideBar(left: true),
        SizedBox(
          width: 85,
          height: 85,
          child: SvgPicture.asset('assets/images/auth/auth_bar.svg'),
        ),
        const SideBar(left: false),
      ],
    );
  }
}

class SideBar extends StatelessWidget {
  final bool left;

  const SideBar({
    Key? key,
    required this.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.only(
          left: !left ? MediaQuery.of(context).size.width * 0.025 : 0,
          right: left ? MediaQuery.of(context).size.width * 0.025 : 0,
        ),
        child: const Divider(
          color: black,
          thickness: 0.5,
        ),
      ),
    );
  }
}
