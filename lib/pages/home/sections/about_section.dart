import 'package:flutter/material.dart';
import 'package:my_web/layout/adaptive.dart';
import 'package:my_web/pages/widgets/buttons/social_button_2.dart';
import 'package:my_web/pages/widgets/content_area.dart';
import 'package:my_web/pages/widgets/empty.dart';
import 'package:my_web/pages/widgets/nimbus_info_section.dart';
import 'package:my_web/pages/widgets/nimbus_link.dart';
import 'package:my_web/pages/widgets/spaces.dart';
import 'package:my_web/utils/functions.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../constants/values.dart';

const double kSpacingSm = 40.0;
const double kRunSpacingSm = 24.0;
const double kSpacingLg = 24.0;
const double kRunSpacingLg = 16.0;

class AboutMeSection extends StatefulWidget {
  AboutMeSection({Key? key});
  @override
  _AboutMeSectionState createState() => _AboutMeSectionState();
}

class _AboutMeSectionState extends State<AboutMeSection>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late AnimationController _fadeInController;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 750),
      vsync: this,
    );
    _fadeInController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _scaleAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _scaleController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _fadeInAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _fadeInController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _fadeInController.forward();
      }
    });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _fadeInController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context) - getSidePadding(context);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidthSm = screenWidth * 1.0;
    double contentAreaHeightSm = screenHeight * 0.6;
    double contentAreaWidthLg = screenWidth * 0.5;
    return VisibilityDetector(
      key: Key('about-section'),
      onVisibilityChanged: (visibilityInfo) {
        double visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 25) {
          _scaleController.forward();
        }
      },
      child: Container(
        padding: EdgeInsets.only(left: getSidePadding(context)),
        child: ResponsiveBuilder(
          refinedBreakpoints: RefinedBreakpoints(),
          builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            if (screenWidth < (RefinedBreakpoints().tabletLarge)) {
              return Column(
                children: [
                  ContentArea(
                    width: contentAreaWidthSm,
                    child: _buildConstructionImage(
                      width: contentAreaWidthSm,
                      height: contentAreaHeightSm,
                    ),
                  ),
                  SpaceH40(),
                  ContentArea(
                    width: contentAreaWidthSm,
                    child: _buildAboutConst(
                      width: contentAreaWidthSm,
                      height: screenHeight,
                    ),
                  ),
                  SpaceH40(),
                  ContentArea(
                    width: contentAreaWidthSm,
                    child: _buildOutsourceImage(
                      width: contentAreaWidthSm,
                      height: contentAreaHeightSm,
                    ),
                  ),
                  SpaceH40(),
                  ContentArea(
                    width: contentAreaWidthSm,
                    child: _buildAbouOutsource(
                      width: contentAreaWidthSm,
                      height: screenHeight,
                    ),
                  ),
                  SpaceH40(),
                  ContentArea(
                    width: contentAreaWidthSm,
                    child: _buildAmalaImage(
                      width: contentAreaWidthSm,
                      height: contentAreaHeightSm,
                    ),
                  ),
                  SpaceH40(),
                  ContentArea(
                    width: contentAreaWidthSm,
                    child: _buildAboutAmala(
                      width: contentAreaWidthSm,
                      height: screenHeight,
                    ),
                  ),
                  SpaceH40(),
                ],
              );
            } else {
              return Column(
                children: [
                  //____________BUIDLING CONSTRUCTION SECTION_____________
                  Row(
                    children: [
                      ContentArea(
                        width: contentAreaWidthLg,
                        child: _buildConstructionImage(
                          width: contentAreaWidthLg,
                          height: screenHeight,
                        ),
                      ),
                      ContentArea(
                        width: contentAreaWidthLg,
                        child: _buildAboutConst(
                          width: contentAreaWidthLg,
                          height: screenHeight,
                        ),
                      ),
                    ],
                  ),
                  //____________OURSOURCE SECTION_____________
                  Row(
                    children: [
                      ContentArea(
                        width: contentAreaWidthLg,
                        child: _buildAbouOutsource(
                          width: contentAreaWidthLg,
                          height: screenHeight,
                        ),
                      ),
                      ContentArea(
                        width: contentAreaWidthLg,
                        child: _buildOutsourceImage(
                          width: contentAreaWidthLg,
                          height: screenHeight,
                        ),
                      ),
                    ],
                  ),
                  //____________APP DEV SECTION_____________
                  Row(
                    children: [
                      ContentArea(
                        width: contentAreaWidthLg,
                        child: _buildAmalaImage(
                          width: contentAreaWidthLg,
                          height: screenHeight,
                        ),
                      ),
                      ContentArea(
                        width: contentAreaWidthLg,
                        child: _buildAboutAmala(
                          width: contentAreaWidthLg,
                          height: screenHeight,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  List<Widget> _buildSocialButtons(
    List<SocialButton2Data> data, {
    double? width,
  }) {
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        SocialButton2(
          width: width,
          title: data[index].title.toUpperCase(),
          iconData: data[index].iconData,
          onPressed: () => openUrlLink(data[index].url),
          titleColor: data[index].titleColor,
          buttonColor: data[index].buttonColor,
          iconColor: data[index].iconColor,
        ),
        // NimBusLink(
        //   url: data[index].url,
        //   child: SocialButton2(
        //     width: width,
        //     title: data[index].title.toUpperCase(),
        //     iconData: data[index].iconData,
        //     onPressed: () {},
        //     titleColor: data[index].titleColor,
        //     buttonColor: data[index].buttonColor,
        //     iconColor: data[index].iconColor,
        //   ),
        // ),
      );
    }
    return items;
  }

  Widget _buildConstructionImage(
      {required double width, required double height}) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double fontSize = responsiveSize(context, 60, 72, md: 64);
    TextStyle? titleStyle = textTheme.bodyLarge?.merge(
      Styles.customTextStyle3(fontSize: fontSize, height: 1.25),
    );

    return Stack(
      children: [
        Positioned(
          top: height * 0.1,
          right: -(width * 0.20),
          child: ResponsiveBuilder(
            refinedBreakpoints: RefinedBreakpoints(),
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
              if (screenWidth < (RefinedBreakpoints().tabletLarge)) {
                return Image.asset(
                  ImagePath.BLOB_BLACK,
                  height: height * 0.25,
                  width: width * 0.25,
                );
              } else {
                return Empty();
              }
            },
          ),
        ),
        Stack(
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              child: Image.asset(
                ImagePath.DOTS_GLOBE_GREY,
                width: 180,
                height: 180,
              ),
            ),
            Image.asset(
              ImagePath.CONSTRUCTION,
              width: width * 0.95,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOutsourceImage({required double width, required double height}) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double fontSize = responsiveSize(context, 60, 72, md: 64);
    TextStyle? titleStyle = textTheme.bodyLarge?.merge(
      Styles.customTextStyle3(fontSize: fontSize, height: 1.25),
    );

    return Stack(
      children: [
        Positioned(
          top: height * 0.1,
          right: -(width * 0.20),
          child: ResponsiveBuilder(
            refinedBreakpoints: RefinedBreakpoints(),
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
              if (screenWidth < (RefinedBreakpoints().tabletLarge)) {
                return Image.asset(
                  ImagePath.BLOB_BLACK,
                  height: height * 0.25,
                  width: width * 0.25,
                );
              } else {
                return Empty();
              }
            },
          ),
        ),
        Stack(
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              child: Image.asset(
                ImagePath.DOTS_GLOBE_GREY,
                width: 180,
                height: 180,
              ),
            ),
            Image.asset(
              ImagePath.CLEANING_SERVICE,
              width: width * 0.95,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAmalaImage({required double width, required double height}) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double fontSize = responsiveSize(context, 60, 72, md: 64);
    TextStyle? titleStyle = textTheme.bodyLarge?.merge(
      Styles.customTextStyle3(fontSize: fontSize, height: 1.25),
    );

    return Stack(
      children: [
        Positioned(
          top: height * 0.1,
          right: -(width * 0.20),
          child: ResponsiveBuilder(
            refinedBreakpoints: RefinedBreakpoints(),
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
              if (screenWidth < (RefinedBreakpoints().tabletLarge)) {
                return Image.asset(
                  ImagePath.BLOB_BLACK,
                  height: height * 0.25,
                  width: width * 0.25,
                );
              } else {
                return Empty();
              }
            },
          ),
        ),
        Stack(
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              child: Image.asset(
                ImagePath.DOTS_GLOBE_GREY,
                width: 180,
                height: 180,
              ),
            ),
            Image.asset(
              ImagePath.AMALA_MOCKUP,
              width: width * 0.95,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAboutConst({
    required double width,
    required double height,
  }) {
    return ResponsiveBuilder(
      refinedBreakpoints: RefinedBreakpoints(),
      builder: (context, sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;
        if (screenWidth < (RefinedBreakpoints().tabletNormal)) {
          return constructionInfoSectionSm(width: width);
        } else {
          //This container takes 85% of the space and leave 15% as spacing
          //between the blob and the content
          return Container(
            width: width * 0.85,
            child: constructionInfoSectionLg(),
          );
        }
      },
    );
  }

  Widget _buildAbouOutsource({
    required double width,
    required double height,
  }) {
    return ResponsiveBuilder(
      refinedBreakpoints: RefinedBreakpoints(),
      builder: (context, sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;
        if (screenWidth < (RefinedBreakpoints().tabletNormal)) {
          return outsourceInfoSectionSm(width: width);
        } else {
          //This container takes 85% of the space and leave 15% as spacing
          //between the blob and the content
          return Container(
            width: width * 0.85,
            child: outsourceInfoSectionLg(),
          );
        }
      },
    );
  }

  Widget _buildAboutAmala({
    required double width,
    required double height,
  }) {
    return ResponsiveBuilder(
      refinedBreakpoints: RefinedBreakpoints(),
      builder: (context, sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;
        if (screenWidth < (RefinedBreakpoints().tabletNormal)) {
          return outsourceInfoSectionSm(width: width);
        } else {
          //This container takes 85% of the space and leave 15% as spacing
          //between the blob and the content
          return Container(
            width: width * 0.85,
            child: amalaInfoSectionLg(),
          );
        }
      },
    );
  }

  Widget constructionInfoSectionLg() {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NimbusInfoSection1(
                sectionTitle: StringConst.ABOUT_CONST,
                title1: StringConst.CONSTRUCTION_INTRO,
                title2: StringConst.CONST_HELP,
                body: StringConst.ABOUT_CONST_DESC,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringConst.CONST_CHECK,
                      style: textTheme.titleLarge?.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    SpaceH16(),
                    Wrap(
                      spacing: kSpacingLg,
                      runSpacing: kRunSpacingLg,
                      children: _buildSocialButtons(
                        Data.socialData2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget outsourceInfoSectionLg() {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NimbusInfoSection1(
                sectionTitle: StringConst.ABOUT_OUTSOURCE,
                title1: StringConst.OUTSOURCE_INTRO,
                title2: StringConst.OUTSOURCE_HELP,
                body: StringConst.ABOUT_OUTSOURCE_DESC,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringConst.OUTSOURCE_CHECK,
                      style: textTheme.titleLarge?.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    SpaceH16(),
                    Wrap(
                      spacing: kSpacingLg,
                      runSpacing: kRunSpacingLg,
                      children: _buildSocialButtons(
                        Data.socialData2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget amalaInfoSectionLg() {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NimbusInfoSection1(
                sectionTitle: StringConst.ABOUT_AMALA,
                title1: StringConst.AMALA_INTRO,
                title2: StringConst.AMALA_HELP,
                body: StringConst.ABOUT_AMALA_DESC,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringConst.AMALA_CHECK,
                      style: textTheme.titleLarge?.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    SpaceH16(),
                    Wrap(
                      spacing: kSpacingLg,
                      runSpacing: kRunSpacingLg,
                      children: _buildSocialButtons(
                        Data.socialData2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget planningInfoSectionLg() {
  //   TextTheme textTheme = Theme.of(context).textTheme;

  //   return Row(
  //     children: [
  //       Expanded(
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             NimbusInfoSection1(
  //               sectionTitle: StringConst.ABOUT_US,
  //               title1: StringConst.CREATIVE_DESIGN,
  //               title2: StringConst.HELP,
  //               body: StringConst.ABOUT_US_DESC,
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     StringConst.FOLLOW_ME_1,
  //                     style: textTheme.headline6?.copyWith(
  //                       color: AppColors.black,
  //                     ),
  //                   ),
  //                   SpaceH16(),
  //                   Wrap(
  //                     spacing: kSpacingLg,
  //                     runSpacing: kRunSpacingLg,
  //                     children: _buildSocialButtons(
  //                       Data.socialData2,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget appDevInfoSectionLg() {
  //   TextTheme textTheme = Theme.of(context).textTheme;

  //   return Row(
  //     children: [
  //       Expanded(
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             NimbusInfoSection1(
  //               sectionTitle: StringConst.ABOUT_US,
  //               title1: StringConst.CREATIVE_DESIGN,
  //               title2: StringConst.HELP,
  //               body: StringConst.ABOUT_US_DESC,
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     StringConst.FOLLOW_ME_1,
  //                     style: textTheme.headline6?.copyWith(
  //                       color: AppColors.black,
  //                     ),
  //                   ),
  //                   SpaceH16(),
  //                   Wrap(
  //                     spacing: kSpacingLg,
  //                     runSpacing: kRunSpacingLg,
  //                     children: _buildSocialButtons(
  //                       Data.socialData2,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget constructionInfoSectionSm({required double width}) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return NimbusInfoSection2(
      sectionTitle: StringConst.ABOUT_CONST,
      title1: StringConst.CONSTRUCTION_INTRO,
      title2: StringConst.CONST_HELP,
      body: StringConst.ABOUT_CONST_DESC,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConst.CONST_CHECK,
            style: textTheme.titleLarge?.copyWith(color: AppColors.black),
          ),
          SpaceH16(),
          Wrap(
            spacing: kSpacingSm,
            runSpacing: kRunSpacingSm,
            children: _buildSocialButtons(Data.socialData2),
          ),
        ],
      ),
    );
  }

  Widget outsourceInfoSectionSm({required double width}) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return NimbusInfoSection2(
      sectionTitle: StringConst.ABOUT_OUTSOURCE,
      title1: StringConst.OUTSOURCE_INTRO,
      title2: StringConst.OUTSOURCE_HELP,
      body: StringConst.ABOUT_OUTSOURCE_DESC,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConst.OUTSOURCE_CHECK,
            style: textTheme.titleLarge?.copyWith(color: AppColors.black),
          ),
          SpaceH16(),
          Wrap(
            spacing: kSpacingSm,
            runSpacing: kRunSpacingSm,
            children: _buildSocialButtons(Data.socialData2),
          ),
        ],
      ),
    );
  }
}
