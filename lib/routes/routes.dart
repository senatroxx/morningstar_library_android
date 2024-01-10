import 'package:flutter_modular/flutter_modular.dart';
import 'package:morningstar_library/ui/page/page.dart';

class Routes {
  static const onboarding = "/onboarding";
  static const home = "/";
  static const profile = "/profile";
  static const editProfile = "/profile/edit";
  static const search = "/search";
  static const favorite = "/favorite";
  static const login = "/login";
  static const register = "/register";
  static const bookDetail = "/book/detail/";
  static const cart = "/cart";
  static const checkout = "/checkout";
  static const shipping = "/shipping";
}

class AppRoute extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    super.routes(r);
    r.child(Routes.onboarding, child: (_) => const OnboardingPage());
    r.child(Routes.home, child: (_) => const MainPage());
    r.child(Routes.profile,
        child: (_) => const ProfilePage(), transition: TransitionType.downToUp);
    r.child(Routes.editProfile, child: (_) => const EditProfilePage());
    r.child(Routes.search,
        child: (_) => const SearchPage(), transition: TransitionType.downToUp);
    r.child(Routes.favorite, child: (_) => const BookFavoritePage());
    r.child(Routes.register, child: (_) => const RegisterPage());
    r.child(Routes.login, child: (_) => const LoginPage());
    r.child("${Routes.bookDetail}:slug",
        child: (_) => BookDetailPage(slug: r.args.params['slug']));
    r.child(Routes.cart, child: (_) => const CartPage());
    r.child(Routes.checkout, child: (_) => const CheckoutPage());
    r.child(Routes.shipping, child: (_) => const ShippingPage());
  }
}
