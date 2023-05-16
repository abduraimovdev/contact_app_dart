class Contact {
  String id;
  String name;
  String email;
  String number;

  Contact(
      {required this.id,
      required this.name,
      required this.email,
      required this.number});

  Contact copyWith({String? name, String? email, String? number}) {
    return Contact(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      number: number ?? this.number,
    );
  }

  factory Contact.fromJson(Map<String, Object> json) {
    return Contact(
      id: json["id"] as String,
      name: json["name"] as String,
      email: json["email"] as String,
      number: json["number"] as String,
    );
  }

  Map<String, Object> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "number": number,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Contact &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          email == other.email &&
          number == other.number;

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ email.hashCode ^ number.hashCode;

  @override
  String toString() {
    return 'Contact{id: $id, name: $name, email: $email, number: $number}';
  }
}
