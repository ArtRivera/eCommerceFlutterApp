import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/sign_in/email_password_sign_in_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_controller.g.dart';

@riverpod
class SignInController extends _$SignInController {
  @override
  EmailPasswordSignInState build(EmailPasswordSignInFormType formType) {
    return EmailPasswordSignInState(formType: formType);
  }

  Future<bool> submit({required String email, required String password}) async {
    state = state.copyWith(value: const AsyncValue.loading());

    final value = await AsyncValue.guard(
        () => _authenticate(email: email, password: password));

    state = state.copyWith(value: value);

    final isSubmitSuccess = value.hasError == false;

    return isSubmitSuccess;
  }

  Future<void> _authenticate(
      {required String email, required String password}) {
    final authRepository = ref.watch(authRepositoryProvider);
    if (state.formType == EmailPasswordSignInFormType.signIn) {
      return authRepository.signInWith(email: email, password: password);
    } else {
      return authRepository.signUpWith(email: email, password: password);
    }
  }

  void updateFormType(EmailPasswordSignInFormType formType) {
    state = state.copyWith(formType: formType);
  }
}
