
/*
 * 站点分类对象类
 * @author: 周韬
 * @date: 2019-9-21
 */
class ClassificationEntity{
  int id;
  String classificationName;


  ClassificationEntity({this.id,this.classificationName});

  ClassificationEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classificationName = json['classificationName'];
  }

  ClassificationEntity.fromSql(Map<String, dynamic> json) {
    id = json['id'];
    classificationName = json['classificationName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['classificationName'] = this.classificationName;
    return data;
  }

}