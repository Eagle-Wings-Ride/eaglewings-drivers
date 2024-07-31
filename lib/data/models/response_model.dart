// use this in auth contr
class ResponseModel {
  final String _message;
  final bool _success;
  ResponseModel(this._message, this._success);
  String get message => _message;
  bool get success => _success;
}
