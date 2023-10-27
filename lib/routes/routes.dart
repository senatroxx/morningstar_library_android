import 'package:flutter_modular/flutter_modular.dart';
import 'package:morningstar_library/ui/page/auth/register_page.dart';
import 'package:morningstar_library/ui/page/page.dart';

class Routes {
  static const home = "/";
  static const profile = "/profile";
  static const editProfile = "/profile/edit";
  static const search = "/search";
  static const bookmark = "/bookmark";
  static const login = "/login";
  static const register = "/register";
}

class AppRoute extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    super.routes(r);
    r.child(Routes.home,
        child: (context) => const HomePage(),
        transition: TransitionType.noTransition);
    r.child(Routes.profile,
        child: (context) => const ProfilePage(),
        transition: TransitionType.noTransition);
    r.child(Routes.editProfile,
        child: (context) => const EditProfilePage(),
        transition: TransitionType.noTransition);
    r.child(Routes.search,
        child: (context) => const SearchPage(),
        transition: TransitionType.noTransition);
    r.child(Routes.bookmark,
        child: (context) => const BookmarkPage(),
        transition: TransitionType.noTransition);
    r.child(Routes.register,
        child: (context) => const RegisterPage(),
        transition: TransitionType.noTransition);
    // r.child(Routes.bookmark,
    //     child: (context) => const BookmarkPage(),
    //     transition: TransitionType.noTransition);
  }
}
