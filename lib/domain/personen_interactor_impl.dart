import 'package:demo1/domain/personen_interactor.dart';
import 'package:demo1/io/local/floor/Person.dart';
import 'package:demo1/io/local/floor/PersonDao.dart';
import 'package:logger/logger.dart';

class PersonenInteractorImpl extends PersonenInteractor {
  final PersonDao personDao;
  final logger = Logger();

  PersonenInteractorImpl(this.personDao);

  @override
  Stream<Person?> findPersonById(int id) {
    getAllPersonen().then((result) {
      if (result.isEmpty) {
        logger.d("Film Liste ist leer");
      } else {
        logger.d("Es müsste ein neuer Film rein");
      }
    });

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
