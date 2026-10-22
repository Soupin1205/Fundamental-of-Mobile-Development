// import 'package:test/test.dart';

// import '../service/lms_system.dart';

// void main() {
//   test('creates a student', () {
//     final lms = LmsSystem();

//     // Create a student
//     lms.addStudent(studentId: 'S1', studentName: "ronan");

//     expect(lms.students.first.name, 'ronan');

//     // Remove the student
//     lms.removeStudent(studentId: 'S1');
//     expect(lms.students.length, 0);
//   });
//  }

import 'package:test/test.dart';

import '../lib/service/lms_system.dart';

void main() {
  test('Task 1: Add and remove a course', () {
    final lms = LmsSystem();

    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
    expect(lms.courses.length, 1);

    lms.removeCourse(courseId: 'C1');
    expect(lms.courses, isEmpty);
  });

  test('Task 2: Enroll a student in a course', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');

    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    expect(lms.courses.first.studentIds, contains('S1'));
  });

  test('Task 3: Remove a student from a course', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    lms.discardStudentFromCourse(studentId: 'S1', courseId: 'C1');

    expect(lms.courses.first.studentIds, isEmpty);
    expect(lms.students.length, 1);
    expect(lms.courses.length, 1);
  });

  test('Task 4: Add a result', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    final result = lms.addResult(
      studentId: 'S1',
      courseId: 'C1',
      score: 85,
    );

    expect(result.score, 85);
    expect(lms.results.length, 1);
  });

  test('Task 5: Remove a result', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    final result = lms.addResult(
      studentId: 'S1',
      courseId: 'C1',
      score: 85,
    );

    lms.removeResult(resultId: result.id);

    expect(lms.results, isEmpty);
    expect(lms.students.length, 1);
    expect(lms.courses.length, 1);
  });

  test('Removing a student also removes enrollments and results', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'Ronan');
    lms.addStudent(studentId: 'S2', studentName: 'Dara');
    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');

    lms.enrollStudent(studentId: 'S1', courseId: 'C1');
    lms.enrollStudent(studentId: 'S2', courseId: 'C1');

    lms.addResult(studentId: 'S1', courseId: 'C1', score: 85);
    lms.addResult(studentId: 'S2', courseId: 'C1', score: 90);

    lms.removeStudent(studentId: 'S1');

    expect(lms.students.length, 1);
    expect(lms.students.first.id, 'S2');
    expect(lms.courses.first.studentIds, ['S2']);
    expect(lms.results.length, 1);
    expect(lms.results.first.studentId, 'S2');
  });
}
