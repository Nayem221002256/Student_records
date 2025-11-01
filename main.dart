import 'dart:io';

void main() {
  List<Map<String, dynamic>> students = [];

  print("=== Student Record Management System ===");

  while (true) {
    print("\nChoose an option:");
    print("1. Add Student");
    print("2. View All Students");
    print("3. Exit");

    stdout.write("Enter your choice: ");
    String? choice = stdin.readLineSync();

    if (choice == '1') {
      addStudent(students);
    } else if (choice == '2') {
      viewStudents(students);
    } else if (choice == '3') {
      print("Exiting program... Goodbye!");
      break;
    } else {
      print("Invalid choice! Please try again.");
    }
  }
}

void addStudent(List<Map<String, dynamic>> students) {
  stdout.write("Enter Student ID: ");
  String? id = stdin.readLineSync();

  // Check for unique ID
  bool idExists = students.any((student) => student['id'] == id);
  if (idExists) {
    print("⚠️ Student ID already exists! Try a different one.");
    return;
  }

  stdout.write("Enter Student Name: ");
  String? name = stdin.readLineSync();

  stdout.write("Enter Student Score (0–100): ");
  double? score = double.tryParse(stdin.readLineSync() ?? '');

  if (score == null || score < 0 || score > 100) {
    print("⚠️ Invalid score! Must be between 0 and 100.");
    return;
  }

  String grade = getGrade(score);

  students.add({
    'id': id,
    'name': name,
    'score': score,
    'grade': grade,
  });

  print("✅ Student added successfully!");
}

void viewStudents(List<Map<String, dynamic>> students) {
  if (students.isEmpty) {
    print("No student records found.");
    return;
  }

  print("\n=== All Student Records ===");
  for (var student in students) {
    print(
        "ID: ${student['id']}, Name: ${student['name']}, Score: ${student['score']}, Grade: ${student['grade']}");
  }
}

String getGrade(double score) {
  if (score >= 90) return "A+";
  if (score >= 80) return "A";
  if (score >= 70) return "B";
  if (score >= 60) return "C";
  if (score >= 50) return "D";
  return "F";
}
