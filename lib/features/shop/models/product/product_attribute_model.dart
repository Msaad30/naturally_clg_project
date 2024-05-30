class ProductionAttributeModel {
  String? name;
  final List<String>? values;

  ProductionAttributeModel({this.name,this.values});

  // Json  format
  toJson() {
    return {'Name': name,'Values': values};
  }

  //map Json oriented document snapshot from firebase to model
   factory ProductionAttributeModel.fromJson(Map<String,dynamic>document) {
    final data = document;

    if (data.isEmpty) return ProductionAttributeModel();

    return ProductionAttributeModel(
      name: data.containsKey('Name') ? data['Name'] : '',
      values: List<String>.from(data['Values']),
    ) ; //productAtributeModel
   }
}