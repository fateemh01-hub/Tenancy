abstract class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String pin = '/pin';
  static const String home = '/home';
  static const String settings = '/settings';
  static const String about = '/about/:section/';
  static const String notFound = '/notfound';

  static String aboutSection(String section) {
    return '/about/$section/';
  }
}
