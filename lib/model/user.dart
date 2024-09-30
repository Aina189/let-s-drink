import 'package:water/controller/register_controller.dart';

class User {
  final int id;
  String name;
  int age;
  String gender;
  int wheight;
  String classAge;
  int verreNbr;
  int perDayNbr;

  User(
      {required this.id,
      required this.name,
      required this.age,
      required this.gender,
      required this.wheight,
      required this.classAge,
      required this.verreNbr,
      required this.perDayNbr});

  Map<String, Object?> toMap() => {
   
      'id': id,
      'name': name,
      'age': age,
      'gender': gender,
      'weight': wheight,
      'classAge':classAge,
      'verreNbr':verreNbr,
      'perDayNbr': perDayNbr

  };

  factory User.fromMap(Map<String, dynamic> map)=> User(id: map['id'], name: map['name'], age: map['age'], gender: map['gender'], wheight: map['weight'],classAge: map['classAge'],verreNbr: map['verreNbr'], perDayNbr: map['perDayNbr']);

  static late User userRegistred  ;

  static void getUser() async{
    User? userTest = await SyncToDB.getUserById(1);
    if(userTest != null){
        userRegistred = userTest;
    }
  }
}
