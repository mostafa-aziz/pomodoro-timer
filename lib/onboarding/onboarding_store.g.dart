// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnboardingStore on OnboardingStoreBase, Store {
  late final _$hasGrantedNotificationPermissionsAtom = Atom(
      name: 'OnboardingStoreBase.hasGrantedNotificationPermissions',
      context: context);

  @override
  bool get hasGrantedNotificationPermissions {
    _$hasGrantedNotificationPermissionsAtom.reportRead();
    return super.hasGrantedNotificationPermissions;
  }

  @override
  set hasGrantedNotificationPermissions(bool value) {
    _$hasGrantedNotificationPermissionsAtom
        .reportWrite(value, super.hasGrantedNotificationPermissions, () {
      super.hasGrantedNotificationPermissions = value;
    });
  }

  late final _$loadAsyncAction =
      AsyncAction('OnboardingStoreBase.load', context: context);

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  late final _$onOnboardingFinishedAsyncAction =
      AsyncAction('OnboardingStoreBase.onOnboardingFinished', context: context);

  @override
  Future<void> onOnboardingFinished() {
    return _$onOnboardingFinishedAsyncAction
        .run(() => super.onOnboardingFinished());
  }

  late final _$requestNotificationPermissionsAsyncAction = AsyncAction(
      'OnboardingStoreBase.requestNotificationPermissions',
      context: context);

  @override
  Future<void> requestNotificationPermissions() {
    return _$requestNotificationPermissionsAsyncAction
        .run(() => super.requestNotificationPermissions());
  }

  @override
  String toString() {
    return '''
hasGrantedNotificationPermissions: ${hasGrantedNotificationPermissions}
    ''';
  }
}
