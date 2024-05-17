class TeacherModel {
  final String name;
  final String price;
  final String subjectName;
  final String image;

  TeacherModel(
      {required this.image,
      required this.name,
      required this.price,
      required this.subjectName});

  static List<TeacherModel> teacherModel = [
    TeacherModel(
        name: 'MR.Mohamed Ali',
        price: '4,500 EGP',
        subjectName: "Math subject",
        image: 'assets/teacher_images/tech1.webp'),
    TeacherModel(
        name: 'MR.Ahmed Ali',
        price: '4,800 EGP',
        subjectName: "Science subject",
        image: 'assets/teacher_images/tech2.jpg'),
    TeacherModel(
        name: 'MR.Ameer Ibrahim',
        price: '5,000 EGP',
        subjectName: "Math subject",
        image: 'assets/teacher_images/tech3.jpg'),
    TeacherModel(
        name: 'MR.Nasser mousa',
        price: '7,500 EGP',
        subjectName: "English subject",
        image: 'assets/teacher_images/tech4.jpg'),
    TeacherModel(
        name: 'MR.Ali Emam',
        price: '6000 EGP',
        subjectName: "Math subject",
        image: 'assets/teacher_images/tech5.jfif'),
    TeacherModel(
        name: 'MR.Mohamed Hassan',
        price: '5,500 EGP',
        subjectName: "Chemistry subject",
        image: 'assets/teacher_images/tech6.jfif'),

  ];
}
