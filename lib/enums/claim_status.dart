enum ClaimStatus {
  // @JsonValue("created")
  created,
  // @JsonValue("submitted")
  submitted,
  // @JsonValue("approved")
  approved;

  @override
  String toString() => name;
}
