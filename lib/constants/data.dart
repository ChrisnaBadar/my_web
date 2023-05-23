part of constants;

class Data {
  static List<SocialButtonData> socialData = [
    SocialButtonData(
      tag: StringConst.TWITTER_URL,
      iconData: FontAwesomeIcons.twitter,
      url: StringConst.TWITTER_URL,
    ),
    SocialButtonData(
      tag: StringConst.FACEBOOK_URL,
      iconData: FontAwesomeIcons.facebook,
      url: StringConst.FACEBOOK_URL,
    ),
    SocialButtonData(
      tag: StringConst.LINKED_IN_URL,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    SocialButtonData(
      tag: StringConst.INSTAGRAM_URL,
      iconData: FontAwesomeIcons.instagram,
      url: StringConst.INSTAGRAM_URL,
    ),
  ];
  static List<SocialButton2Data> socialData2 = [
    SocialButton2Data(
      title: StringConst.HIRE_US,
      iconData: FontAwesomeIcons.hireAHelper,
      url: StringConst.DRIBBLE_URL,
      titleColor: AppColors.pink300,
      buttonColor: AppColors.pink300,
      iconColor: AppColors.white,
    ),
    SocialButton2Data(
      title: StringConst.MORE_INFO,
      iconData: FontAwesomeIcons.info,
      url: StringConst.INSTAGRAM_URL,
      titleColor: AppColors.yellow300,
      buttonColor: AppColors.yellow300,
      iconColor: AppColors.white,
    ),
  ];

  static List<SkillLevelData> skillLevelData = [
    SkillLevelData(
      skill: StringConst.SKILLS_1,
      level: 80,
    ),
    SkillLevelData(
      skill: StringConst.SKILLS_2,
      level: 90,
    ),
    SkillLevelData(
      skill: StringConst.SKILLS_3,
      level: 70,
    ),
  ];

  static List<SkillCardData> skillCardData = [
    SkillCardData(
      title: StringConst.SKILLS_1,
      description: StringConst.SKILLS_1_DESC,
      iconData: FontAwesomeIcons.compress,
    ),
    SkillCardData(
        title: "",
        description: "",
        iconData: Icons.pages_outlined), //not being used
    SkillCardData(
      title: StringConst.SKILLS_2,
      description: StringConst.SKILLS_2_DESC,
      iconData: Icons.pages_outlined,
    ),
    SkillCardData(
      title: StringConst.SKILLS_3,
      description: StringConst.SKILLS_3_DESC,
      iconData: FontAwesomeIcons.paintBrush,
    ),
    SkillCardData(
      title: StringConst.SKILLS_4,
      description: StringConst.SKILLS_4_DESC,
      iconData: FontAwesomeIcons.recordVinyl,
    ),
    SkillCardData(
        title: "",
        description: "",
        iconData: Icons.pages_outlined), //not being used
  ];
  static List<StatItemData> statItemsData = [
    StatItemData(value: 75, subtitle: StringConst.CONST_CLIENTS),
    StatItemData(value: 20, subtitle: StringConst.YEARS_OF_EXPERIENCE),
    StatItemData(value: 116, subtitle: StringConst.CONST_PROJECTS),
    StatItemData(value: 18, subtitle: StringConst.OUTSOURCE_CLIENTS),
  ];

  static List<ProjectCategoryData> projectCategories = [
    ProjectCategoryData(
        title: StringConst.ALL, number: allProjects.length, isSelected: true),
    ProjectCategoryData(
        title: StringConst.KONSTRUKSI,
        number: allProjects
            .where((e) => e.category == StringConst.KONSTRUKSI)
            .toList()
            .length),
    ProjectCategoryData(
        title: StringConst.CLEANING_SERVICE,
        number: allProjects
            .where((e) => e.category == StringConst.CLEANING_SERVICE)
            .toList()
            .length),
    ProjectCategoryData(
        title: StringConst.OUTSOURCE,
        number: allProjects
            .where((e) => e.category == StringConst.OUTSOURCE)
            .toList()
            .length),
    ProjectCategoryData(
        title: StringConst.APP_DEV,
        number: allProjects
            .where((e) => e.category == StringConst.APP_DEV)
            .toList()
            .length),
  ];

  static List<String> awards1 = [
    StringConst.AWARDS_1,
    StringConst.AWARDS_2,
    StringConst.AWARDS_3,
    StringConst.AWARDS_4,
    StringConst.AWARDS_5,
  ];
  static List<String> awards2 = [
    StringConst.AWARDS_6,
    StringConst.AWARDS_7,
    StringConst.AWARDS_8,
    StringConst.AWARDS_9,
    StringConst.AWARDS_10,
  ];
  static List<BlogCardData> blogData = [
    BlogCardData(
      category: StringConst.BLOG_CATEGORY_1,
      title: StringConst.BLOG_TITLE_1,
      date: StringConst.BLOG_DATE,
      buttonText: StringConst.READ_MORE,
      imageUrl: ImagePath.BLOG_01,
    ),
    BlogCardData(
      category: StringConst.BLOG_CATEGORY_2,
      title: StringConst.BLOG_TITLE_2,
      date: StringConst.BLOG_DATE,
      buttonText: StringConst.READ_MORE,
      imageUrl: ImagePath.BLOG_02,
    ),
    BlogCardData(
      category: StringConst.BLOG_CATEGORY_3,
      title: StringConst.BLOG_TITLE_3,
      date: StringConst.BLOG_DATE,
      buttonText: StringConst.READ_MORE,
      imageUrl: ImagePath.BLOG_03,
    ),
  ];

  static List<NimBusCardData> nimbusCardData = [
    NimBusCardData(
      title: StringConst.KONTRAKTOR,
      subtitle: StringConst.KONTRAKTOR_DESC,
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
    ),
    NimBusCardData(
      title: StringConst.OUTSOURCE,
      subtitle: StringConst.OUTSOURCE_DESC,
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
      circleBgColor: AppColors.yellow100,
    ),
    NimBusCardData(
      title: StringConst.PERENCANA,
      subtitle: StringConst.PERENCANA_DESC,
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
      leadingIconColor: AppColors.black,
      circleBgColor: AppColors.grey50,
    ),
  ];

  //  PROJECTS RELATED =====================================================

  static List<ConstProjectData> allConstProjects = [
    ConstProjectData(
        title: StringConst.PORTFOLIO_CONST_1_TITLE,
        client: StringConst.PORTFOLIO_CONST_1_CLIENT,
        nilaiProyek: StringConst.PORTFOLIO_CONST_1_VALUE)
  ];

  static List<ProjectData> allProjects = [
    ProjectData(
      title: StringConst.PORTFOLIO_CONST_1_TITLE,
      category: StringConst.KONSTRUKSI,
      projectCoverUrl: ImagePath.PORTFOLIO_1,
      width: 0.5,
      mobileHeight: 0.3,
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_CONST_2_TITLE,
      category: StringConst.KONSTRUKSI,
      projectCoverUrl: ImagePath.PORTFOLIO_2,
      width: 0.225,
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_CONST_3_TITLE,
      category: StringConst.KONSTRUKSI,
      projectCoverUrl: ImagePath.PORTFOLIO_3,
      width: 0.225,
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_CONST_4_TITLE,
      category: StringConst.KONSTRUKSI,
      projectCoverUrl: ImagePath.PORTFOLIO_4,
      width: 0.2375,
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_CONST_5_TITLE,
      category: StringConst.KONSTRUKSI,
      projectCoverUrl: ImagePath.PORTFOLIO_5,
      width: 0.2375,
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_CONST_6_TITLE,
      category: StringConst.KONSTRUKSI,
      projectCoverUrl: ImagePath.PORTFOLIO_6,
      width: 0.475,
      mobileHeight: 0.3,
    ),
  ];
  // static List<ProjectData> branding = [
  //   ProjectData(
  //     title: StringConst.PORTFOLIO_3_TITLE,
  //     category: StringConst.KONSTRUKSI,
  //     projectCoverUrl: ImagePath.PORTFOLIO_3,
  //     width: 0.225,
  //   ),
  // ];
  // static List<ProjectData> packaging = [
  //   ProjectData(
  //     title: StringConst.PORTFOLIO_5_TITLE,
  //     category: StringConst.PERENCANAAN,
  //     projectCoverUrl: ImagePath.PORTFOLIO_5,
  //     width: 0.2375,
  //   ),
  // ];
  // static List<ProjectData> photograhy = [
  //   ProjectData(
  //     title: StringConst.PORTFOLIO_1_TITLE,
  //     category: StringConst.CLEANING_SERVICE,
  //     projectCoverUrl: ImagePath.PORTFOLIO_1,
  //     width: 0.5,
  //     mobileHeight: 0.3,
  //   ),
  //   ProjectData(
  //     title: StringConst.PORTFOLIO_6_TITLE,
  //     category: StringConst.CLEANING_SERVICE,
  //     projectCoverUrl: ImagePath.PORTFOLIO_6,
  //     width: 0.475,
  //     mobileHeight: 0.3,
  //   ),
  // ];
  // static List<ProjectData> webDesign = [
  //   ProjectData(
  //     title: StringConst.PORTFOLIO_2_TITLE,
  //     category: StringConst.APP_DEV,
  //     projectCoverUrl: ImagePath.PORTFOLIO_2,
  //     width: 0.225,
  //   ),
  //   ProjectData(
  //     title: StringConst.PORTFOLIO_4_TITLE,
  //     category: StringConst.APP_DEV,
  //     projectCoverUrl: ImagePath.PORTFOLIO_4,
  //     width: 0.2375,
  //   ),
  //   ProjectData(
  //     title: StringConst.PORTFOLIO_5_TITLE,
  //     category: StringConst.CLEANING_SERVICE,
  //     projectCoverUrl: ImagePath.PORTFOLIO_5,
  //     width: 0.2375,
  //   ),
  // ];
}
