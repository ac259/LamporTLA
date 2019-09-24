------------------------------ MODULE Problem2 ------------------------------
EXTENDS Naturals
VARIABLES x,y

Init == (x = 1) /\ (y = 0)

Next == IF (x = y) THEN x = x + 1 ELSE y = y + 1

          



=============================================================================
\* Modification History
\* Last modified Mon Sep 16 01:31:54 EDT 2019 by Ani
\* Created Mon Sep 16 00:51:19 EDT 2019 by Ani
