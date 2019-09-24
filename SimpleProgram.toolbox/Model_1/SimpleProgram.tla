--------------------------- MODULE SimpleProgram ---------------------------
EXTENDS Integers
VARIABLES i,pc

Init == (pc = "start") /\ (i = 0)

Pick == \/ /\ pc = "start"
           /\ i' \in 0..1000
           /\ pc' = "middle"
           
Add1 == \/ /\ pc = "middle"
           /\ i' = i + 1
           /\ pc' = "done"
          
Next == Pick \/ Add1

=============================================================================
\* Modification History
\* Last modified Sun Sep 15 12:33:18 EDT 2019 by Ani
\* Created Sun Sep 15 12:01:56 EDT 2019 by Ani
