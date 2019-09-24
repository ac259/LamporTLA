----------------------------- MODULE ThreeBean -----------------------------
EXTENDS Integers
CONSTANTS M, N, O
ASSUME /\ M \in 1..100
       /\ N \in 1..100
       /\ O \in 1..100
       /\ M+N+O > 0

(*
--fair algorithm ThreebeansAlg {
   variable r=M,g=N,b=O;
  {S:while (TRUE)
     { either 
      {await (r>1); \* \* same color and red
          r:=r-2;
          };
       or
     {await (g>1); \* \* same color and green
          g:= g-2; 
         };            
       or
     {await (b>1); \* \* same color and blue
          b:= b-2;
          };
       or
     {await (r>0 /\ g>0); \* \* one red and one green
           r:=r-1;
           g:=g-1;
           b:=b+1;
           };
       or
    {await (g>0 /\ b>0); \* \* one blue and one green
          g:=g-1;
          b:=b-1;
          r:=r+1;
          };
       or
    {await (b>0 /\ r>0); \* \* one blue and one red
          b:= b-1;
          r:=r-1;
          g:=g+1;
         };            
      }
    }
   }
*)
\* BEGIN TRANSLATION
VARIABLES r, g, b

vars == << r, g, b >>

Init == (* Global variables *)
        /\ r = M
        /\ g = N
        /\ b = O

Next == \/ /\ (r>1)
           /\ r' = r-2
        \/ /\ (g>1)
           /\ g' = g-2
        \/ /\ (b>1)
           /\ b' = b-2
        \/ /\ (r>0 /\ g>0)
           /\ r'=r-1
           /\ g'=g-1
           /\ b'=b+1
        \/ /\ (g>0 /\ b>0)
           /\ r'=r+1
           /\ g'=g-1
           /\ b'=b-1
        \/ /\ (r>0 /\ b>0)
           /\ r'=r-1
           /\ g'=g+1
           /\ b'=b-1
Spec == /\ Init /\ [][Next]_vars
        /\ WF_vars(Next)

\* END TRANSLATION

TypeOK ==  \* /\ r \in 0..100
           \* /\ g \in 0..100
           \* /\ b \in 0..100
           r+g+b>0
NonTermination == r+g+b>1
Termination == <> (r+g+b < 2)


=============================================================================
\* Modification History
\* Last modified Mon Sep 16 12:02:39 EDT 2019 by Ani
\* Created Mon Sep 16 11:43:50 EDT 2019 by Ani

Consider a can of coffee beans.

Each bean is either red, blue or green.  The can is initially
nonempty (r+g+b>0).  Now consider the following program: 

Choose two beans from the can;

- if they are the same color, toss them both out 

- if they are different colors, toss them out and put in a bean of third color


This action is repeated.

