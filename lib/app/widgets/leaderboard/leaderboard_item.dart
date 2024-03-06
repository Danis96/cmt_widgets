part of widgets;

class AW_Leaderboard extends StatelessWidget {
  const AW_Leaderboard({
    Key? key,
    required this.rank,
    required this.userName,
    required this.distance,
    required this.score,
    this.picture,
    this.isMyUser = false,
    this.color1 = const Color(0xFF0F99DD),
    this.color2 = const Color(0xFF394652),
    this.colorImage = const Color(0xFFE0E0E0),
  }) : super(key: key);

  final String rank;
  final String? picture;
  final String userName;
  final String distance;
  final int score;
  final bool isMyUser;
  final Color color1;
  final Color color2;
  final Color colorImage;


  @override
  Widget build(BuildContext context) {
    return Container(
     height: 50,
     decoration: BoxDecoration(border: isMyUser ? Border(left: BorderSide(color: color1, width: 9, style: BorderStyle.solid)) : null,
     gradient: isMyUser ? LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                color1.withOpacity(0.54),
                const Color.fromRGBO(183, 206, 226, 0.2),
                const Color.fromRGBO(217, 217, 217, 0.1)
              ],
            ) : null,
            ),
     child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: <Widget> [
           isMyUser ?  SizedBox(width: 3) : SizedBox(width: 12),
           Expanded(
             child: Container(
               alignment: Alignment.center,
               child: FittedBox(
    child: Text(rank , style: TextStyle(color: color1, fontSize: 16, fontWeight: FontWeight.w700),),),
    ),
             flex: 1,
           ),
           Expanded(
               child: Container(
                 child: Row(
                   children: [
                     _userImg(picture),
                     const SizedBox( width: 5),
                     Container(
                      width: 100,
                      child: Text(userName, style: TextStyle(color: color2, fontSize: 12, fontWeight: FontWeight.w500), maxLines: 1, overflow: TextOverflow.ellipsis,)),
                   ],
                 ),
               ),
               flex: 3
           ),
           Expanded(
               child: Container(
                 alignment: Alignment.center,
                 child: Text(distance, style: TextStyle(color: color2, fontSize: 12, fontWeight: FontWeight.w500)),),
               flex: 2
           ),
           Expanded(
               child: Container(
                   alignment: Alignment.center,
                   child: Text(score.toString(), style: TextStyle(color: color1, fontSize: 12, fontWeight: FontWeight.w700))),
               flex: 1
           )
         ]),
    );
  }

  Widget _userImg(String? userImg) {
    return Row (
      children: <Widget> [
        if(userImg != null && userImg != '') CircleAvatar(
          radius: 17, 
          backgroundImage: NetworkImage(userImg),
          ) else Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(color: colorImage, shape: BoxShape.circle),)
      ],
    );
  }
}
