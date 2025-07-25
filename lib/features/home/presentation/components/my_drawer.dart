import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:social_media_app/features/home/presentation/components/my_drawer_tile.dart';
import 'package:social_media_app/features/profile/presentation/pages/profile_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Icon(
                  Icons.person,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Divider(
                color: Theme.of(context).colorScheme.secondary,
              ),
              MyDrawerTile(
                titleName: "H O M E",
                icon: Icons.home,
                onTap: () => Navigator.of(context).pop(),
              ),
              MyDrawerTile(
                titleName: "P R O F I L E",
                icon: Icons.person,
                onTap: () {
                  Navigator.of(context).pop();

                  final user = context.read<AuthCubit>().currentUser;
                  String? uid = user!.uid;

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(
                          uid: uid,
                        ),
                      ));
                },
              ),
              MyDrawerTile(
                titleName: "S E A R C H",
                icon: Icons.search,
                onTap: () {},
              ),
              MyDrawerTile(
                titleName: "S E T T I N G S",
                icon: Icons.settings,
                onTap: () {},
              ),
              Spacer(),
              MyDrawerTile(
                titleName: "L O G O U T",
                icon: Icons.logout,
                onTap: () {
                  context.read<AuthCubit>().logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
