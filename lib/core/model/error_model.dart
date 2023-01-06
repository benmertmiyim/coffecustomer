class ErrorModel {
  final String message;
  final String code;
  late DateTime dateTime;

  ErrorModel({
    required this.message,
    required this.code,
  }) {
    dateTime = DateTime.now();
  }
}
