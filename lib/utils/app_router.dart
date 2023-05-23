import 'package:my_web/pages/portofolio/portofolio_page.dart';

import '../pages/home/homepage.dart';

class AppRouter {
  final appRoute = {
    '/': (context) => const Homepage(),
    '/portofolioPage': (context) => const PortofolioPage()
  };
}
