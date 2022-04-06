// Задание 8
// Создайте класс User.
class User {
  String email;

  User(this.email);
}

mixin MailSystem on User {
  String getMailSystem() => email.substring(email.indexOf('@') + 1);
}

class AdminUser extends User with MailSystem {
  AdminUser(String email) : super(email);
}

class GeneralUser extends User {
  GeneralUser(String email) : super(email);
}

class UserManager<T extends User> {
  final users = <User>[];

  void addUser(User user) {
    users.add(user);
  }

  void clearUsers() {
    users.clear();
  }

  void printEmails() {
    for (var user in users) {
      if (user is AdminUser) {
        print(user.getMailSystem());
      } else {
        print(user.email);
      }
    }
  }
}

void main() {
  final admin = new AdminUser('test@mail.com');
  final mana = new UserManager();
  mana.addUser(admin);
  mana.addUser(new User('123@123.ru'));
  mana.printEmails();
}
