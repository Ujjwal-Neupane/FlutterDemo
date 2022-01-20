import 'dart:convert';

class Flat {
  final int id;

  final int room_no;
  final int kitchen_no;
  final int bathroom_no;

  final String property_type;
  final int dis_main_road;
  final String adTitle;
  final String description;
  final int price;

  final String district;
  final String mun_vdc;
  final String city_village;
  final String tole;
  final int ward_no;

  final String firstname;
  final String lastname;
  final String email;
  final String contact_no1;
  final String contact_no2;
  final String latitude;
  final String longitude;

  Flat({
    required this.id,
    required this.room_no,
    required this.kitchen_no,
    required this.bathroom_no,
    required this.property_type,
    required this.dis_main_road,
    required this.adTitle,
    required this.description,
    required this.price,
    required this.district,
    required this.mun_vdc,
    required this.city_village,
    required this.tole,
    required this.ward_no,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.contact_no1,
    required this.contact_no2,
    required this.latitude,
    required this.longitude,
  });

  Flat copyWith({
    int? id,
    int? room_no,
    int? kitchen_no,
    int? bathroom_no,
    String? property_type,
    int? dis_main_road,
    String? adTitle,
    String? description,
    int? price,
    String? district,
    String? mun_vdc,
    String? city_village,
    String? tole,
    int? ward_no,
    String? firstname,
    String? lastname,
    String? email,
    String? contact_no1,
    String? contact_no2,
    String? latitude,
    String? longitude,
  }) {
    return Flat(
      id: id ?? this.id,
      room_no: room_no ?? this.room_no,
      kitchen_no: kitchen_no ?? this.kitchen_no,
      bathroom_no: bathroom_no ?? this.bathroom_no,
      property_type: property_type ?? this.property_type,
      dis_main_road: dis_main_road ?? this.dis_main_road,
      adTitle: adTitle ?? this.adTitle,
      description: description ?? this.description,
      price: price ?? this.price,
      district: district ?? this.district,
      mun_vdc: mun_vdc ?? this.mun_vdc,
      city_village: city_village ?? this.city_village,
      tole: tole ?? this.tole,
      ward_no: ward_no ?? this.ward_no,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      contact_no1: contact_no1 ?? this.contact_no1,
      contact_no2: contact_no2 ?? this.contact_no2,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': '$id',
      'room_no': '$room_no',
      'kitchen_no': '$kitchen_no',
      'bathroom_no': '$bathroom_no',
      'property_type': property_type,
      'dis_main_road': '$dis_main_road',
      'adTitle': adTitle,
      'description': description,
      'price': '$price',
      'district': district,
      'mun_vdc': mun_vdc,
      'city_village': city_village,
      'tole': tole,
      'ward_no': '$ward_no',
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'contact_no1': contact_no1,
      'contact_no2': contact_no2,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Flat.fromMap(Map<String, dynamic> map) {
    return Flat(
      //id: map['id']?.toInt() ?? 0,
      id: int.parse(map['id']),
      room_no: int.parse(map['room_no']),
      kitchen_no: int.parse(map['kitchen_no']),
      bathroom_no: int.parse(map['bathroom_no']),
      property_type: map['property_type'] ?? '',
      dis_main_road: int.parse(map['dis_main_road']),
      adTitle: map['adTitle'] ?? '',
      description: map['description'] ?? '',
      price: int.parse(map['price']),
      district: map['district'] ?? '',
      mun_vdc: map['mun_vdc'] ?? '',
      city_village: map['city_village'] ?? '',
      tole: map['tole'] ?? '',
      ward_no: int.parse(map['ward_no']),
      firstname: map['firstname'] ?? '',
      lastname: map['lastname'] ?? '',
      email: map['email'] ?? '',
      contact_no1: map['contact_no1'] ?? '',
      contact_no2: map['contact_no2'] ?? '',
      latitude: map['latitude'] ?? '',
      longitude: map['longitude'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Flat.fromJson(String source) => Flat.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Flat(id: $id, room_no: $room_no, kitchen_no: $kitchen_no, bathroom_no: $bathroom_no, property_type: $property_type, dis_main_road: $dis_main_road, adTitle: $adTitle, description: $description, price: $price, district: $district, mun_vdc: $mun_vdc, city_village: $city_village, tole: $tole, ward_no: $ward_no, firstname: $firstname, lastname: $lastname, email: $email, contact_no1: $contact_no1, contact_no2: $contact_no2, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Flat &&
        other.id == id &&
        other.room_no == room_no &&
        other.kitchen_no == kitchen_no &&
        other.bathroom_no == bathroom_no &&
        other.property_type == property_type &&
        other.dis_main_road == dis_main_road &&
        other.adTitle == adTitle &&
        other.description == description &&
        other.price == price &&
        other.district == district &&
        other.mun_vdc == mun_vdc &&
        other.city_village == city_village &&
        other.tole == tole &&
        other.ward_no == ward_no &&
        other.firstname == firstname &&
        other.lastname == lastname &&
        other.email == email &&
        other.contact_no1 == contact_no1 &&
        other.contact_no2 == contact_no2 &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        room_no.hashCode ^
        kitchen_no.hashCode ^
        bathroom_no.hashCode ^
        property_type.hashCode ^
        dis_main_road.hashCode ^
        adTitle.hashCode ^
        description.hashCode ^
        price.hashCode ^
        district.hashCode ^
        mun_vdc.hashCode ^
        city_village.hashCode ^
        tole.hashCode ^
        ward_no.hashCode ^
        firstname.hashCode ^
        lastname.hashCode ^
        email.hashCode ^
        contact_no1.hashCode ^
        contact_no2.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
