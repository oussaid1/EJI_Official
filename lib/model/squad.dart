import 'package:EJI/model/player.dart';

class Squad {
  String id;
  Player pGK;
  Player pCB5;
  Player pCB4;
  Player pLB;
  Player pRB;
  Player pDMF;
  Player pCMF;
  Player pLMF;
  Player pRMF;
  Player pAMF;
  Player pRWF;
  Player pLWF;
  Player pSS;
  Player pCF;

  Squad.main433({List<Player> list11Players}) {

    this.pCF = list11Players[0];
    this.pCB5 = list11Players[1];
    this.pCB4 = list11Players[2];
    this.pRB = list11Players[3];
    this.pLB = list11Players[4];
    this.pCMF = list11Players[5];
    this.pRMF = list11Players[6];
    this.pLMF = list11Players[7];
    this.pLWF = list11Players[8];
    this.pRWF = list11Players[9];
    
  }

  Squad.main4123({
    this.id,
    this.pGK,
    this.pCB5,
    this.pCB4,
    this.pRB,
    this.pLB,
    this.pAMF,
    this.pCF,
    this.pCMF,
    this.pDMF,
    this.pLMF,
    this.pLWF,
    this.pRMF,
    this.pRWF,
    this.pSS,
  });
}
