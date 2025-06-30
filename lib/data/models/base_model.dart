
// todo: Исправить так чтобы наследники могли использовать метод fromJson
abstract class BaseModel {
  factory BaseModel.fromJson(Map<String, dynamic> json){
    throw UnimplementedError();
  }
}