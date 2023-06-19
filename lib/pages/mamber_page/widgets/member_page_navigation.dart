import 'package:flutter/material.dart';

import '../../../constants/values.dart';

class MemberPageNavigation extends StatefulWidget {
  const MemberPageNavigation({super.key});

  @override
  State<MemberPageNavigation> createState() => _MemberPageNavigationState();
}

class _MemberPageNavigationState extends State<MemberPageNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 0, 22, 54),
      child: Column(
        children: [
          //Navigator Header
          SizedBox(
            height: 50.0,
            child: Image.asset(
              ImagePath.LOGO_LIGHT,
              scale: 2.5,
            ),
          ),
          const Divider()

          //Navigator Body
        ],
      ),
    );
  }
}
