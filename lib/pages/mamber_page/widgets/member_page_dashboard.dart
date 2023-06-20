import 'package:flutter/material.dart';
import 'package:my_web/pages/mamber_page/member_pages/proyek_outsourcing_page.dart';
import 'package:my_web/pages/mamber_page/member_pages/proyek_property_page.dart';

class MemberPageDashboard extends StatefulWidget {
  final int activatedPage;
  const MemberPageDashboard({super.key, required this.activatedPage});

  @override
  State<MemberPageDashboard> createState() => _MemberPageDashboardState();
}

class _MemberPageDashboardState extends State<MemberPageDashboard> {
  List<Widget> activePage = [ProyekPropertyPage(), ProyekOutsourcingPage()];
  @override
  Widget build(BuildContext context) {
    return activePage[widget.activatedPage];
  }
}
