/* all the posssible states during auth */

import 'package:social_media_app/features/auth/domain/entities/app_user.dart';

abstract class AuthStates {}

//initial state
class AuthInitial extends AuthStates {}

//loading state 
class AuthLoading extends AuthStates {}

//authenticated state
class Authenticated extends AuthStates {
  AppUser user;
  Authenticated(this.user);
}

//unauthticated state
class Unauthenticated extends AuthStates {}


//error state
class AuthError extends AuthStates {
  final String message;

  AuthError(this.message);
  
}

//final state
class AuthFinal extends AuthStates{

}