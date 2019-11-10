class Category {
  String title;
  int lessonCount;
  int ltp;
  double change;
  String imagePath;

  Category({
    this.title = '',
    this.imagePath = '',
    this.lessonCount = 0,
    this.ltp = 0,
    this.change = 0.0,
  });

  static List<Category> categoryList = [
    Category(
      imagePath: 'assets/design_course/interFace1.png',
      title: 'BOC Kenya',
      lessonCount: 24,
      ltp: 25,
      change: 4.3,
    ),
    Category(
      imagePath: 'assets/design_course/interFace2.png',
      title: 'Sanlam',
      lessonCount: 22,
      ltp: 18,
      change: 4.6,
    ),
    Category(
      imagePath: 'assets/design_course/interFace1.png',
      title: 'BAT',
      lessonCount: 24,
      ltp: 25,
      change: 4.3,
    ),
    Category(
      imagePath: 'assets/design_course/interFace2.png',
      title: 'Athi River Mining',
      lessonCount: 22,
      ltp: 18,
      change: 4.6,
    ),
  ];

  static List<Category> popularCourseList = [
    Category(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'Limuru Tea',
      lessonCount: 12,
      ltp: 25,
      change: 4.8,
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Williamson Tea Kenya',
      lessonCount: 28,
      ltp: 208,
      change: 4.9,
    ),
    Category(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'CFC Stanbic Holdings',
      lessonCount: 12,
      ltp: 25,
      change: 4.8,
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Sameer Africa',
      lessonCount: 28,
      ltp: 208,
      change: 4.9,
    ),
  ];
}
