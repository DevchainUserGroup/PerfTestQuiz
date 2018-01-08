pragma solidity ^0.4.18;



contract PerfTestQuiz
{
   address public _owner;


    struct MyStruct {
       uint value1;
       string value2;
    }


   // Constructor
   function PerfTestQuiz() public {
    _owner = msg.sender;
   }
 
  /*============= STORAGE RELATED PATTERNS =============*/

  /* ... TO BE COMMENTED */
   function code1 (uint x) public pure {
    if ( x > 5)
      if ( x*x < 20) {
        //Do someting : ....
      }
  }

  /* ... TO BE COMMENTED */
   function code2 (uint x) public pure {
      if (x > 5)
        if (x > 1) { //opaque predicate
            /*Do someting: ....*/
        } 
    }


    /* ... TO BE COMMENTED */
    uint public storageVar=0;
    function storage1() public {
      storageVar = 100;
      uint sum=0;
      for (uint i = 1 ; i <= 100 ; i++)
        sum += i;
      storageVar += sum;
    }

    /* ... TO BE COMMENTED */
    function storage2 () public {
      uint sum=0;
      for (uint i = 1 ; i <= 100 ; i++)
        sum += i;
      storageVar += sum+100; 
    }  


    /* ... TO BE COMMENTED */
    mapping (uint => MyStruct) public mystructs0;
    function arrays0() public {
      mapping (uint => MyStruct) mystructs00 = mystructs0;
      MyStruct  memory ms;
      for (uint i = 1 ; i <= 100 ; i++) {
        ms.value1=i;
        ms.value2="a";
        mystructs00[i] = ms;
      }
    } 


    /* ....  */
    mapping (uint => MyStruct) public mystructs1;
    function arrays1() public {
       MyStruct memory  ms;
      for (uint i = 1 ; i <= 100 ; i++) {
        ms.value1=i;
        ms.value2="a";
        mystructs1[i] = ms;
      }
    } 

    /* ... TO BE COMMENTED */
    mapping (uint => MyStruct) public mystructs2;
    function arrays2() public {
      for (uint i = 1 ; i <= 100 ; i++) {
        mystructs2[i].value1 = i;
        mystructs2[i].value2 = "a";
      }
    } 

    /* ... TO BE COMMENTED */
    mapping (uint => MyStruct) public mystructs3;
    function arrays3() public returns (MyStruct) {
      MyStruct storage ms;
      for (uint i = 1 ; i <= 100 ; i++) {
        ms.value1=i;
        ms.value2="a";
        mystructs3[i] = ms;
      }

      return ms;
    } 


  /*======================= LOOP RELATED PATTERNS ========================================================*/
 
    /* ... TO BE COMMENTED */
    uint public sumStorage=0;
    uint endLoop = 100;
    function loop1 () public returns (uint) {
      for (uint i = 1 ; i <= endLoop ; i++)
        sumStorage += i;
      return sumStorage; 
    }

    /* ... TO BE COMMENTED */
    function loop2 () public returns (uint) {
      for (uint i = 1 ; i <= 100 ; i++)
        sumStorage += i;
      return sumStorage; 
    }
    
    /* ... TO BE COMMENTED */
    function loop3 () public  returns (uint) {
      uint sum=0;
      for (uint i = 1 ; i <= 100 ; i++)
        sum += i;

      sumStorage = sum;
      return sumStorage; 
    }
    
    /* ... TO BE COMMENTED */
    function loop4 () public  pure returns (uint) {
      uint sum = 0;
      for (uint i = 1 ; i <= 100 ; i++)
        sum += i;
      return sum; 
    }

    /* ... TO BE COMMENTED */
    function loop5 () public pure returns (uint) {
        return 5050; 
    }

    /* ... TO BE COMMENTED */
    function loop6(uint x) public pure {
    
    uint m = 0;
    uint v = 0;
    for (uint i = 0 ; i < x ; i++)
        m += i;

    for (uint j = 0 ; j < x ; j++)
        v -= j; 
    }

    /* ... TO BE COMMENTED */
    function  loop7(uint x) public pure {
      
      uint m = 0;
      uint v = 0;
      for (uint i = 0 ; i < x ; i++) {
          m += i;
          v -= i; 
      }
    }

    uint x = 1;
    uint y = 2;
    /* ... TO BE COMMENTED */
    function loop8(uint k) public view {
      
      uint sum = 0;
      for (uint i = 1 ; i <= k ; i++)
        sum = sum + x + y; 
    }

    /* ... TO BE COMMENTED */
    function loop9(uint k) public view {    
    uint sum = 0;
    uint delta = x+y;
    for (uint i = 1 ; i <= k ; i++)
      sum = sum + delta; 
    }

    /* ... TO BE COMMENTED */
    function loop10(uint xx , uint yy) public view returns (uint) {
    
      for (int i = 0 ; i < 100 ; i++) {
        if (xx > 0) 
          yy += xx;
      }
        
      return yy; 
    }

    /* ... TO BE COMMENTED */
    function loop11 (uint xx , uint yy) public view returns (uint) {
      
      if (xx > 0) 
        for (int i = 0 ; i < 100 ; i++) {      
            yy +=  xx;
        }
        
        return yy; 
    }
}