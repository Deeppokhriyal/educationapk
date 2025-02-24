class UserModel {

  final String uid;
  final String name;
  final String email;
  final String photoUrl;
  final String grade;
  final String totalClasses;
  final String presents;
  final String absents;
  final String leaves;
  final String leavesLeft;


  UserModel(
      this.uid,
      this.name,
      this.email,
      this.photoUrl,
      this.grade,
      this.totalClasses,
      this.presents,
      this.absents,
      this.leaves,
      this.leavesLeft,
      );

  Map<String,dynamic> toJson()=>{
    'uid':uid,
    'name':name,
    'email':email,
    'photoUrl':photoUrl,
    'grade':grade,
    'totalClasses':totalClasses,
    'presents':presents,
    'absents':absents,
    'leaves':leaves,
    'leavesLeft':leavesLeft,
  };

}