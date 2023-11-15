enum ClaimType {
  internet("Internet");

  final String value;

  const ClaimType(this.value);

  @override
  String toString() => value;
}
