import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_contoh/models/models.dart';
import 'package:redux_contoh/actions/actions.dart';
import 'package:redux_contoh/my_slider.dart';

class ColorController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel vm) {
        return Column(
          children: <Widget>[
            MySlider(
              value: vm.boxColor.red,
              label: 'R',
              onChanged: (val) {
                vm.onColorChanged(vm.boxColor.copyWith(red: val));
              },
            ),
            MySlider(
              value: vm.boxColor.green,
              label: 'G',
              onChanged: (val) {
                vm.onColorChanged(vm.boxColor.copyWith(green: val));
              },
            ),
            MySlider(
              value: vm.boxColor.blue,
              label: 'B',
              onChanged: (val) {
                vm.onColorChanged(vm.boxColor.copyWith(blue: val));
              },
            ),
          ],
        );
      },
    );
  }
}

class _ViewModel {
  final MyBoxColor boxColor;
  final Function(MyBoxColor) onColorChanged;

  _ViewModel({required this.boxColor, required this.onColorChanged});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      boxColor: store.state.boxColor,
      onColorChanged: (MyBoxColor boxColor) {
        store.dispatch(SetColor(boxColor));
      },
    );
  }
}