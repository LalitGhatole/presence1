import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onProfileTap;

  const CommonAppBar({Key? key, required this.onProfileTap}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/presence_logo.png',
            height: 30,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 5),
          const Text(
            'Presence',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
      actions: [
        GestureDetector(
          onTap: onProfileTap,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ),
        ),
      ],
    );
  }
}
