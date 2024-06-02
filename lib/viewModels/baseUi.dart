import 'package:real_estate/utils/imports/generalImports.dart';

class BaseUiViewModel extends ChangeNotifier {
  bool _isBusyState = false;

  bool get isBusyState => _isBusyState;

  void setBusyState(bool value) {
    _isBusyState = value;
    notifyListeners();
  }
}