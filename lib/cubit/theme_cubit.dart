import 'package:flutter_bloc/flutter_bloc.dart';

enum ThemeModeStatus { light, dark }

class ThemeCubit extends Cubit<ThemeModeStatus> {
  ThemeCubit() : super(ThemeModeStatus.dark);

  void setTheme(ThemeModeStatus mode) => emit(mode);
}
