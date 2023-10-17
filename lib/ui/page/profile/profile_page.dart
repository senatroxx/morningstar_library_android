part of '../page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "Profile",
      showAction: false,
      showBottomNav: false,
      child: SingleChildScrollView(
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
              'Jane Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: TW3Colors.neutral.shade700,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'janedoe@gmail.com',
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
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
