import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/auth/domain/entities/app_user.dart';
import 'package:social_media_app/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:social_media_app/features/profile/presentation/component/Bio_box.dart';
import 'package:social_media_app/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:social_media_app/features/profile/presentation/cubits/profile_states.dart';
import 'package:social_media_app/features/profile/presentation/pages/edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  final String uid;
  const ProfilePage({super.key, required this.uid});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final authCubit = context.read<AuthCubit>();
  late final profileCubit = context.read<ProfileCubit>();

  late AppUser? currentUser = authCubit.currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //load user profile
    profileCubit.fetchUserProfile(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        //loaded
        if (state is ProfileLoaded) {
          //get the loaded user
          final user = state.profileUser;

          return Scaffold(
            appBar: AppBar(
              title: Text(user.name),
              foregroundColor: Theme.of(context).colorScheme.primary,
              actions: [
                IconButton(onPressed:() => Navigator.push(context, MaterialPageRoute(builder:(context) => EditProfilePage(user: user,),)), icon: Icon(Icons.settings))
              ],
            ),
            body: Column(
              children: [
                Text(user.email , style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                SizedBox(height: 25,),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  height: 120,
                  width: 120,
                  padding: EdgeInsets.all(25),
                  child: Center(
                    child: Icon(Icons.person , size: 72,color: Theme.of(context).colorScheme.primary,),
                  ),
                ),
                SizedBox(height: 25,),
                //bio
                Padding(
                  padding: const EdgeInsets.only(left:25.0),
                  child: Row(
                    children: [
                      Text('Bio'),
                    ],
                  ),
                ),
                SizedBox(height: 10,),  
                BioBox(text: user.bio),
                //post
                Padding(
                  padding: const EdgeInsets.only(left:25.0,top: 25),
                  child: Row(
                    children: [
                      Text('Posts'),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (state is ProfileLoading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return const Center(
            child: Text("No Proflie Found"),
          );
        }
      },
    );
  }
}
