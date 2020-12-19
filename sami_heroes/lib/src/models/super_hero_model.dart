import 'appearance.dart'; 
import 'biography.dart';
import 'connections.dart';
import 'image.dart';
import 'powerstats.dart';
import 'work.dart';

class SamiHeroModel {
  String response;
  String id;
  String name;
  PowerStats powerStats;
  Biography biography;
  Appearance appearance;
  Work work;
  Connections connections;
  Image image;
  
  SamiHeroModel(
      {this.response,
      this.id,
      this.name,
      this.powerStats,
      this.biography,
      this.work,
      this.connections,
      this.image});

  SamiHeroModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    id = json['id'];
    name = json['name'];
    powerStats = json['powerstats'] != null ? PowerStats.fromJson(json['powerstats']) : null;
    biography = json['biography'] != null ? Biography.fromJson(json["biography"])  : null;
    appearance = json['appearance'] != null ? Appearance.fromJson(json['appearance']) : null;
    work = json['work'] != null ? Work.fromJson(json['work']) : null;
    connections = json['connections'] != null ? Connections.fromJson(json['connections']) : null;
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['response'] = this.response;
    data['id'] = this.id;
    data['name'] = this.name;
      
      if(this.biography != null) {
        data['powerstats'] = this.biography.toJson();
      }
      if(this.appearance != null) {
        data['appearance'] = this.appearance.toJson();
      }
      if(this.work != null) {
        data['work'] = this.work.toJson();
      }
      if(this.connections != null) {
        data['connections'] = this.connections.toJson();
      }
      if(this.image != null) {
        data['image'] = this.image.toJson()
      }
    
    return data;
  }

  String getFieldOrDefaultValue(String field, String defaultValue) {
    if(field == 'null' || field.isEmpty || field.trim() == '') {
      return defaultValue;
    }
    return field; 
  }
  

}
