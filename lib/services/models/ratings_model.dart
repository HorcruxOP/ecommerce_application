class Ratings {
  int? totalRatings;
  double? averageRating;

  Ratings({this.totalRatings, this.averageRating});

  Ratings.fromJson(Map<String, dynamic> json) {
    totalRatings = json['totalRatings'];
    averageRating = json['averageRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['totalRatings'] = totalRatings;
    data['averageRating'] = averageRating;
    return data;
  }
}
