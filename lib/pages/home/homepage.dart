import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_web/pages/home/sections/about_section.dart';
import 'package:my_web/pages/home/sections/awards_section.dart';
import 'package:my_web/pages/home/sections/blog_section.dart';
import 'package:my_web/pages/home/sections/footer_section.dart';
import 'package:my_web/pages/home/sections/header_section/header_section.dart';
import 'package:my_web/pages/home/sections/nav_section/nav_section_mobile.dart';
import 'package:my_web/pages/home/sections/nav_section/nav_section_web.dart';
import 'package:my_web/pages/home/sections/projects_section.dart';
import 'package:my_web/pages/home/sections/skills_section.dart';
import 'package:my_web/pages/home/sections/statistics_section.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../constants/values.dart';
import '../../layout/adaptive.dart';
import '../../utils/functions.dart';
import '../widgets/app_drawer.dart';
import '../widgets/nav_item.dart';
import '../widgets/spaces.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.easeInOut,
  );
  // bool isFabVisible = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final ScrollController _scrollController = ScrollController();

  final List<NavItemData> navItems = [
    NavItemData(name: StringConst.HOME, key: GlobalKey(), isSelected: true),
    NavItemData(name: StringConst.ABOUT, key: GlobalKey()),
    NavItemData(name: StringConst.PROJECTS, key: GlobalKey()),
    NavItemData(name: StringConst.AMALA, key: GlobalKey()),
    NavItemData(name: StringConst.BLOG, key: GlobalKey()),
  ];

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels < 100) {
        _animationController.reverse();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = heightOfScreen(context);
    double spacerHeight = screenHeight * 0.10;
    return Scaffold(
      //KEY
      key: _scaffoldKey,

      //AppDrawer
      drawer: ResponsiveBuilder(
        refinedBreakpoints: const RefinedBreakpoints(),
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;
          if (screenWidth < const RefinedBreakpoints().desktopSmall) {
            return AppDrawer(
              menuList: navItems,
            );
          } else {
            return Container();
          }
        },
      ),

      //FLOATING
      floatingActionButton: ScaleTransition(
        scale: _animation,
        child: FloatingActionButton(
          onPressed: () {
            // Scroll to header section
            scrollToSection(navItems[0].key.currentContext!);
          },
          child: const Icon(
            FontAwesomeIcons.arrowUp,
            size: Sizes.ICON_SIZE_18,
            color: AppColors.white,
          ),
        ),
      ),

      body: Column(
        children: [
          //div1
          ResponsiveBuilder(
            refinedBreakpoints: const RefinedBreakpoints(),
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
              if (screenWidth < const RefinedBreakpoints().desktopSmall) {
                return NavSectionMobile(scaffoldKey: _scaffoldKey);
              } else {
                return NavSectionWeb(
                  navItems: navItems,
                );
              }
            },
          ),

          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  //_______ 1
                  HeaderSection(
                    key: navItems[0].key,
                  ),
                  SizedBox(height: spacerHeight),
                  VisibilityDetector(
                    key: const Key("about"),
                    onVisibilityChanged: (visibilityInfo) {
                      double visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage > 10) {
                        _animationController.forward();
                      }
                    },
                    child: Container(
                      key: navItems[1].key,
                      child: AboutMeSection(),
                    ),
                  ),

                  //_______
                  SizedBox(height: spacerHeight),

                  //_______ 2
                  Stack(
                    children: [
                      Positioned(
                        top: assignWidth(context, 0.1),
                        left: -assignWidth(context, 0.05),
                        child: Image.asset(ImagePath.BLOB_FEMUR_ASH),
                      ),
                      Positioned(
                        right: -assignWidth(context, 0.5),
                        child: Image.asset(ImagePath.BLOB_SMALL_BEAN_ASH),
                      ),
                      Column(
                        children: [
                          // Container(
                          //   key: navItems[2].key,
                          //   child: SkillsSection(),
                          // ),
                          SizedBox(height: spacerHeight),
                          StatisticsSection(),
                          SizedBox(height: spacerHeight),
                          //____________==== PROJECTS ==========
                          Container(
                            key: navItems[2].key,
                            child: ProjectsSection(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: spacerHeight),

                  // _______ 3
                  Stack(
                    children: [
                      Positioned(
                        left: -assignWidth(context, 0.6),
                        child: Image.asset(ImagePath.BLOB_ASH),
                      ),
                      Column(
                        children: [
                          // Container(
                          //   key: navItems[4].key,
                          //   child: AwardsSection(),
                          // ),
                          // SpaceH40(),
                          // Container(
                          //   key: navItems[4].key,
                          //   child: BlogSection(),
                          // ),
                          FooterSection(),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
