/-  *rat
/+  *test, *rat
::
|%
++  test-normalize
  ;:  weld
    %+  expect-eq  !>  (norm:rt `rat`[& 6 3])  !>  `rat`[& 2 1]
    %+  expect-eq  !>  (norm:rt `rat`[| 10 15])  !>  `rat`[| 2 3]
  ==
++  test-multiply
  ;:  weld
    %+  expect-eq
      !>  `rat`[| 1 3]
      !>  (mul:rt [| 2 3] [| 1 2])
    %+  expect-eq  :: With negative sign
      !>  `rat`[& 6 1]
      !>  (mul:rt [| 10 7] [& 21 5])
    %+  expect-eq  :: Both negative
      !>  `rat`[| 180 77]
      !>  (mul:rt [& 9 7] [& 20 11])
  ==
++  test-divide
  ;:  weld
    %+  expect-eq
      !>  `rat`[| 7 10]
      !>  (div:rt [| 3 5] [| 6 7])
  ==
++  test-add
  ;:  weld
    %+  expect-eq
      !>  `rat`[| 7 6]
      !>  (add:rt [| 1 2] [| 2 3])
    %+  expect-eq
      !>  `rat`[& 1 6]
      !>  (add:rt [| 1 2] [& 2 3])
    %+  expect-eq
      !>  `rat`[& 3 1]
      !>  (add:rt [& 3 5] [& 12 5])
    %+  expect-eq
      !>  `rat`[& 27 70]
      !>  (add:rt [& 11 10] [| 5 7])
  ==
++  test-sub
  ;:  weld
    %+  expect-eq
      !>  `rat`[| 1 5]
      !>  (sub:rt [| 1 4] [| 1 20])
    %+  expect-eq
      !>  `rat`[& 2 1]
      !>  (sub:rt [| 6 20] [| 46 20])
  ==
::
++  test-fmt
  ;:  weld
    %+  expect-eq
      !>  "0.33"
      !>  (fmt:rt `rat`[| 1 3] 2)
    %+  expect-eq
      !>  "21.1"
      !>  (fmt:rt `rat`[| 169 8] 1)
    %+  expect-eq
      !>  "21.125"
      !>  (fmt:rt `rat`[| 169 8] 3)
   %+  expect-eq
     !>  "21.125"
     !>  (fmt:rt `rat`[| 169 8] 10)
   %+  expect-eq
     !>  "21"
     !>  (fmt:rt `rat`[| 168 8] 10)
  ==
--
