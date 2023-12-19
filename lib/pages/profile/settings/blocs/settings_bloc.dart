import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/profile/settings/blocs/settings_event.dart';
import 'package:ulearning_app/pages/profile/settings/blocs/settings_states.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsStates> {
  SettingsBloc() : super(SettingsStates());
}
