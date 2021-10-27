class GeneralException implements Exception {
  final String msg;
  const GeneralException(this.msg);

  @override
  String toString() {
    return msg;
  }
}
