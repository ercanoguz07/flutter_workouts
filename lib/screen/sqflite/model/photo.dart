class Photo {
  int? id;
  String? photo;
  Photo(this.id, this.photo);
  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{if (id != 0) 'id': id as int, 'photo': photo};
    return map;
  }

  Photo.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    photo = map['photo'];
  }
}
