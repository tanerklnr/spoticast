class Podcast {
  final String title;
  final String publisher;
  final String description;
  final String category;
  final int episodeCount;
  final double rating;
  final String imageUrl;

  Podcast({
    required this.title,
    required this.publisher,
    required this.description,
    required this.category,
    required this.episodeCount,
    required this.rating,
    required this.imageUrl,
  });
}

// Örnek podcast verileri
final List<Podcast> samplePodcasts = [
  Podcast(
    title: 'Teknoloji Dünyası',
    publisher: 'Tech Podcast',
    description: 'En son teknoloji haberleri ve gelişmeleri',
    category: 'Teknoloji',
    episodeCount: 45,
    rating: 4.8,
    imageUrl: 'assets/images/homescreen1.jpg',
  ),
  Podcast(
    title: 'Bilim ve Keşif',
    publisher: 'Science Channel',
    description: 'Bilim dünyasından en son gelişmeler',
    category: 'Bilim',
    episodeCount: 32,
    rating: 4.6,
    imageUrl: 'assets/images/homescreen2.jpg',
  ),
  Podcast(
    title: 'Spor Analizi',
    publisher: 'Sports Talk',
    description: 'Güncel spor haberleri ve analizleri',
    category: 'Spor',
    episodeCount: 28,
    rating: 4.5,
    imageUrl: 'assets/images/homescreen3.jpg',
  ),
  Podcast(
    title: 'Müzik Tarihi',
    publisher: 'Music History',
    description: 'Müzik dünyasının tarihsel yolculuğu',
    category: 'Müzik',
    episodeCount: 56,
    rating: 4.7,
    imageUrl: 'assets/images/homescreen4.jpg',
  ),
  Podcast(
    title: 'Eğitim ve Gelişim',
    publisher: 'Education Plus',
    description: 'Kişisel gelişim ve eğitim ipuçları',
    category: 'Eğitim',
    episodeCount: 41,
    rating: 4.9,
    imageUrl: 'assets/images/homescreen5.jpg.jpg',
  ),
  Podcast(
    title: 'Güncel Olaylar',
    publisher: 'News Daily',
    description: 'Güncel haberler ve analizler',
    category: 'Haber',
    episodeCount: 67,
    rating: 4.4,
    imageUrl: 'assets/images/homescreen6.jpg',
  ),
]; 