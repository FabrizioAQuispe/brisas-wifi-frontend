class LoginUsuario {
  final String correo;
  final String password;

  LoginUsuario({required this.correo, required this.password});

  Map<String, String> toJson() {
    return {
      correo: correo,
      password: password,
    };
  }
}

class PerfilUsuario {
  final int? idUser;
  final String? nombre;
  final int? dni;
  final DateTime? fecCreate;
  final DateTime? fecNac;
  final String? ipUser;

  PerfilUsuario({
    this.idUser,
    this.nombre,
    this.dni,
    this.fecCreate,
    this.fecNac,
    this.ipUser,
  });

  factory PerfilUsuario.fromJson(Map<String, dynamic> json) {
    return PerfilUsuario(
      idUser: json['id_user'],
      nombre: json['nombre'],
      dni: json['dni'],
      fecCreate: json['fec_create'] != null
          ? DateTime.tryParse(json['fec_create'])
          : null,
      fecNac: json['fec_nac'] != null ? DateTime.tryParse(json['fec_nac']) : null,
    );
  }

  @override
  String toString() {
    return 'PerfilUsuario(idUser: $idUser, nombre: $nombre, dni: $dni, fecCreate: $fecCreate, fecNac: $fecNac)';
  }
}
