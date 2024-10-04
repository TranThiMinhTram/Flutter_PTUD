class UnboardingContent {
  String image;
  String title;
  String description;
  UnboardingContent(
      {required this.description, required this.image, required this.title});
}

List<UnboardingContent> contents = [
  UnboardingContent(
      description: '  Welcome to our vegetarian food app  ',
      image: "images/logo.png",
      title: "Greenfare"),
  UnboardingContent(
      description:
          "Discover delicious and nutritious vegetarian dishes right here!",
      image: "images/screen2.png",
      title: "")
];
