// One-time asset-curation script — fetches real, licensed photos from Pexels
// (Pexels License: free for commercial use, no attribution required) into
// assets/images/. Not part of the shipped app; run with `dart run
// tool/fetch_pexels_images.dart`.
import 'dart:convert';
import 'dart:io';

const _apiKey = 'SHsLFJH5fC7yjIpeRJ25QV9MbLcC3U3LbTo4MuEASB4OiSyDaJLRq05Y';

class _Job {
  const _Job(this.filename, this.query, this.index);
  final String filename;
  final String query;
  final int index;
}

const _jobs = [
  _Job('hair_braids_1', 'box braids hairstyle', 0),
  _Job('makeup_1', 'makeup artist applying makeup', 0),
  _Job('makeup_2', 'makeup artist applying makeup', 1),
  _Job('makeup_3', 'bridal makeup', 0),
  _Job('nails_1', 'nail art manicure', 0),
  _Job('nails_2', 'nail art manicure', 1),
  _Job('nails_3', 'gel nails manicure', 0),
  _Job('spa_1', 'spa massage', 0),
  _Job('spa_2', 'facial spa treatment', 0),
  _Job('spa_3', 'spa massage', 1),
  _Job('portrait_1', 'woman portrait smiling', 0),
  _Job('portrait_2', 'woman portrait smiling', 1),
  _Job('portrait_3', 'man portrait smiling', 0),
  _Job('portrait_4', 'woman portrait smiling', 2),
];

Future<void> main() async {
  final client = HttpClient();
  final credits = StringBuffer('# Photo credits (Pexels License)\n\n');
  for (final job in _jobs) {
    try {
      final credit = await _fetchAndSave(client, job);
      credits.writeln('- ${job.filename}.jpg — $credit');
      print('OK ${job.filename}.jpg');
    } catch (e) {
      print('FAILED ${job.filename}: $e');
    }
  }
  client.close();
  await File('assets/images/CREDITS.md').writeAsString(credits.toString());
}

Future<String> _fetchAndSave(HttpClient client, _Job job) async {
  final searchUri = Uri.https('api.pexels.com', '/v1/search', {
    'query': job.query,
    'per_page': '5',
    'orientation': 'square',
  });
  final req = await client.getUrl(searchUri);
  req.headers.set('Authorization', _apiKey);
  final res = await req.close();
  final body = await res.transform(utf8.decoder).join();
  if (res.statusCode != 200) {
    throw Exception('search failed (${res.statusCode}): $body');
  }
  final data = jsonDecode(body) as Map<String, dynamic>;
  final photos = data['photos'] as List<dynamic>;
  if (photos.isEmpty) {
    throw Exception('no results for "${job.query}"');
  }
  final photo =
      photos[job.index.clamp(0, photos.length - 1)] as Map<String, dynamic>;
  final src = (photo['src'] as Map<String, dynamic>)['large'] as String;
  final photographer = photo['photographer'] as String;
  final url = photo['url'] as String;

  final imgReq = await client.getUrl(Uri.parse(src));
  final imgRes = await imgReq.close();
  final bytes = <int>[];
  await for (final chunk in imgRes) {
    bytes.addAll(chunk);
  }
  await File('assets/images/${job.filename}.jpg').writeAsBytes(bytes);
  return 'Photo by $photographer on Pexels ($url)';
}
