// import 'dart:developer';
// import 'package:uni_links/uni_links.dart';
// import 'package:wlt/core/app_event.dart';
// import 'package:wlt/features/flights/flight_search/bloc/flights_serach_bloc.dart';
// import 'package:wlt/main_models/select_option.dart';
// import 'package:wlt/navigation/custom_navigation.dart';
// import 'package:wlt/navigation/routes.dart';
// import 'package:wlt/utiltiy/timestamp_covert.dart';
//
// class DeepLinksServices {
//   DeepLinksServices._();
//
//   static final DeepLinksServices _instance = DeepLinksServices._();
//
//   factory DeepLinksServices() => _instance;
//
//   /// Initializing the deep links on app start up
//   void initDeepLinks() async {
//     await _gettingInitialLink();
//     await _deepLinksListener();
//   }
//
//   /// Disposing the stream
//   void dispose() {
//     uriLinkStream.drain();
//   }
//
//   /// Getting Initial Link when the app is started up with a deep link
//   Future<void> _gettingInitialLink() async {
//     try {
//       final initialLink = await getInitialLink();
//       if (initialLink != null) {
//         final uri = Uri.parse(initialLink);
//         _handleDeepLink(uri);
//       }
//     } catch(e) {
//       // Handle error
//     }
//   }
//
//   /// Handling deep link while the app is running
//   Future<void> _deepLinksListener() async {
//     uriLinkStream.listen((Uri? uri) {
//       if (uri != null) {
//         _handleDeepLink(uri);
//       }
//     }, onError: (Object err) {
//       // Handle error
//     });
//   }
//
//   /// Handling deep link
//   /// using [url], [queryParameters], and [path] to process the deep link
//   void _handleDeepLink(Uri uri) {
//     final String url = uri.toString();
//     final Map<String, String> queryParameters = uri.queryParameters;
//     final String path = uri.path;
//     String? id = queryParameters["id"];
//     log("DEEEEEEEP LINK $path || IDDDD $id");
//
//     /// special case for [flight] search result
//     int? _tripType = queryParameters["trip_type"] == "two_way" ? 1 : 0;
//     String? _ticketClass = queryParameters["ticket_class"];
//     String? _currency = queryParameters["currency"];
//     int? _adults = int.parse(queryParameters["adults"]!);
//     int? _children = int.parse(queryParameters["childs"]!);
//     int? _infants = int.parse(queryParameters["infants"]!);
//     int? _direct = int.parse(queryParameters["direct"]!);
//     String? _origin1;
//     String? _destination1;
//     String? _departureDate1;
//     String? _origin2;
//     String? _destination2;
//     String? _returnDate2;
//     // Extract custom path parameters
//     List<String> pathSegments = uri.pathSegments;
//     if (pathSegments.length >= 5) {
//       _origin1 = pathSegments[3].split('-')[0]; // e.g., SFO
//       _destination1 = pathSegments[3].split('-')[1]; // e.g., NYC
//       _departureDate1 = pathSegments[3].split('-')[2]; // e.g., 1736719200000
//
//       _origin2 = pathSegments[4].split('-')[0]; // e.g., NYC
//       _destination2 = pathSegments[4].split('-')[1]; // e.g., SFO
//       _returnDate2 = pathSegments[4].split('-')[2]; // e.g., 1736892000000
//
//       print('Origin 1: $_origin1');
//       print('Destination 1: $_destination1');
//       print('Departure Date 1: $_departureDate1');
//       print('Origin 2: $_origin2');
//       print('Destination 2: $_destination2');
//       print('Return Date 2: $_returnDate2');
//     }
//
//     if(path.isNotEmpty) {
//       log("SUCCESSFULLY DEEEEEEEP LINK");
//       if(path == "flights/search-results") {
//         FlightsSearchBloc bloc = FlightsSearchBloc.instance;
//         bloc.tripType = _tripType;
//         bloc.ticketClass = SelectOption(_ticketClass, _ticketClass.toString());
//         bloc.adults = _adults;
//         bloc.children = _children;
//         bloc.baby = _infants;
//         bloc.isDirect = _direct;
//         bloc.cityFrom = _origin1;
//         bloc.cityTo = _destination1;
//         bloc.leavingDate = TimestampCovert.formattedDate(_departureDate1!);
//         bloc.arrivalDate = TimestampCovert.formattedDate(_returnDate2!);
//         bloc.add(Update());
//         CustomNavigator.push(Routes.MAIN_PAGES, arguments: 0);
//         bloc.clearFilter();
//         bloc.add(
//           Click(
//             arguments: {
//               "type": 1, // type "1" for search
//               "page": 1,
//             },
//           ),
//         );
//       } else {
//         CustomNavigator.push(path, arguments: id as int);
//       }
//     }
//     /// Actions depending on the deep link components
//   }
// }