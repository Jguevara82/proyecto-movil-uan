class Chicken {
  final String nickname;
  final int id;
  final DateTime birthdate;
  final double weight;
  final String healthStatus;
  final int id_jaula;
  final int posicion_jaula;

  Chicken({required this.nickname, required this.id, required this.birthdate, required this.weight, required this.healthStatus, required this.id_jaula, required this.posicion_jaula});

  Chicken.fromJson(Map<String, dynamic> json)
      : nickname = json['apodo'].toString(),
        id = int.parse(json['id'].toString()),
        birthdate = DateTime.parse(json['fecha_nacimiento'].toString()),
        weight = double.parse(json['peso'].toString()),
        id_jaula = int.parse(json['id_jaula'].toString()),
        posicion_jaula = int.parse(json['posicion_jaula'].toString()),

        healthStatus = json['estado_salud'].toString();
}
