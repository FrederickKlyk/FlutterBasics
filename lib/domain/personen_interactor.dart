
import '../io/local/floor/Person.dart';

abstract class PersonenInteractor{

  Future<List<Person>> getAllPersonen();

  Stream<Person?> findPersonById(int id);

  Future<void> insertPerson(Person person);
}