import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:my_web/pages/mamber_page/widgets/member_page_dashboard.dart';

import '../../constants/values.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({super.key});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  int navigatorFlex = 1;
  int dashboardFlex = 5;

  int activatedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        //Navigator
        context.breakpoint > LayoutBreakpoint.sm
            ? Expanded(
                flex: navigatorFlex,
                child: Container(
                  color: Color.fromARGB(255, 0, 22, 54),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Navigator Header
                      SizedBox(
                        height: 50.0,
                        child: Image.asset(
                          ImagePath.LOGO_LIGHT,
                          scale: 2.5,
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        height: 32.0,
                      ),

                      //Navigator Body
                      _mainExpandable(),
                      SizedBox(
                        height: 32.0,
                      ),
                      _yaumiPage()
                    ],
                  ),
                ))
            : Container(),
        //dashboard
        Expanded(
            flex: dashboardFlex,
            child: MemberPageDashboard(
              activatedPage: activatedPage,
            ))
      ],
    ));
  }

  List<MemberNavigationModel> mainNavigationData = [
    MemberNavigationModel(
        buttonTitle: 'Proyek Properti',
        buttonFunction: () => debugPrint('click')),
    MemberNavigationModel(buttonTitle: 'Proyek Outsourcing')
  ];

  List<MemberNavigationModel> yaumiNavigationData = [
    MemberNavigationModel(buttonTitle: 'Yaumi'),
    MemberNavigationModel(buttonTitle: 'Absen Online'),
    MemberNavigationModel(buttonTitle: 'Payroll Receipt')
  ];

  _mainExpandable() => _navigationItemWidget(
      header: 'MAIN',
      expandableTitle: 'Dashboard',
      icon: Icons.home,
      mainNavigationData: mainNavigationData);

  _yaumiPage() => _navigationItemWidget(
      header: 'PERSONAL',
      expandableTitle: 'Info Karyawan',
      icon: Icons.person,
      mainNavigationData: yaumiNavigationData);
  _absenPage() => Container();
  _outsourcingPage() => Container();
  _propertyPage() => Container();

  _navigationItemWidget(
          {required String header,
          required String expandableTitle,
          required IconData icon,
          required List<MemberNavigationModel> mainNavigationData}) =>
      Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 20.0,
              ),
              Text(header,
                  style: TextStyle(
                      color: Colors.grey.withOpacity(.5),
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0)),
            ],
          ),
          ExpandablePanel(
            collapsed: Container(),
            header: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 16.0,
                  height: 40,
                ),
                Icon(
                  icon,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  expandableTitle,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            expanded: Column(
              children: List.generate(
                  mainNavigationData.length,
                  (index) => Row(
                        children: [
                          SizedBox(
                            width: 32.0,
                          ),
                          TextButton.icon(
                              onPressed: () {
                                setState(() {
                                  activatedPage = index;
                                  print(activatedPage);
                                });
                              },
                              icon: Icon(
                                Icons.circle_outlined,
                                size: 10.0,
                                color: Colors.white,
                              ),
                              label:
                                  Text(mainNavigationData[index].buttonTitle)),
                        ],
                      )),
            ),
            theme: ExpandableThemeData(
                tapBodyToExpand: true,
                iconColor: Colors.white,
                iconPlacement: ExpandablePanelIconPlacement.right),
          ),
        ],
      );
}

class MemberNavigationModel {
  final String buttonTitle;
  Function? buttonFunction;

  MemberNavigationModel({required this.buttonTitle, this.buttonFunction});
}
