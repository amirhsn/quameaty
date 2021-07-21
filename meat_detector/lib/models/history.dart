class History{
  final int id;
  final String image;
  final String hasilDeteksi;
  final String tanggal;
  final String catatan;
  final String akurasi;

  History({
    this.id,
    this.image,
    this.hasilDeteksi,
    this.tanggal,
    this.catatan,
    this.akurasi
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'hasilDeteksi': hasilDeteksi,
      'tanggal': tanggal,
      'catatan': catatan,
      'akurasi': akurasi,
    };
  }

  @override
  String toString() {
    return 'History{id: $id, hasilDeteksi: $hasilDeteksi, tanggal: $tanggal, catatan: $catatan, akurasi: $akurasi}';
  }
}