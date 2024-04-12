// import '../models/food.dart';
// import '../models/order.dart';
// import '../models/restaurant.dart';
// import '../models/user.dart';
//
//
//
// final _burrito = Food(imageUrl: 'assets/images/img_1.png', name : 'Burrito', price:8.99);
// final _steak = Food(imageUrl: 'assets/images/img_2.png', name : 'Steak', price:17.99);
// final _pasta = Food(imageUrl: 'assets/images/img_3.png', name : 'Pasta', price:14.99);
// final _ramen = Food(imageUrl: 'assets/images/img_4.png', name : 'Ramen', price:13.99);
// final _pancakes = Food(imageUrl: 'assets/images/img_5.png', name : 'Pancakes', price:9.99);
// final _pizza = Food(imageUrl: 'assets/images/img_6.png', name : 'Pizza', price:20.99);
// final _burger = Food(imageUrl: 'assets/images/img_8.png', name : 'Burger', price:14.99);
// final _salmon = Food(imageUrl: 'assets/images/img_7.png', name : 'Salmon Salad', price:12.99);
//
// final _restaurant0 = Restaurant(
//     imageUrl: 'assets/images/img_9.png',
//     name: 'Restaurant 0',
//     address: '100 Main St, New York, NY',
//     rating : 5,
//     menu: [_burrito, _steak, _pasta, _ramen, _pancakes, _pizza, _burger, _salmon]
// );
// final _restaurant1 = Restaurant(
//     imageUrl: 'assets/images/img_10.png',
//     name: 'Restaurant 1',
//     address: '100 Main St, New York, NY',
//     rating : 4,
//     menu: [_steak, _pasta, _ramen, _pancakes, _pizza, _burger,]
// );
// final _restaurant2 = Restaurant(
//     imageUrl: 'assets/images/img_11.png',
//     name: 'Restaurant 2',
//     address: '100 Main St, New York, NY',
//     rating : 4,
//     menu: [_steak, _pasta,_pancakes, _pizza, _burger, _salmon]
// );
// final _restaurant3 = Restaurant(
//     imageUrl: 'assets/images/img_12.png',
//     name: 'Restaurant 3',
//     address: '100 Main St, New York, NY',
//     rating : 2,
//     menu: [_burrito, _ramen, _pancakes, _salmon]
// );
// final _restaurant4 = Restaurant(
//     imageUrl: 'assets/images/img_13.png',
//     name: 'Restaurant 4',
//     address: '100 Main St, New York, NY',
//     rating : 3,
//     menu: [_burrito, _ramen, _pancakes, _salmon]
// );
// final List<Restaurant> restaurants = [
//   _restaurant0,
//   _restaurant1,
//   _restaurant2,
//   _restaurant3,
//   _restaurant4
//
// ];
// final currentUser = User(
//     name: 'Damon',
//     orders :[
//       Order(
//         date: 'Nov 10, 2023',
//         food: _steak,
//         restaurant: _restaurant2,
//         quantity: 1,
//       ),
//       Order(
//         date: 'Nov 8, 2023',
//         food: _ramen,
//         restaurant: _restaurant0,
//         quantity: 3,
//       ),
//       Order(
//         date: 'Nov 5, 2023',
//         food: _burrito,
//         restaurant: _restaurant1,
//         quantity: 2,
//       ),
//       Order(
//         date: 'Nov 2, 2023',
//         food: _salmon,
//         restaurant: _restaurant3,
//         quantity: 1,
//       ),
//       Order(
//         date: 'Nov 1, 2023',
//         food: _pancakes,
//         restaurant: _restaurant4,
//         quantity: 1,
//       ),
//     ],
//     cart :[
//       Order(
//         date: 'Nov 11, 2023',
//         food: _burger,
//         restaurant: _restaurant2,
//         quantity: 1,
//       ),
//       Order(
//         date: 'Nov 11, 2023',
//         food: _pasta,
//         restaurant: _restaurant2,
//         quantity: 1,
//       ),
//       Order(
//         date: 'Nov 11, 2023',
//         food: _pancakes,
//         restaurant: _restaurant4,
//         quantity: 1,
//       ),
//       Order(
//         date: 'Nov 11, 2023',
//         food: _burrito,
//         restaurant: _restaurant1,
//         quantity: 2,
//       ),
//     ]
// );