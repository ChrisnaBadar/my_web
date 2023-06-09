import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout/layout.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({super.key});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController rotationAnimation;

  int navigatorFlex = 1;
  int dashboardFlex = 5;

  double navLeftPad = 8.0;
  double navRightPad = 8.0;
  double navTopPad = 8.0;
  double navBottomPad = 8.0;
  double dashLeftPad = 32.0;
  double dashRightPad = 32.0;
  double dashTopPad = 16.0;
  double dashBottomPad = 16.0;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    rotationAnimation = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    rotationAnimation.forward();
    rotationAnimation.addListener(() {
      if (rotationAnimation.status == AnimationStatus.completed) {
        rotationAnimation.reset();
        rotationAnimation.forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    rotationAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Row(
      children: [
        //Navigator
        //Expanded(flex: navigatorFlex, child: _navigator()),
        //dashboard
        Expanded(flex: 1, child: _dashboard())
      ],
    ));
  }

  _navigator() {
    return Container(
      color: const Color.fromARGB(255, 1, 34, 83),
      child: Column(
        children: [
          //Navigator Header
          SizedBox(
            height: 50.0,
            child: Container(),
          ),
          const Divider()

          //Navigator Body
        ],
      ),
    );
  }

  _dashboard() {
    double _dashboardWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        //Dashboard Header
        SizedBox(
          height: 64.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: IconButton(
                    onPressed: () {
                      if (animationController.status ==
                          AnimationStatus.completed) {
                        animationController.reverse();
                      } else {
                        animationController.forward();
                      }
                    },
                    icon: AnimatedIcon(
                        icon: AnimatedIcons.menu_close,
                        progress: animationController)),
              ),
              SizedBox(
                child: Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: ListTile(
                        leading: CircleAvatar(),
                        title: Text(
                          'Nama Pengguna',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 12.5,
                                  color: Colors.blueGrey[400],
                                  fontWeight: FontWeight.bold)),
                        ),
                        subtitle: Text('Info Pengguna',
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                              fontSize: 12.5,
                              color: Colors.blueGrey[400],
                            ))),
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: RotationTransition(
                            turns: rotationAnimation,
                            child: Icon(Icons.settings))),
                    SizedBox(
                      width: 16.0,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const Divider(
          height: 1,
        ),
        Expanded(
          child: Container(
            color: const Color.fromARGB(255, 202, 228, 247),
            width: _dashboardWidth,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    left: dashLeftPad,
                    right: dashRightPad,
                    top: dashTopPad,
                    bottom: dashBottomPad),
                child: Container(
                  width: MediaQuery.of(context).size.width * .25,
                  height: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.white),
                  child: Column(
                    children: [
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 5,
                                    height: 15,
                                    color: Colors.blue,
                                  ),
                                  Container(
                                    width: 5,
                                    height: 15,
                                    color: Colors.purple,
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                'Projects Summaries $_dashboardWidth',
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Colors.blueGrey[700],
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 1,
                      ),
                      SizedBox(
                        child: DataTable(
                            border: TableBorder(
                                top: BorderSide(),
                                bottom: BorderSide(),
                                left: BorderSide(),
                                right: BorderSide(),
                                horizontalInside: BorderSide(),
                                verticalInside: BorderSide()),
                            columns: [
                              DataColumn(label: Text('Nama Proyek')),
                              DataColumn(label: Text('Jumlah SPK')),
                              DataColumn(label: Text('Nilai Proyek')),
                              DataColumn(label: Text('Gambar Proyek')),
                              DataColumn(label: Text('Foto Proyek')),
                            ],
                            rows: [
                              DataRow(cells: [
                                DataCell(SizedBox(
                                    width:
                                        context.breakpoint > LayoutBreakpoint.sm
                                            ? _dashboardWidth * .2
                                            : _dashboardWidth * .1,
                                    child: Text('Masjid'))),
                                DataCell(SizedBox(
                                    width:
                                        context.breakpoint > LayoutBreakpoint.sm
                                            ? _dashboardWidth * .1
                                            : _dashboardWidth * .05,
                                    child: Text('12 SPK'))),
                                DataCell(SizedBox(
                                    width:
                                        context.breakpoint > LayoutBreakpoint.sm
                                            ? _dashboardWidth * .1
                                            : _dashboardWidth * .05,
                                    child: Text('Rp. 11 Miliar'))),
                                DataCell(SizedBox(
                                    width:
                                        context.breakpoint > LayoutBreakpoint.sm
                                            ? _dashboardWidth * .1
                                            : _dashboardWidth * .05,
                                    child: Text('3 Site Plan'))),
                                DataCell(SizedBox(
                                    width:
                                        context.breakpoint > LayoutBreakpoint.sm
                                            ? _dashboardWidth * .1
                                            : _dashboardWidth * .05,
                                    child: Text('224 Foto'))),
                              ])
                            ]),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )

        //Dashboard body
      ],
    );
  }
}
