class UnboardingContent{
  String image;
  String title;
  UnboardingContent({required this.image,required this.title});
}
List<UnboardingContent>contents=[
  UnboardingContent(
    title: "Best Doctors",
    image: "assets/images/Doctors-bro.png",
  ),
  UnboardingContent(
      title: "Best Services",
      image: "assets/images/Hospital bed-bro.png",
  ),
  UnboardingContent(image: "assets/images/Top up credit-bro.png", title: "Easy Payment",)
];