// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signInControllerHash() => r'aeeded124174d378acc6a0188f04607811367526';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$SignInController
    extends BuildlessAutoDisposeNotifier<EmailPasswordSignInState> {
  late final EmailPasswordSignInFormType formType;

  EmailPasswordSignInState build(
    EmailPasswordSignInFormType formType,
  );
}

/// See also [SignInController].
@ProviderFor(SignInController)
const signInControllerProvider = SignInControllerFamily();

/// See also [SignInController].
class SignInControllerFamily extends Family<EmailPasswordSignInState> {
  /// See also [SignInController].
  const SignInControllerFamily();

  /// See also [SignInController].
  SignInControllerProvider call(
    EmailPasswordSignInFormType formType,
  ) {
    return SignInControllerProvider(
      formType,
    );
  }

  @override
  SignInControllerProvider getProviderOverride(
    covariant SignInControllerProvider provider,
  ) {
    return call(
      provider.formType,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'signInControllerProvider';
}

/// See also [SignInController].
class SignInControllerProvider extends AutoDisposeNotifierProviderImpl<
    SignInController, EmailPasswordSignInState> {
  /// See also [SignInController].
  SignInControllerProvider(
    EmailPasswordSignInFormType formType,
  ) : this._internal(
          () => SignInController()..formType = formType,
          from: signInControllerProvider,
          name: r'signInControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$signInControllerHash,
          dependencies: SignInControllerFamily._dependencies,
          allTransitiveDependencies:
              SignInControllerFamily._allTransitiveDependencies,
          formType: formType,
        );

  SignInControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.formType,
  }) : super.internal();

  final EmailPasswordSignInFormType formType;

  @override
  EmailPasswordSignInState runNotifierBuild(
    covariant SignInController notifier,
  ) {
    return notifier.build(
      formType,
    );
  }

  @override
  Override overrideWith(SignInController Function() create) {
    return ProviderOverride(
      origin: this,
      override: SignInControllerProvider._internal(
        () => create()..formType = formType,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        formType: formType,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<SignInController, EmailPasswordSignInState>
      createElement() {
    return _SignInControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SignInControllerProvider && other.formType == formType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, formType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SignInControllerRef
    on AutoDisposeNotifierProviderRef<EmailPasswordSignInState> {
  /// The parameter `formType` of this provider.
  EmailPasswordSignInFormType get formType;
}

class _SignInControllerProviderElement
    extends AutoDisposeNotifierProviderElement<SignInController,
        EmailPasswordSignInState> with SignInControllerRef {
  _SignInControllerProviderElement(super.provider);

  @override
  EmailPasswordSignInFormType get formType =>
      (origin as SignInControllerProvider).formType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
