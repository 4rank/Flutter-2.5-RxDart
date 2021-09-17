import 'package:api_rxdart/models/color_response.dart';
import 'package:api_rxdart/repositories/repository.dart';
import 'package:rxdart/rxdart.dart';

class ColorBloc {
  final Repository _repository = Repository();
  final BehaviorSubject<ColorResponse> _subject =
  BehaviorSubject<ColorResponse>();

  getColor() async {
    ColorResponse response = await _repository.getColor();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ColorResponse> get subject => _subject;

}
final bloc = ColorBloc();