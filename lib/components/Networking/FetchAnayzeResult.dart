

class AnalyzeAnswer {
  final List<Teachers> result;
  AnalyzeAnswer._({ this.result});
  factory AnalyzeAnswer.fromJson(Map jsonMap) {
    return new AnalyzeAnswer._(
        result : (jsonMap['result'] as List).map((i) => Result.fromJson(i)).toList()
    );
  }
}
class Result{
  final String create_date;
  final String modify_date;
  final String user;
  final String nana;
  final String ;
  final String ;
  final String ;
  final String ;
  final String ;
  final String ;
  final String ;
  final String ;
  final String ;
  final String ;
  final String ;
  final List<String> anatomy;
  Result._({this.anatomy});
  factory Result.fromJson(Map jsonMap) {
    return new Result._(

          anatomy:  (jsonMap['cities'].cast<String>())

    );
  }
}

