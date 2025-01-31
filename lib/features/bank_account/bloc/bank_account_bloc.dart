import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

class BankAccountBloc extends Bloc<AppEvent, AppState> {
  BankAccountBloc() : super(Start()) {
    on<Update>(_update);
  }
  static BankAccountBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);

  bool canEdit = false;

  changeEditStatus() {
    canEdit = !canEdit;
    add(Update());
  }

  _update(AppEvent event, Emitter<AppState> emit) async => emit(Start());
}