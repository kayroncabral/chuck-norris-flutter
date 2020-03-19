// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:chuck_norris/services/chucknorris.dart' as chucknorris;

// Create a MockClient using the Mock class provided by the Mockito package.
// Create new instances of this class in each test.
class MockClient extends Mock implements http.Client {}

const categories = ["animal","career","celebrity","dev","explicit","fashion","food","history","money","movie","music","political","religion","science","sport","travel"];

void main() {
  group('Categories page', () {
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test("Testing the network call", () async {
      final client = MockClient();

      when(client.get('https://api.chucknorris.io/jokes/categories')).thenAnswer((_) async => http.Response('["animal","career","celebrity","dev","explicit","fashion","food","history","money","movie","music","political","religion","science","sport","travel"]', 200));

      expect(await chucknorris.getCategories(client), categories);
    });

    test('should load category list', () async {});

    test('should navigate to joke page when tap an item', () async {
      final client = MockClient();

      when(client.get('https://api.chucknorris.io/jokes/categories'))
        .thenAnswer((_) async => http.Response('["animal","career","celebrity","dev","explicit","fashion","food","history","money","movie","music","political","religion","science","sport","travel"]', 200));

      final listFinder = find.byValueKey('list_categories');
      final itemFinder = find.byValueKey('item_2_text');

      await driver.scrollIntoView(itemFinder);
      expect(await driver.getText(itemFinder), 'celebrity');
    });
  });
}
