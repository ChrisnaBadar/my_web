import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout/layout.dart';
import 'package:my_web/pages/mamber_page/widgets/member_page_dashboard.dart';
import 'package:my_web/pages/mamber_page/widgets/member_page_navigation.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({super.key});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  int navigatorFlex = 1;
  int dashboardFlex = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        //Navigator
        context.breakpoint > LayoutBreakpoint.sm
            ? Expanded(flex: navigatorFlex, child: MemberPageNavigation())
            : Container(),
        //dashboard
        Expanded(flex: dashboardFlex, child: MemberPageDashboard())
      ],
    ));
  }
}
