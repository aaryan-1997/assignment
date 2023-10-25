class BlogModel {
  String? id;
  String? title;
  String? description;
  String? createdAt;
  BlogModel({this.id, this.title, this.description, this.createdAt});

  BlogModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['created_at'] = createdAt;
    return data;
  }
}
