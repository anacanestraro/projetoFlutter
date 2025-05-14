import 'package:projeto_flutter/common/errors/errors_classes.dart';
import 'package:projeto_flutter/common/patterns/result.dart';
import 'package:projeto_flutter/data/repositories/student_repository_contract.dart';
import 'package:projeto_flutter/data/services/local_storage_contract.dart';
import 'package:projeto_flutter/domain/entities/studant_info_entity.dart';

class StudentRepositoryImpl implements StudentRepositoryContract {
  final LocalStorageContract _localStorageContract;

  StudentRepositoryImpl({required LocalStorageContract localStorageContract})
    : _localStorageContract = localStorageContract;

  @override
  Future<Result<StudentInfoEntity, Failure>> getStudent() async {
    var result = await _localStorageContract.fetchStudent();
    return result;
  }

  @override
  Future<Result<void, Failure>> saveStudent(StudentInfoEntity student) async {
    var result = await _localStorageContract.saveStudent(student);
    return result;
  }
}