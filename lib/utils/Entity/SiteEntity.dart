

/*
 * 站点对象类
 * @author: 周韬
 * @date: 2019-9-21
 */

class SiteEntity{
  int id;
  String siteName;
  String siteClassification;
  String siteContent;

  SiteEntity({this.id,this.siteName,this.siteClassification,this.siteContent});

  SiteEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    siteName = json['siteName'];
    siteClassification = json['siteClassification'];
    siteContent = json['siteContent'];
  }

  SiteEntity.fromSql(Map<String, dynamic> json) {
    id = json['id'];
    siteName = json['siteName'];
    siteClassification = json['siteClassification'];
    siteContent = json['siteContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['siteName'] = this.siteName;
    data['siteClassification'] = this.siteClassification;
    data['siteContent'] = this.siteContent;
    return data;
  }


}