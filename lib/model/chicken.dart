class Chicken {
  final String nickname;
  final int id;
  final DateTime birthdate;
  final double weight;
  final String healthStatus;

  Chicken({required this.nickname, required this.id, required this.birthdate, required this.weight, required this.healthStatus});

  Chicken.fromJson(Map<String, dynamic> json)
      : nickname = json['apodo'].toString(),
        id = int.parse(json['id'].toString()),
        birthdate = DateTime.parse(json['fecha_nacimiento'].toString()),
        weight = double.parse(json['peso'].toString()),
        healthStatus = json['estado_salud'].toString();
}
