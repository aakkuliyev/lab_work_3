import 'package:flutter/material.dart';
import 'models/student.dart';
import 'models/student_journal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final StudentJournal journal = StudentJournal();

  @override
  Widget build(BuildContext context) {
    // Example usage
    Student student1 = Student(firstName: "John", lastName: "Doe", averageGrade: 4.0);
    Student student2 = Student(firstName: "Jane", lastName: "Smith", averageGrade: 3.8);
    Student student3 = Student(firstName: "Bob", lastName: "Johnson", averageGrade: 4.2);

    journal.addStudent(student1);
    journal.addStudent(student2);
    journal.addStudent(student3);

    journal.displayStudentInformation();
    print("Average Score: ${journal.averageScore()}");

    var highestGPAStudent = journal.highestGPAStudent();
    if (highestGPAStudent != null) {
      print("Student with the Highest GPA: ${highestGPAStudent.firstName} ${highestGPAStudent.lastName}");
    }

    journal.removeStudent("Jane", "Smith");
    journal.displayStudentInformation();

    return Scaffold(
      appBar: AppBar(
        title: Text("Student Journal"),
      ),
      body: Center(
        child: Text("Check the console for output."),
      ),
    );
  }
}

