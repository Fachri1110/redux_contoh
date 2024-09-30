import 'package:redux/redux.dart';
import 'package:redux_contoh/actions/actions.dart';
import 'package:redux_contoh/models/models.dart';

final colorReducer = TypedReducer<MyBoxColor, SetColor>(_setColorReducer);

MyBoxColor _setColorReducer(MyBoxColor state, SetColor action) {
  return action.boxColor;
}