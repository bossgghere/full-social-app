/*

Auth-Repo:  Outlines the possible auth operations for this app 

only outline ....not actually implememnting the mentods 

*/

import 'package:social_media_app/features/auth/domain/entities/app_user.dart';

abstract class AuthRepo {
  Future<AppUser?> loginWithEmailPassword(String email, String password);
  Future<AppUser?> registerWithEmailPassword(
      String name, String email, String password);
  Future<AppUser?> getCurrentUser();
  Future<void> logout();


}
