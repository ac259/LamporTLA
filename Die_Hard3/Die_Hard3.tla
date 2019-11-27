----------------------------- MODULE Die_Hard3 -----------------------------
EXTENDS Integers,  TLC

(* --algorithm diehard 
variables small \in 0..3; big \in 0..5;
begin
    while TRUE do
       assert big \in 0..5;
       assert small \in 0..3;
       either 
            big := 5;  \* FillBigJug
       or 
            small := 3;    \*FillSmallJug
       or 
            big := 0;     \*EmptyBigJug           
       or 
            small := 0;   \*EmptySmallJug
       or 
            if big + small <= 5     \* SmallToBig
            then 
                big := big + small; 
                small := 0;
            else 
                big := 5;
                small :=  small  - (5 - big);   
             end if;
        or                          \* BigToSmall
            if big + small <= 3
            then big := 0;
                 small := big + small;
            else
                big := small - (3 - big);
                small := 3;
            end if;
        end either;     
    end while;   
end algorithm;
 *)
\* BEGIN TRANSLATION
VARIABLES small, big

vars == << small, big >>

Init == (* Global variables *)
        /\ small \in 0..3
        /\ big \in 0..5

Next == /\ Assert(big \in 0..5, "Failure of assertion at line 8, column 8.")
        /\ Assert(small \in 0..3, 
                  "Failure of assertion at line 9, column 8.")
        /\ \/ /\ big' = 5
              /\ small' = small
           \/ /\ small' = 3
              /\ big' = big
           \/ /\ big' = 0
              /\ small' = small
           \/ /\ small' = 0
              /\ big' = big
           \/ /\ IF big + small <= 5
                    THEN /\ big' = big + small
                         /\ small' = 0
                    ELSE /\ big' = 5
                         /\ small' = small  - (5 - big')
           \/ /\ IF big + small <= 3
                    THEN /\ big' = 0
                         /\ small' = big' + small
                    ELSE /\ big' = small - (3 - big)
                         /\ small' = 3

Spec == Init /\ [][Next]_vars

\* END TRANSLATION
=============================================================================
\* Modification History
\* Last modified Tue Nov 26 13:22:00 EST 2019 by Ani
\* Created Tue Nov 26 12:14:55 EST 2019 by Ani
