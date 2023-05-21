import 'package:flutter/material.dart';
import 'package:pomodoro_timer/core_utils/database/app_database.dart';
import 'package:pomodoro_timer/core_utils/preferences/app_preferences.dart';
import 'package:pomodoro_timer/main/main_store.dart';
import 'package:pomodoro_timer/main/profile/profile_repository.dart';
import 'package:pomodoro_timer/main/settings/settings_repository.dart';
import 'package:pomodoro_timer/main/settings/settings_store.dart';
import 'package:pomodoro_timer/main/settings/usecases/get_settings_usecase.dart';
import 'package:pomodoro_timer/main/settings/usecases/update_settings_usecase.dart';
import 'package:pomodoro_timer/main/timer/timer_store.dart';
import 'package:pomodoro_timer/main/timer/usecases/clear_timer_sessions_usecase.dart';
import 'package:pomodoro_timer/main/timer/usecases/get_timer_session_usecase.dart';
import 'package:pomodoro_timer/main/timer/usecases/save_timer_session_usecase.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class BaseDependencies extends StatelessWidget {
  final Widget _child;

  const BaseDependencies({
    Key? key,
    required Widget child,
  })  : _child = child,
        super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ..._buildBaseProviders(),
          ..._buildAuthProviders(),
          ..._buildBaseRepositoriesProviders(),
          ..._buildBaseUseCasesProviders(),
          ..._buildBaseStoresProviders(),
        ],
        child: _child,
      );

  List<SingleChildWidget> _buildBaseProviders() => [
        Provider(create: (context) => AppPreferences()),
        Provider(create: (context) => AppDatabase.instance.timerDao),
      ];

  List<SingleChildWidget> _buildAuthProviders() => [];

  List<SingleChildWidget> _buildBaseRepositoriesProviders() => [
        Provider<ProfileRepository>(
          create: (context) => ProfileRepository(preferences: context.read()),
        ),
        Provider<SettingsRepository>(
          create: (context) => SettingsRepository(preferences: context.read()),
        ),
      ];

  List<SingleChildWidget> _buildBaseUseCasesProviders() => [
        Provider<UpdateSettingsUseCase>(
          create: (context) => UpdateSettingsUseCase(repository: context.read()),
        ),
        Provider<GetSettingsUseCase>(
          create: (context) => GetSettingsUseCase(repository: context.read()),
        ),
        Provider<GetTimerSessionUsecase>(
          create: (context) => GetTimerSessionUsecase(timerDao: context.read()),
        ),
        Provider<SaveTimerSessionUsecase>(
          create: (context) => SaveTimerSessionUsecase(timerDao: context.read()),
        ),
        Provider<ClearTimerSessionUsecase>(
          create: (context) => ClearTimerSessionUsecase(timerDao: context.read()),
        ),
      ];

  List<SingleChildWidget> _buildBaseStoresProviders() => [
        Provider<MainStore>(
          create: (context) => MainStore(
            preferences: context.read(),
          )..load(),
          dispose: (context, value) => value.dispose(),
        ),
        Provider<TimerStore>(
          create: (context) => TimerStore(
            preferences: context.read(),
            getTimerSessionUsecase: context.read(),
            saveTimerSessionUsecase: context.read(),
            clearTimerSessionUsecase: context.read(),
          )..load(),
          dispose: (context, value) => value.dispose(),
        ),
        Provider<SettingsStore>(
          create: (context) => SettingsStore(
            preferences: context.read(),
            updateSettingsUseCase: context.read(),
            getSettingsUseCase: context.read(),
          )..load(),
          dispose: (context, value) => value.dispose(),
        ),
      ];
}
