import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:uc_ebook_store/pages/about_app.dart';
import 'package:uc_ebook_store/pages/login_screen.dart';
import 'package:uc_ebook_store/provider/auth_provider.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Account'),
        leading: const SizedBox.shrink(),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Text(
            'Done',
            style: TextStyle(color: CupertinoColors.activeBlue),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              _buildProfileSection(),
              const SizedBox(height: 24),
              _buildAccountManagementSection(context),
              const Spacer(),
              _buildSignOutButton(context),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CupertinoColors.darkBackgroundGray,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOH2aZnIHWjMQj2lQUOWIL2f4Hljgab0ecZQ&s',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gojo',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'example@gmail.com',
                style: TextStyle(
                  fontSize: 14,
                  color: CupertinoColors.systemGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAccountManagementSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Account Management',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.systemGrey,
            ),
          ),
        ),
        const SizedBox(height: 8),
        CupertinoListTile(
          leading: const Icon(CupertinoIcons.person),
          title: const Text('Edit Profile'),
          trailing: const Icon(CupertinoIcons.chevron_forward),
          onTap: () => _navigateToEditProfile(context),
        ),
        CupertinoListTile(
          leading: const Icon(CupertinoIcons.info),
          title: const Text('About'),
          trailing: const Icon(CupertinoIcons.chevron_forward),
          onTap: () => _navigateToAboutScreen(context),
        ),
      ],
    );
  }

  void _navigateToEditProfile(BuildContext context) {}

  void _navigateToAboutScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const AboutScreen(),
      ),
    );
  }

  Widget _buildSignOutButton(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.systemRed,
          borderRadius: BorderRadius.circular(12),
        ),
        child: CupertinoButton(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          color: CupertinoColors.systemRed,
          child: const Text('Sign Out'),
          onPressed: () => _showSignOutConfirmation(context),
        ),
      ),
    );
  }

  void _showSignOutConfirmation(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: const Text('Sign Out'),
            onPressed: () {
              _performSignOut(context);
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _performSignOut(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    try {
      await authProvider.logout();

      Navigator.pushReplacementNamed(context, '/login');
    } catch (error) {
      print('Error during sign out: $error');
    }
  }
}

class CupertinoListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget trailing;
  final VoidCallback onTap;

  const CupertinoListTile({
    required this.leading,
    required this.title,
    required this.trailing,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            leading,
            const SizedBox(width: 12),
            Expanded(child: title),
            trailing,
          ],
        ),
      ),
    );
  }
}
