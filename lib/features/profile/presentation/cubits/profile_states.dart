import 'package:social_media_app/features/profile/domain/entities/profile_user.dart';

abstract class ProfileStates {}

//initial
class ProfileInitial extends ProfileStates {}

//loading
class ProfileLoading extends ProfileStates {}

//loaded
class ProfileLoaded extends ProfileStates {
  final ProfileUser profileUser;
  ProfileLoaded(this.profileUser);
}

//eroor
class ProfileError extends ProfileStates {
  final String message;

  ProfileError(this.message);
}
