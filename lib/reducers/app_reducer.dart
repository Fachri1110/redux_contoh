import 'package:redux_contoh/models/models.dart';
import 'package:redux_contoh/reducers/color_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    boxColor: colorReducer(state.boxColor, action),
  );
}