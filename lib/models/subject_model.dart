class SubjectModel {
  final String name;
  final String image;

  SubjectModel({required this.name, required this.image});
  static List<SubjectModel> subjectList = [
    SubjectModel(name: 'Math', image: "assets/subject_logos/math.jpg"),
    SubjectModel(name: 'English', image: "assets/subject_logos/english.jpg"),
    SubjectModel(name: 'Biology', image: "assets/subject_logos/biology.jpg"),
    SubjectModel(name: 'France', image: "assets/subject_logos/france.jpg"),
    SubjectModel(
        name: 'Geography', image: "assets/subject_logos/geography.jpeg"),
    SubjectModel(name: 'History', image: "assets/subject_logos/history.jpg"),
    SubjectModel(
        name: 'Chemistry', image: "assets/subject_logos/chemistry.jpg"),
    SubjectModel(name: 'France', image: "assets/subject_logos/france.jpg"),
  ];
}
