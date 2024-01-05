part of 'database.dart';

class StoreKeyValue {
  // * ACCESS TOKEN
  Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("TOKEN", token);
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("TOKEN");
  }

  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  // * USER
  Future<void> setUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("USER", jsonEncode(user.toJson()));
  }

  Future<User?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user = prefs.getString("USER");
    if (user == null) return null;
    return User.fromJson(jsonDecode(user));
  }

  Future<void> deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("USER");
  }

  // * Membership
  Future<void> setMembership(Membership membership) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("MEMBERSHIP", jsonEncode(membership.toJson()));
  }

  Future<Membership?> getMembership() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? membership = prefs.getString("MEMBERSHIP");
    if (membership == null) return null;
    return Membership.fromJson(jsonDecode(membership));
  }

  Future<void> deleteMembership() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("MEMBERSHIP");
  }

  // * CART
  Future<void> addCart(Book cart) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cartString = prefs.getString("CART");
    if (cartString == null) {
      prefs.setString("CART", jsonEncode([cart.toJson()]));
    } else {
      List<Book> carts = (jsonDecode(cartString) as List)
          .map((e) => Book.fromJson(e))
          .toList();
      carts.add(cart);
      prefs.setString(
          "CART", jsonEncode(carts.map((e) => e.toJson()).toList()));
    }
  }

  Future<List<Book>?> getCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cart = prefs.getString("CART");
    if (cart == null) return null;
    return (jsonDecode(cart) as List).map((e) => Book.fromJson(e)).toList();
  }

  Future<void> deleteCartBySlug(String slug) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cartString = prefs.getString("CART");
    if (cartString == null) return;
    List<Book> carts =
        (jsonDecode(cartString) as List).map((e) => Book.fromJson(e)).toList();
    carts.removeWhere((element) => element.slug == slug);
    prefs.setString("CART", jsonEncode(carts.map((e) => e.toJson()).toList()));
  }

  Future<void> deleteCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  // * Checkout
  Future<void> setCheckout(CheckoutRequest checkout) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("CHECKOUT", jsonEncode(checkout.toJson()));
  }

  Future<CheckoutRequest?> getCheckout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? checkout = prefs.getString("CHECKOUT");
    if (checkout == null) return null;
    return CheckoutRequest.fromJson(jsonDecode(checkout));
  }

  Future<void> deleteCheckout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("CHECKOUT");
  }

  // * Verify Email Register
  // Future<void> setVerify(RequestRegister data) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('VERIFY_REGISTER', data.toJson());
  // }

  // Future<RequestRegister?> getVerify() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? data = prefs.getString("VERIFY_REGISTER");

  //   if (data == null) return null;
  //   return RequestRegister.fromJson(data);
  // }

  // Future<void> deleteVerify() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.clear();
  // }
}
