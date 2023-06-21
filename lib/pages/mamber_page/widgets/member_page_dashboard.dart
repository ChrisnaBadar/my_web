import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_web/pages/mamber_page/member_pages/proyek_outsourcing_page.dart';
import 'package:my_web/pages/mamber_page/member_pages/proyek_property_page.dart';

class MemberPageDashboard extends StatefulWidget {
  final int activatedPage;
  const MemberPageDashboard({super.key, required this.activatedPage});

  @override
  State<MemberPageDashboard> createState() => _MemberPageDashboardState();
}

class _MemberPageDashboardState extends State<MemberPageDashboard>
    with TickerProviderStateMixin {
  List<Widget> activePage = [ProyekPropertyPage(), ProyekOutsourcingPage()];
  late AnimationController animationController;
  late AnimationController rotationAnimation;

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
                    IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.dark_mode)),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.notifications)),
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
                color: Color.fromARGB(255, 236, 236, 236),
                width: _dashboardWidth,
                child: activePage[widget.activatedPage]))
      ],
    );
  }
}
