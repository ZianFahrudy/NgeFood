part of 'models.dart';

enum FoodTypes { new_food, popular, recommended }

class Food extends Equatable {
  final int id;
  final String name;
  final double rate;
  final String ingredients;
  final String description;
  final String picturePath;
  final int price;
  final List<FoodTypes> types;

  Food(
      {this.id,
      this.name,
      this.rate,
      this.picturePath,
      this.ingredients,
      this.description,
      this.price,
      this.types = const []});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      ingredients: json['ingredients'],
      picturePath: json['picturePath'],
      price: json['price'],
      rate: (json['rate'] as num).toDouble(),
      types: json['types'].toString().split(',').map((e) {
        switch (e) {
          case "recommended":
            return FoodTypes.recommended;

            break;
          case "new_food":
            return FoodTypes.new_food;
            break;
          default:
            return FoodTypes.popular;
        }
      }).toList(),
    );
  }

  @override
  List<Object> get props =>
      [id, name, rate, ingredients, description, picturePath, price, types];
}

// List<Food> mockFoods = [
//   Food(
//       id: 0,
//       foodName: "Plecing Kangkung",
//       picturePath:
//           "https://www.wartantb.com/wp-content/uploads/2018/01/PLECING-KANGKUNG-LOMBOK.jpg",
//       rate: 3.5),
//   Food(
//       id: 1,
//       foodName: "Ayam Taliwang",
//       picturePath:
//           "https://awsimages.detik.net.id/community/media/visual/2019/03/25/682a185b-268f-4148-9b06-2ac6a82c6b6c.jpeg?w=700&q=90",
//       rate: 5.0),
//   Food(
//       id: 2,
//       foodName: "Sate Bulayak",
//       picturePath:
//           "https://cdn.idntimes.com/content-images/post/20191025/sate-bulayakkk-1889c67eb0e8ae23c1581a26079096e5_600x400.jpg",
//       rate: 4.7),
//   Food(
//       id: 3,
//       foodName: "Nasi Balap Puyung",
//       picturePath:
//           "https://miro.medium.com/max/1170/1*L5f76WtUr1weFLu4rfuQYg.jpeg",
//       rate: 4.2),
//   Food(
//       id: 4,
//       foodName: "Beberok Terong",
//       picturePath:
//           "https://cdn.idntimes.com/content-images/post/20190301/52332929-418528358919558-5153667546707670433-n-880d25ac235259b15f4b731c63ac6466.jpg",
//       rate: 3.3),
//   Food(
//       id: 5,
//       foodName: "Sate Rembiga",
//       picturePath:
//           "https://cdn.idntimes.com/content-images/post/20190301/35617979-1789655641121891-6318667761736220672-n-bfede2b4617ac813aa0e3e20a4243504.jpg",
//       rate: 2.6),
// ];

List<Food> mockFoods = [
  Food(
      id: 1,
      picturePath: "http://kbu-cdn.com/dk/wp-content/uploads/sate-ayam.jpg",
      name: "Sate Sayur Sultan",
      description:
          "Sate Sayur Sultan adalah menu sate vegan paling terkenal di Bandung. Sate ini dibuat dari berbagai macam bahan bermutu tinggi. Semua bahan ditanam dengan menggunakan teknologi masa kini sehingga memiliki nutrisi yang kaya.",
      ingredients: "Bawang Merah, Paprika, Bawang Bombay, Timun",
      price: 150000,
      rate: 4.2,
      types: [FoodTypes.new_food, FoodTypes.popular, FoodTypes.recommended]),
  Food(
      id: 2,
      picturePath:
          "https://cdns.klimg.com/dream.co.id/resources/news/2020/04/06/133546/bikin-steak-di-rumah-pastikan-bumbunya-meresap-2004066.jpg",
      name: "Steak Daging Sapi Korea",
      description: "Daging sapi Korea adalah jenis sapi paling premium di Korea. Namun, untuk menikmatinya Anda tidak perlu jauh-jauh ke Korea Selatan. Steak Sapi Korea Oppa Bandung ini sudah terkenal di seluruh Indonesia dan sudah memiliki lebih dari 2 juta cabang.",
      ingredients: "Daging Sapi Korea, Garam, Lada Hitam",
      price: 750000,
      rate: 4.5,
      types: [FoodTypes.popular]),
  Food(
      id: 3,
      picturePath:
          "https://i1.wp.com/varminz.com/wp-content/uploads/2019/12/mexican-chopped-salad3.jpg?fit=843%2C843&ssl=1",
      name: "Mexican Chopped Salad",
      description: "Salad ala mexico yang kaya akan serat dan vitamin. Seluruh bahan diambil dari Mexico sehingga akan memiliki cita rasa yang original.",
      ingredients: "Jagung, Selada, Tomat Ceri, Keju, Wortel",
      price: 105900,
      rate: 3.9,
      types: [FoodTypes.recommended]),
  Food(
    id: 4,
    picturePath:
        "https://images.immediate.co.uk/production/volatile/sites/2/2016/08/25097.jpg?quality=90&resize=768,574",
    name: "Sup Wortel Pedas",
    description:
        "Sup wortel pedas yang unik ini cocok banget buat kalian-kalian yang suka pedas namun ingin tetap sehat. Rasanya yang unik akan memanjakan lidah Anda.",
    ingredients: "Wortel, Seledri, Kacang Tanah, Labu, Garam, Gula",
    price: 60000,
    rate: 4.9,
  ),
  Food(
      id: 5,
      picturePath:
          "https://cmxpv89733.i.lithium.com/t5/image/serverpage/image-id/478345i84598AB4FEB454CB/image-size/large?v=1.0&px=999",
      name: "Korean Raw Beef Tartare",
      description:
          "Daging sapi Korea cincang yang disajikan mentah dan disiram saus spesial dengan toping kuning telur dan taburan biji wijen.",
      ingredients: "Daging Sapi Korea, Telur, Biji Wijen",
      price: 350000,
      rate: 3.4)
];
