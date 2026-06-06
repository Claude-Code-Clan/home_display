import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dashboard_grid_event.dart';
part 'dashboard_grid_state.dart';

class DashboardGridBloc extends Bloc<DashboardGridEvent, DashboardGridState> {
  DashboardGridBloc() : super(DashboardGridInitial()) {
    on<DashboardGridEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
