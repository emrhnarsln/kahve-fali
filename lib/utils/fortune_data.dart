import 'dart:math';

final Map<String, List<String>> moodFortunes = {
  'mutlu': [
    'Bugün mutluluğun paylaştıkça artacak!',
    'Gülen yüzün şans getirecek.',
    'Pozitif enerjin etrafındakileri etkileyecek.',
  ],
  'üzgün': [
    'Her karanlık gecenin sonunda bir güneş doğar.',
    'Bugün biraz dinlenmeye ihtiyacın var.',
    'İçini dökmek iyi gelebilir.',
  ],
  'kızgın': [
    'Sakin ol, her şey yoluna girecek.',
    'Öfkeni sevdiğin biriyle paylaşma.',
    'Derin bir nefes al, geçecek.',
  ],
  'heyecanlı': [
    'Bugün yeni başlangıçlar için harika!',
    'Bu enerjini yeni bir projeye yönelt!',
    'Heyecanın sana ilham getirecek.',
  ],
  'yorgun': [
    'Dinlenmek, üretkenliğin anahtarıdır.',
    'Bugün kendine vakit ayır.',
    'Yavaşla, bedenin sana mesaj veriyor.',
  ],
};

String getRandomFortune(String mood) {
  final list = moodFortunes[mood] ?? [];
  return list.isEmpty
      ? 'Fal verisi bulunamadı.'
      : list[Random().nextInt(list.length)];
}
