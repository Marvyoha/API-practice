// Model to represent the top-level structure of the JSON response
class UserModel {
  List<UserResult> results;

  UserModel({required this.results});

  // Factory method to create UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    // Extract the 'results' list from the JSON
    var userList = json['results'] as List;
    // Map each user JSON object to a UserResult object and convert the list
    List<UserResult> users =
        userList.map((user) => UserResult.fromJson(user)).toList();

    // Return a new UserModel instance with the list of UserResult objects
    return UserModel(results: users);
  }
}

// Model to represent an individual user result in the JSON response
class UserResult {
  final String gender;
  final Name name;
  final Location location;
  final String email;
  final String phone;
  final String cell;
  final Picture picture;
  final String nat;

  UserResult({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.phone,
    required this.cell,
    required this.picture,
    required this.nat,
  });

  factory UserResult.fromJson(Map<String, dynamic> json) {
    return UserResult(
      gender: json['gender'],
      name: Name.fromJson(json['name']),
      location: Location.fromJson(json['location']),
      email: json['email'],
      phone: json['phone'],
      cell: json['cell'],
      picture: Picture.fromJson(json['picture']),
      nat: json['nat'],
    );
  }
}

// Model to represent the name of a user
class Name {
  final String title;
  final String first;
  final String last;

  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  // Factory method to create a Name object from JSON
  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      title: json['title'],
      first: json['first'],
      last: json['last'],
    );
  }

  // Method to get the full name
  String getFullName() {
    return '$title $first $last';
  }
}

// Model to represent the location of a user
class Location {
  final Street street;
  final String city;
  final String state;
  final String country;
  final String postcode;
  final Coordinates coordinates;

  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
  });

  // Factory method to create a Location object from JSON
  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      street: Street.fromJson(json['street']),
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'].toString(),
      coordinates: Coordinates.fromJson(json['coordinates']),
    );
  }
}

// Model to represent the street
class Street {
  final String number;
  final String name;

  Street({
    required this.number,
    required this.name,
  });

  // Factory method to create a Street object from JSON
  factory Street.fromJson(Map<String, dynamic> json) {
    return Street(
      number: json['number'].toString(),
      name: json['name'],
    );
  }
}

// Model to represent the coordinates
class Coordinates {
  final String latitude;
  final String longitude;

  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  // Factory method to create a Coordinates object from JSON
  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

// Model to represent the picture URLs
class Picture {
  final String large;
  final String medium;
  final String thumbnail;

  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  // Factory method to create a Picture object from JSON
  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      large: json['large'],
      medium: json['medium'],
      thumbnail: json['thumbnail'],
    );
  }
}
