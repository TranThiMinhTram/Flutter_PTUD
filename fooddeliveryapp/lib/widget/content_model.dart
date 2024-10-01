class UnboardingContent {
  String image;
  String title;
  String description;

  // ignore: non_constant_identifier_names
  UnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<UnboardingContent> contents = [
  UnboardingContent(
      description:
          'Pick your from out menu\n More than 35 time More than 35 time',
      image: 'images/screen1.png',
      title: 'Select from Our\n'),
  UnboardingContent(
      description:
          'Pick your from out menu\n More than 35 time More than 35 time',
      image: 'images/screen2.png',
      title: 'Select from Our\n'),
  UnboardingContent(
      description:
          'Pick your from out menu\n More than 35 time More than 35 time',
      image: 'images/screen3.png',
      title: 'Select from Our\n'),
];
