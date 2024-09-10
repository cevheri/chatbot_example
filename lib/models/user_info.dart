class UserInfo {
  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  bool? emailVerified;
  UserProfileMetadata? userProfileMetadata;

  UserInfo(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.emailVerified,
      this.userProfileMetadata});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    emailVerified = json['emailVerified'];
    userProfileMetadata = json['userProfileMetadata'] != null ? UserProfileMetadata.fromJson(json['userProfileMetadata']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['emailVerified'] = emailVerified;
    if (userProfileMetadata != null) {
      data['userProfileMetadata'] = userProfileMetadata!.toJson();
    }
    return data;
  }
}

class UserProfileMetadata {
  List<Attributes>? attributes;
  List<Groups>? groups;

  UserProfileMetadata({this.attributes, this.groups});

  UserProfileMetadata.fromJson(Map<String, dynamic> json) {
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(Attributes.fromJson(v));
      });
    }
    if (json['groups'] != null) {
      groups = <Groups>[];
      json['groups'].forEach((v) {
        groups!.add(Groups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (attributes != null) {
      data['attributes'] = attributes!.map((v) => v.toJson()).toList();
    }
    if (groups != null) {
      data['groups'] = groups!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attributes {
  String? name;
  String? displayName;
  bool? required;
  bool? readOnly;
  Validators? validators;
  bool? multivalued;

  Attributes({this.name, this.displayName, this.required, this.readOnly, this.validators, this.multivalued});

  Attributes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    displayName = json['displayName'];
    required = json['required'];
    readOnly = json['readOnly'];
    validators = json['validators'] != null ? Validators.fromJson(json['validators']) : null;
    multivalued = json['multivalued'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['displayName'] = displayName;
    data['required'] = required;
    data['readOnly'] = readOnly;
    if (validators != null) {
      data['validators'] = validators!.toJson();
    }
    data['multivalued'] = multivalued;
    return data;
  }
}

class Validators {
  UsernameProhibitedCharacters? usernameProhibitedCharacters;
  Multivalued? multivalued;
  Length? length;
  UsernameProhibitedCharacters? upUsernameNotIdnHomograph;
  UsernameProhibitedCharacters? email;
  UsernameProhibitedCharacters? personNameProhibitedCharacters;

  Validators(
      {this.usernameProhibitedCharacters,
      this.multivalued,
      this.length,
      this.upUsernameNotIdnHomograph,
      this.email,
      this.personNameProhibitedCharacters});

  Validators.fromJson(Map<String, dynamic> json) {
    usernameProhibitedCharacters = json['username-prohibited-characters'] != null
        ? UsernameProhibitedCharacters.fromJson(json['username-prohibited-characters'])
        : null;
    multivalued = json['multivalued'] != null ? Multivalued.fromJson(json['multivalued']) : null;
    length = json['length'] != null ? Length.fromJson(json['length']) : null;
    upUsernameNotIdnHomograph = json['up-username-not-idn-homograph'] != null
        ? UsernameProhibitedCharacters.fromJson(json['up-username-not-idn-homograph'])
        : null;
    email = json['email'] != null ? UsernameProhibitedCharacters.fromJson(json['email']) : null;
    personNameProhibitedCharacters = json['person-name-prohibited-characters'] != null
        ? UsernameProhibitedCharacters.fromJson(json['person-name-prohibited-characters'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (usernameProhibitedCharacters != null) {
      data['username-prohibited-characters'] = usernameProhibitedCharacters!.toJson();
    }
    if (multivalued != null) {
      data['multivalued'] = multivalued!.toJson();
    }
    if (length != null) {
      data['length'] = length!.toJson();
    }
    if (upUsernameNotIdnHomograph != null) {
      data['up-username-not-idn-homograph'] = upUsernameNotIdnHomograph!.toJson();
    }
    if (email != null) {
      data['email'] = email!.toJson();
    }
    if (personNameProhibitedCharacters != null) {
      data['person-name-prohibited-characters'] = personNameProhibitedCharacters!.toJson();
    }
    return data;
  }
}

class UsernameProhibitedCharacters {
  bool? ignoreEmptyValue;

  UsernameProhibitedCharacters({this.ignoreEmptyValue});

  UsernameProhibitedCharacters.fromJson(Map<String, dynamic> json) {
    ignoreEmptyValue = json['ignore.empty.value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ignore.empty.value'] = ignoreEmptyValue;
    return data;
  }
}

class Multivalued {
  String? max;

  Multivalued({max});

  Multivalued.fromJson(Map<String, dynamic> json) {
    max = json['max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['max'] = max;
    return data;
  }
}

class Length {
  int? max;
  bool? ignoreEmptyValue;
  int? min;

  Length({this.max, this.ignoreEmptyValue, this.min});

  Length.fromJson(Map<String, dynamic> json) {
    max = json['max'];
    ignoreEmptyValue = json['ignore.empty.value'];
    min = json['min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['max'] = max;
    data['ignore.empty.value'] = ignoreEmptyValue;
    data['min'] = min;
    return data;
  }
}

class Groups {
  String? name;
  String? displayHeader;
  String? displayDescription;

  Groups({this.name, this.displayHeader, this.displayDescription});

  Groups.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    displayHeader = json['displayHeader'];
    displayDescription = json['displayDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['displayHeader'] = displayHeader;
    data['displayDescription'] = displayDescription;
    return data;
  }
}
