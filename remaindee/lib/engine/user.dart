import 'remainder.dart';

class UserClass {
  var id;
  var userName;
  var email;
  var timezone;
  var language;

  late List<Remainder> remainders;
  UserClass(this.id, this.userName, this.email, this.timezone, this.language) {
    remainders = [];
  }

  void addremainder(var remainderId, var remainderName, var description,
      var time, var Text, var audioUri) {
    Remainder x1 = Remainder(
        remainderId, remainderName, description, time);
    remainders.add(x1);
  }

  void deleteRemainder(String remainderName) {
    remainders.removeWhere((item) => item.remainderName == remainderName);
  }
}

void main() {
  //print(Guid.newGuid);
  UserClass user1 = new UserClass(
      "1", "kowsi", "kowsalyaalagersamy.official@gmail.com", "IST", "english");
  print(user1.id);
  print(user1.userName);
  user1.addremainder(
      "123", "Sham", "Smart", DateTime.now(), "SKJDHH", "KSDJF3%%#^&");
  user1.addremainder(
      "213", "Kows", "Cool", DateTime.now(), "SKJDwerH", "KSlsdkffF3%%#^&");
  print(user1.remainders[0]);
  user1.deleteRemainder("Sham");
  print(user1.remainders[1]);
}
