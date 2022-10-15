class OnbordingScreen {
  String image;
  String title;
  String discription;

  OnbordingScreen({required this.image, required this.title, required this.discription});
}

List<OnbordingScreen> contents = [
  OnbordingScreen(
    title: 'Physical fitness',
    image: 'assets/photo.png',
    discription: "Physical fitness is a state of health and well-being and, more specifically, the ability to perform aspects of sports, occupations and daily activities "
  ),
  OnbordingScreen(
    title: 'Regular physical',
    image: 'assets/photo1.png',
    discription: "Regular physical exercises help in maintaining the performance of lungs, heart and other major body organs. It burns off excess calories and keeps our weigh "
  ),
  OnbordingScreen(
    title: 'Health fitness',
    image: 'assets/photo2.png',
    discription: "If we want better health, we need to start going gym from today. Physical Exercise: Paragraph (150 Words). Everyone wants a better and healthy body. I think you "
  ),
   OnbordingScreen(
    title: 'Health effects',
    image: 'assets/photo3.png',
    discription: "In terms of health benefits, the amount of recommended exercise depends upon the goal, the type of exercise, and the age of the person. Even doing a small amount of exercise is healthier than doing none "
  ),
];