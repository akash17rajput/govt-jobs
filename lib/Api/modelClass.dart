class Post {
  final String postName;
  final String company;
  final int noOfPosts;
  final String salary;
  final dynamic qualification; // Changed the type to dynamic
  final String ageLimit;
  final dynamic applicationFee;
  final String lastDate;
  final dynamic location;
  final String category;

  Post({
    required this.postName,
    required this.company,
    required this.noOfPosts,
    required this.salary,
    required this.qualification,
    required this.ageLimit,
    required this.applicationFee,
    required this.lastDate,
    required this.location,
    required this.category,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    // Handling qualification field
    final qualificationData = json['qualification'];
    String qualificationValue;

    if (qualificationData is String) {
      qualificationValue = qualificationData;
    } else if (qualificationData is Map<String, dynamic>) {
      final qualifications = qualificationData.values.toList();
      qualificationValue = qualifications.join(', ');
    } else {
      qualificationValue = '';
    }

    return Post(
      postName: json['postName'],
      company: json['Company'],
      noOfPosts: json['noOfPosts'],
      salary: json['salary'],
      qualification: qualificationValue,
      ageLimit: json['ageLimit'],
      applicationFee: json['ApplicationFee'],
      lastDate: json['LastDate'],
      location: json['Location'],
      category: json['Category'],
    );
  }
}
