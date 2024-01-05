part of '../page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user = const User();

  @override
  void initState() {
    super.initState();
    StoreKeyValue().getUser().then((value) {
      setState(() {
        user = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    void _logout() {
      context.read<AuthenticationCubit>().logout();
      Modular.to.navigate(Routes.login);
    }

    return Scaffold(
      appBar: const MyAppBar(
        title: "Profile",
        showAction: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile.png'),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                user!.name ?? "",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: TW3Colors.neutral.shade700,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                user!.email ?? "",
                style: TextStyle(
                  fontSize: 16,
                  color: TW3Colors.neutral.shade700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              ListTile(
                title: const Text("Edit Profile"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Modular.to.pushNamed(Routes.editProfile);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                title: const Text("Change Password"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                title: const Text("Logout"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  _logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
