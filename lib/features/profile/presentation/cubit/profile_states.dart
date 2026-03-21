import 'package:ecommerce/features/auth/domain/entities/user.dart';

abstract class ProfileStates{}

class ProfileInitial extends ProfileStates{}

class ProfileLoading extends ProfileStates{}
class ProfileSuccess extends ProfileStates{
  final User user;
  ProfileSuccess(this.user);
}
