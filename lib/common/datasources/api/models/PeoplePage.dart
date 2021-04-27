import 'package:ejericio_formacion/common/datasources/api/models/Person.dart';

class PeoplePage {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<PersonRepo> data;

  PeoplePage(
      {this.page,
      this.perPage,
      this.total,
      this.totalPages,
      this.data,});

  PeoplePage.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = new List<PersonRepo>();
      json['data'].forEach((v) {
        data.add(new PersonRepo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['total'] = this.total;
    data['total_pages'] = this.totalPages;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
