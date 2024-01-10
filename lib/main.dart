import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:morningstar_library/core/helper/helper.dart';
import 'package:morningstar_library/cubit/cubit.dart';
import 'package:morningstar_library/data/data.dart';
import 'package:morningstar_library/routes/routes.dart';

void main() {
  Modular.setInitialRoute('/onboarding');
  runApp(ModularApp(module: AppRoute(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationCubit(),
        ),
        BlocProvider(
          create: (context) => BookCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => CheckoutCubit(),
        ),
      ],
      child: GlobalLoaderOverlay(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Morningstar Library',
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child ?? Container(),
            );
          },
          theme: myTheme(),
          routerConfig: Modular.routerConfig,
        ),
      ),
    );
  }
}

void checkStatusUser() async {
  String? token = await StoreKeyValue().getToken();

  if (token == null) {
    Modular.to.navigate(Routes.login);
  } else {
    Modular.to.navigate(Routes.home);
  }
}
