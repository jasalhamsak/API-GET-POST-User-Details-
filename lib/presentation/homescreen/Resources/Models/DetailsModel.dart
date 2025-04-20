// To parse this JSON data, do
//
//     final detailsModel = detailsModelFromJson(jsonString);

import 'dart:convert';

DetailsModel detailsModelFromJson(String str) => DetailsModel.fromJson(json.decode(str));

String detailsModelToJson(DetailsModel data) => json.encode(data.toJson());

class DetailsModel {
  bool success;
  Data data;
  String message;
  dynamic errors;

  DetailsModel({
    required this.success,
    required this.data,
    required this.message,
    required this.errors,
  });

  factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
    errors: json["errors"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "message": message,
    "errors": errors,
  };
}

class Data {
  List<Lead> leads;
  int totalCount;
  int totalPage;
  int nextPageNo;
  dynamic previousPageNo;
  int currentPage;

  Data({
    required this.leads,
    required this.totalCount,
    required this.totalPage,
    required this.nextPageNo,
    required this.previousPageNo,
    required this.currentPage,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    leads: List<Lead>.from(json["leads"].map((x) => Lead.fromJson(x))),
    totalCount: json["total_count"],
    totalPage: json["total_page"],
    nextPageNo: json["next_page_no"],
    previousPageNo: json["previous_page_no"],
    currentPage: json["current_page"],
  );

  Map<String, dynamic> toJson() => {
    "leads": List<dynamic>.from(leads.map((x) => x.toJson())),
    "total_count": totalCount,
    "total_page": totalPage,
    "next_page_no": nextPageNo,
    "previous_page_no": previousPageNo,
    "current_page": currentPage,
  };
}

class Lead {
  int id;
  Source? source;
  CreatedUser createdUser;
  AssignedUser? assignedUser;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  String mobile;
  String? email;
  dynamic image;
  String? interest;
  String? location;
  double? leadValue;
  bool isAssigned;
  Status status;
  Priority priority;
  dynamic subSource;
  String? metaLeadId;
  String? metaPageId;
  String? metaFormId;
  int fkCompany;
  int createdBy;

  Lead({
    required this.id,
    required this.source,
    required this.createdUser,
    required this.assignedUser,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.mobile,
    required this.email,
    required this.image,
    required this.interest,
    required this.location,
    required this.leadValue,
    required this.isAssigned,
    required this.status,
    required this.priority,
    required this.subSource,
    required this.metaLeadId,
    required this.metaPageId,
    required this.metaFormId,
    required this.fkCompany,
    required this.createdBy,
  });

  factory Lead.fromJson(Map<String, dynamic> json) => Lead(
    id: json["id"],
    source: sourceValues.map[json["source"]],
    createdUser: createdUserValues.map[json["created_user"]] ?? CreatedUser.SAMPLE,
    assignedUser: assignedUserValues.map[json["assigned_user"]],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    name: json["name"] ?? '',
    mobile: json["mobile"] ?? '',
    email: json["email"],
    image: json["image"],
    interest: json["interest"],
    location: json["location"],
    leadValue: json["lead_value"]?.toDouble(),
    isAssigned: json["is_assigned"] ?? false,
    status: statusValues.map[json["status"]] ?? Status.NEW,
    priority: priorityValues.map[json["priority"]] ?? Priority.WARM,
    subSource: json["sub_source"],
    metaLeadId: json["meta_lead_id"],
    metaPageId: json["meta_page_id"],
    metaFormId: json["meta_form_id"],
    fkCompany: json["fk_company"],
    createdBy: json["created_by"],
  );


  Map<String, dynamic> toJson() => {
    "id": id,
    "source": sourceValues.reverse[source],
    "created_user": createdUserValues.reverse[createdUser],
    "assigned_user": assignedUserValues.reverse[assignedUser],
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "name": name,
    "mobile": mobile,
    "email": email,
    "image": image,
    "interest": interest,
    "location": location,
    "lead_value": leadValue,
    "is_assigned": isAssigned,
    "status": statusValues.reverse[status],
    "priority": priorityValues.reverse[priority],
    "sub_source": subSource,
    "meta_lead_id": metaLeadId,
    "meta_page_id": metaPageId,
    "meta_form_id": metaFormId,
    "fk_company": fkCompany,
    "created_by": createdBy,
  };
}

enum AssignedUser {
  AJMAL,
  DILSHAD,
  SAMPLE
}

final assignedUserValues = EnumValues({
  "Ajmal": AssignedUser.AJMAL,
  "Dilshad": AssignedUser.DILSHAD,
  "Sample": AssignedUser.SAMPLE
});

enum CreatedUser {
  CODEME,
  SAMPLE
}

final createdUserValues = EnumValues({
  "codeme": CreatedUser.CODEME,
  "Sample": CreatedUser.SAMPLE
});

enum Priority {
  WARM
}

final priorityValues = EnumValues({
  "Warm": Priority.WARM
});

enum Source {
  CALL,
  DIRECT_ENQUIRY,
  META,
  OTHER,
  SMM_LEAD,
  WEBSITE
}

final sourceValues = EnumValues({
  "Call": Source.CALL,
  "DIRECT ENQUIRY": Source.DIRECT_ENQUIRY,
  "Meta": Source.META,
  "Other": Source.OTHER,
  "SMM Lead": Source.SMM_LEAD,
  "Website": Source.WEBSITE
});

enum Status {
  CLOSED,
  NEW,
  OPEN,
  PAUSED,
  REJECTED,
  UNAVAILABLE
}

final statusValues = EnumValues({
  "Closed": Status.CLOSED,
  "New": Status.NEW,
  "Open": Status.OPEN,
  "Paused": Status.PAUSED,
  "Rejected": Status.REJECTED,
  "Unavailable": Status.UNAVAILABLE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
