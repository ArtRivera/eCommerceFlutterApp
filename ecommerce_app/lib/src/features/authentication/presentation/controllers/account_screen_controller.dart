import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_screen_controller.g.dart';

@riverpod
class AccountScreenController extends _$AccountScreenController {
  @override
  FutureOr build() {
    return null;
  }

  void signOut({VoidCallback? onSignOut}) async {
    //   try {
    //     state = const AsyncValue.loading();
    //     await ref.read(authRepositoryProvider).signOut();
    //     state = const AsyncValue.data(null);
    //     if (onSignOut != null) {
    //       onSignOut();
    //     }
    //   } catch (e, stackTrace) {
    //     state = AsyncValue.error(e, stackTrace);
    //   }
    // }

    // * This is the same as the commented code above
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => ref.read(authRepositoryProvider).signOut());
    if (onSignOut != null) {
      onSignOut();
    }
  }
}
