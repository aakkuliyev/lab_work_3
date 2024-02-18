import 'student.dart';

class StudentJournal {
  List<Student> students = [];

  void addStudent(Student student) {
    students.add(student);
  }

  void removeStudent(String firstName, String lastName) {
    students.removeWhere((student) => student.firstName == firstName && student.lastName == lastName);
  }

  void displayStudentInformation() {
    students.sort((a, b) => b.averageGrade.compareTo(a.averageGrade));
    for (var student in students) {
      print("Name: ${student.firstName} ${student.lastName}, GPA: ${student.averageGrade}");
    }
  }

  double averageScore() {
    var total = students.fold(0.0, (sum, student) => sum + student.averageGrade);
    return total / students.length;
  }

  Student? highestGPAStudent() {
    return students.isNotEmpty ? students.reduce((a, b) => a.averageGrade > b.averageGrade ? a : b) : null;
  }
}
