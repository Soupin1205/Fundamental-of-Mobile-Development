import '../model/course.dart';
import '../model/course_result.dart';
import '../model/student.dart';

class LmsSystem {
  final List<Student> students = [];
  final List<Course> courses = [];
  final List<CourseResult> results = [];

  int _nextResultId = 1;

  void addStudent({required String studentId, required String studentName}) {
    // ! Student shall not exist already
    Student? student = _findStudentOrNull(studentId);
    if (student != null) {
      throw Exception('Student $student already exists');
    }

    students.add(Student(id: studentId, name: studentName));
  }

  void removeStudent({required String studentId}) {
    Student? student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception('Student $studentId not found');
    }
    // 1- Remove student from the students list
    students.removeWhere((student) => student.id == studentId);

    // Remove the student from every course.
    for (Course course in courses) {
      course.studentIds.remove(studentId);
    }

    // Remove all results belonging to the student.
    results.removeWhere((result) => result.studentId == studentId);

    // Remove the student from the LMS.
    students.removeWhere((student) => student.id == studentId);
  }

  Student? _findStudentOrNull(String studentId) {
    for (Student s in students) {
      if (s.id == studentId) {
        return s;
      }
    }
    return null; // not found
  }

  //Task 1 — Add and remove courses
  void addCourse({required String courseId, required String courseName}) {
    Course? course = _findCourseOrNull(courseId);

    if (course != null) {
      throw Exception('Course $courseId already exists');
    }

    courses.add(Course(id: courseId, name: courseName));
  }

  void removeCourse({required String courseId}) {
    Course? course = _findCourseOrNull(courseId);

    if (course == null) {
      throw Exception('Course $courseId not found');
    }

    // Remove all results belonging to this course
    results.removeWhere(
      (result) => result.courseId == courseId,
    );

    // Removing the course also removes its enrollments
    courses.remove(course);
  }


  Course? _findCourseOrNull(String courseId) {
    for (Course c in courses) {
      if (c.id == courseId) {
        return c;
      }
    }
    return null;
  }

  //Task 2 — Enroll a student in a course
  void enrollStudent({required String studentId, required String courseId}) {
    Student? student = _findStudentOrNull(studentId);

    if (student == null) {
      throw Exception('Student $studentId not found');
    }

    Course? course = _findCourseOrNull(courseId);

    if (course == null) {
      throw Exception('Course $courseId not found');
    }

    if (course.studentIds.contains(studentId)) {
      throw Exception('Student $studentId is already enrolled');
    }

    course.studentIds.add(studentId);
  }

  //Task 3 — Remove a student from a course 
  void discardStudentFromCourse({
    required String studentId,
    required String courseId,
  }) {
    Student? student = _findStudentOrNull(studentId);

    if (student == null) {
      throw Exception('Student $studentId not found');
    }

    Course? course = _findCourseOrNull(courseId);

    if (course == null) {
      throw Exception('Course $courseId not found');
    }

    if (!course.studentIds.contains(studentId)) {
      throw Exception(
        'Student $studentId is not enrolled in course $courseId',
      );
    }

    // Remove results for this student in this course.
    results.removeWhere(
      (result) =>
          result.studentId == studentId &&
          result.courseId == courseId,
    );

    // Remove only this enrollment.
    course.studentIds.remove(studentId);
  }
  //Task 4 — Add a result to a course
  CourseResult addResult({
    required String studentId,
    required String courseId,
    required double score,
  }) {
    Student? student = _findStudentOrNull(studentId);

    if (student == null) {
      throw Exception('Student $studentId not found');
    }

    Course? course = _findCourseOrNull(courseId);

    if (course == null) {
      throw Exception('Course $courseId not found');
    }

    if (!course.studentIds.contains(studentId)) {
      throw Exception(
        'Student $studentId is not enrolled in course $courseId',
      );
    }

    if (score < 0 || score > 100) {
      throw Exception('Score must be between 0 and 100');
    }
    // Allow only one result per student per course.
    bool alreadyHasResult = results.any(
      (result) =>
          result.studentId == studentId &&
          result.courseId == courseId,
    );

    if (alreadyHasResult) {
      throw Exception(
        'Student $studentId already has a result for $courseId',
      );
    }

    final result = CourseResult(
      id: 'R${_nextResultId++}',
      studentId: studentId,
      courseId: courseId,
      score: score,
    );

    results.add(result);

    return result;
  }
  //Task 5 — Remove a student result
  void removeResult({required String resultId}) {
    CourseResult? result = _findResultOrNull(resultId);

    if (result == null) {
      throw Exception('Result $resultId not found');
    }

    results.remove(result);
  }

  CourseResult? _findResultOrNull(String resultId) {
    for (CourseResult r in results) {
      if (r.id == resultId) {
        return r;
      }
    }

    return null;
  }
}
