import 'dart:io';

void main() {
  List<Map<String, dynamic>> students = [];

  while (true) {
    print('\n=== Student Record Management System ===');
    print('1. Add Student');
    print('2. View All Students');
    print('3. Exit');
    stdout.write('Choose an option: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        addStudent(students);
        break;
      case '2':
        viewStudents(students);
        break;
      case '3':
        print('Exiting program.');
        return;
      default:
        print('Invalid choice. Try again.');
    }
  }
}

void addStudent(List<Map<String, dynamic>> students) {
  stdout.write('Enter student name: ');
  String? name = stdin.readLineSync();
  
  String id;
  while (true) {
    stdout.write('Enter student ID: ');
    id = stdin.readLineSync()!;
    // Check for unique ID
    if (students.any((student) => student['id'] == id)) {
      print('ID already exists! Please enter a unique ID.');
    } else {
      break;
    }
  }

  double score;
  while (true) {
    stdout.write('Enter student score (0-100): ');
    String? scoreInput = stdin.readLineSync();
    try {
      score = double.parse(scoreInput!);
      if (score < 0 || score > 100) throw FormatException();
      break;
    } catch (e) {
      print('Invalid score. Please enter a number between 0 and 100.');
    }
  }

  String grade = getGrade(score);

  students.add({
    'name': name,
    'id': id,
    'score': score,
    'grade': grade,
  });

  print('Student added successfully!');
}

String getGrade(double score) {
  if (score >= 90) return 'A+';
  if (score >= 80) return 'A';
  if (score >= 70) return 'B';
  if (score >= 60) return 'C';
  if (score >= 50) return 'D';
  return 'F';
}

void viewStudents(List<Map<String, dynamic>> students) {
  if (students.isEmpty) {
    print('No student records found.');
    return;
  }

  print('\n=== Student Records ===');
  for (var student in students) {
    print(
        'Name: ${student['name']}, ID: ${student['id']}, Score: ${student['score']}, Grade: ${student['grade']}');
  }
}
