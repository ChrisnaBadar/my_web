import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../../constants/values.dart';

class MemberPageNavigation extends StatefulWidget {
  const MemberPageNavigation({super.key});

  @override
  State<MemberPageNavigation> createState() => _MemberPageNavigationState();
}

class _MemberPageNavigationState extends State<MemberPageNavigation> {
  double _mainNavigationHeight = 0.0;
  ExpandableController? _expandableController;
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
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
                              onPressed: () =>
                                  mainNavigationData[index].buttonFunction,
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
            controller: _expandableController,
          ),
        ],
      );
}

class MemberNavigationModel {
  final String buttonTitle;
  Function? buttonFunction;

  MemberNavigationModel({required this.buttonTitle, this.buttonFunction});
}
