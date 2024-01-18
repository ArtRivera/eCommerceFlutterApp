import 'dart:async';

import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';
import 'package:ecommerce_app/src/features/authentication/domain/auth_repository.dart';
import 'package:ecommerce_app/src/utils/in_memory_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fake_auth_repository.g.dart';

class FakeAuthRepository implements AuthRepository {
  final _authState = InMemoryStore<AppUser?>(null);

  @override
  // TODO: implement currentUser
  AppUser? get currentUser => _authState.value;

  @override
  Future<void> signInWith(
      {required String email, required String password}) async {
    // await Future.delayed(const Duration(seconds: 2));
    // throw Exception('Sign in failed');
    if (currentUser == null) {
      _createUser(email: email, password: password);
    }
    return Future.value();
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(seconds: 1));
    _authState.update = null;
    return Future.value();
  }

  @override
  Future<void> signUpWith({required String email, required String password}) {
    if (currentUser == null) {
      _createUser(email: email, password: password);
    }
    return Future.value();
  }

  @override
  Stream<AppUser?> onAuthStateChanged() {
    return _authState.stream;
  }

  void _createUser({required String email, required String password}) {
    final user = AppUser(
      email: email,
      uid: email.split('').reversed.join(''),
    );
    _authState.update = user;
  }

  void dispose() {
    _authState.close();
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final authRepository = FakeAuthRepository();

  // * Keep the authRepository alive for 5 seconds
  final link = ref.keepAlive();
  Timer(const Duration(seconds: 5), () {
    link.close();
  });
  ref.onDispose(() {
    authRepository.dispose();
  });
  return authRepository;
}

@riverpod
Stream<AppUser?> authState(AuthStateRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.onAuthStateChanged();
}
