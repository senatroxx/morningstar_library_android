import 'package:flutter_modular/flutter_modular.dart';
import 'package:morningstar_library/ui/page/page.dart';

class Routes {
  static const home = "/";
  static const profile = "/profile";
  static const editProfile = "/profile/edit";
  static const search = "/search";
  static const favorite = "/favorite";
  static const login = "/login";
  static const register = "/register";
  static const bookDetail = "/book/detail";
}

class AppRoute extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    super.routes(r);
    r.child(Routes.home, child: (context) => const MainPage());
    r.child(
      Routes.profile,
      child: (context) => const ProfilePage(),
      transition: TransitionType.downToUp,
    );
    r.child(Routes.editProfile, child: (context) => const EditProfilePage());
    r.child(
      Routes.search,
      child: (context) => const SearchPage(),
      transition: TransitionType.downToUp,
    );
    r.child(Routes.favorite, child: (context) => const BookFavoritePage());
    r.child(Routes.register, child: (context) => const RegisterPage());
    r.child(Routes.login, child: (context) => const LoginPage());
    r.child(
      Routes.bookDetail,
      child: (context) => const BookDetailPage(),
    );
  }
}
