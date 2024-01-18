import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';

abstract class AuthRepository {
  Future<void> signInWith({required String email, required String password});

  Future<void> signUpWith({required String email, required String password});

  Future<void> signOut();

  Stream<AppUser?> onAuthStateChanged();

  AppUser? get currentUser;
}
