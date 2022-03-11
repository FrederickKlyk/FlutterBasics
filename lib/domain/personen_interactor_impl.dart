import 'package:demo1/domain/personen_interactor.dart';
import 'package:demo1/io/local/floor/Person.dart';
import 'package:demo1/io/local/floor/PersonDao.dart';

class PersonenInteractorImpl extends PersonenInteractor {
  final PersonDao personDao;

  PersonenInteractorImpl(this.personDao);

  @override
  Stream<Person?> findPersonById(int id) {
    return personDao.findPersonById(id);
  }

  @override
  Future<List<Person>> getAllPersonen() {
    return personDao.findAllPersons();
  }

  @override
  Future<void> insertPerson(Person person) {
    return personDao.insertPerson(person);
  }
}
