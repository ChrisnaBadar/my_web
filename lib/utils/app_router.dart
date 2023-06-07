import 'package:my_web/pages/portofolio/portofolio_page.dart';

import '../pages/home/homepage.dart';
import '../pages/mamber_page/member_page.dart';

class AppRouter {
  final appRoute = {
    '/': (context) => const Homepage(),
    '/portofolioPage': (context) => const PortofolioPage(),
    '/memberPage': (context) => const MemberPage()
  };
}
