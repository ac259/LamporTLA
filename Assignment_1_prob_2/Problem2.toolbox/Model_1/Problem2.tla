------------------------------ MODULE Problem2 ------------------------------
EXTENDS Integers
VARIABLES x,y

Init == (x = 1) /\ (y = 0)

Same == \/ /\ (x = y)
           /\ x' = x + 1
         
Diff == \/ /\ (x > y) \/ (x < y)
           /\ y' = y + 1
   
          
Next == Same \/ Diff


=============================================================================
\* Modification History
\* Last modified Mon Sep 16 01:02:19 EDT 2019 by Ani
\* Created Mon Sep 16 00:51:19 EDT 2019 by Ani
