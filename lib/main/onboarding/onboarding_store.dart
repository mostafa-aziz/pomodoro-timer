import 'package:logging/logging.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pomodoro_timer/core_utils/base_store.dart';
import 'package:pomodoro_timer/core_utils/preferences/app_preferences.dart';
import 'package:pomodoro_timer/main/onboarding/onboarding_component.dart';

part 'onboarding_store.g.dart';

class OnboardingStore = OnboardingStoreBase with _$OnboardingStore;

const String KEY_CURRENT_ONBOARDING_VERSION = 'onboarding_version_shown';
const int ONBOARDING_VERSION = 2;

abstract class OnboardingStoreBase extends BaseStore with Store {
  final AppPreferences _preferences;

  @observable
  bool hasGrantedLocationPermissions = false;

  @observable
  bool hasGrantedNotificationPermissions = false;

  OnboardingStoreBase({
    required AppPreferences preferences,
  }) : _preferences = preferences;

  @action
  @override
  Future<void> load() async {
    hasGrantedLocationPermissions = await Permission.location.isGranted;
    hasGrantedNotificationPermissions = await Permission.notification.isGranted;
  }

  @action
  Future<void> onOnboardingFinished() async => _preferences.put(KEY_CURRENT_ONBOARDING_VERSION, ONBOARDING_VERSION);

  @action
  Future<void> requestNotificationPermissions() async {
    try {
      await Permission.notification.request();
    } catch (cause, stacktrace) {
      Logger.root.info(cause.toString(), cause, stacktrace);
      error = cause;
    }
  }

  Future<void> onboardingPermissionsHandler(OnboardingStepState state) async {
    try {
      switch (state) {
        case OnboardingStepState.LOCATION:
          break;
        case OnboardingStepState.NOTIFICATIONS:
          await requestNotificationPermissions();
          break;
        default:
          break;
      }
    } catch (cause, stacktrace) {
      Logger.root.info(cause.toString(), cause, stacktrace);
      error = cause;
    }
  }
}
