class Course {
  final String courseName;
  final double LetterValue;
  final double creditValue;

  Course(
      {required this.courseName,
      required this.LetterValue,
      required this.creditValue});
  @override
  String toString() {
    // TODO: implement toString
    return "$courseName $LetterValue $creditValue";
  }
}
