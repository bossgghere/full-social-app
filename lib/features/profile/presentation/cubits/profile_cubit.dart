import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/profile/domain/repos/profile_repo.dart';
import 'package:social_media_app/features/profile/presentation/cubits/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  final ProfileRepo profileRepo;

  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());

  Future<void> fetchUserProfile(String uid) async {
    try {
      emit(ProfileLoading());
      final user = await profileRepo.fetchUserProfile(uid);

      if (user != null) {
        emit(ProfileLoaded(user));
      } else {
        emit(ProfileError('User Not Found.'));
      }
    } catch (e) {
      emit(ProfileError('Failed to load profile.'));
    }
  }

  Future<void> updateProfile({
    required String uid,
    String? newBio,
  }) async {
    emit(ProfileLoading());
    try {
      final currentUser = await profileRepo.fetchUserProfile(uid);
      if (currentUser == null) {
        emit(ProfileError('Failed to fetch user.'));
        return;
      }

      final updatedProfile = currentUser.copyWith(
        newBio: newBio ?? currentUser.bio,
      );

      await profileRepo.updateProfile(updatedProfile);

      await fetchUserProfile(uid);
    } catch (e) {
      emit(ProfileError('Failed to update profile.'));
    }
  }
}
