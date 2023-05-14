import 'package:flutter/widgets.dart';
import '../main.dart';
import '../utils/login_util/prefs.dart';
class newsmarkProvider extends ChangeNotifier {
  final List _newsMark = Prefs.newsMarkList;
  final List<bool> _isnewsmarked = [];
  final Map<String, bool> _isnewsMarkerMap = Map();

  int markLength = 0;

  List<bool> get isnewsmarked => _isnewsmarked;
  Map<String, bool> get isnewsMarkerMap => _isnewsMarkerMap;

  List get newsMark => _newsMark;

  void addTonewsMap(String news) {
    if (_isnewsMarkerMap[news] == null) _isnewsMarkerMap[news] = false;
  }

  void addTonewsmark(String news) {
    if (_isnewsMarkerMap[news] == true) {
      _newsMark.add(news);
      markLength++;
    } else {
      _newsMark.removeAt(markLength - 1);
      markLength--;
    }

    box.write('我的标记', newsMark);
    notifyListeners();
  }

  void tonewsmark(String news) {
    _isnewsMarkerMap[news] = !_isnewsMarkerMap[news]!;

    notifyListeners();
  }
}
