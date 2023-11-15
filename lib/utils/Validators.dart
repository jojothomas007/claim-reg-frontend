class Validators<T> {
  String? checkFieldEmpty(T? fieldContent) {
    //<-- add string? as a return type
    if (fieldContent == null) {
      return 'Field cannot be empty';
    }
    return null;
  }
}
