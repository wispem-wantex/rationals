/-  *rat
::
|%
++  rt
  |%
  ::
  :: Reduce by dividing num and den by their GCD
  ++  norm
    |=  [a=rat]
    ^-  rat
    =/  gcd  -:(egcd num.a den.a)
    [sign.a (^div num.a gcd) (^div den.a gcd)]
  ::
  :: Arithmetic operations
  ++  mul
    |=  [a=rat b=rat]
    ^-  rat
    %-  norm
    [?!(=(sign.a sign.b)) (^mul num.a num.b) (^mul den.a den.b)]
  ++  div
    |=  [a=rat b=rat]
    ^-  rat
    %-  norm
    [?!(=(sign.a sign.b)) (^mul num.a den.b) (^mul den.a num.b)]
  ++  add
    |=  [a=rat b=rat]
    ^-  rat
    %-  norm
    =/  num1  (^mul num.a den.b)
    =/  num2  (^mul num.b den.a)
    =/  den  (^mul den.a den.b)
    ?:  =(sign.a sign.b)
      [sign.a (^add num1 num2) den]
    ::
    :: Signs differ; figure out which is larger
    ?:  (gth num1 num2)
      [sign.a (^sub num1 num2) den]
    [sign.b (^sub num2 num1) den]
  ++  sub
    |=  [a=rat b=rat]
    ^-  rat
    (add a b(sign ?!(sign.b)))
  ::
  :: Format a rational as a decimal number
  ++  fmt
    |=  [a=rat num-decimals=@]
    ^-  tape
    =/  result=[d=@du r=@du]  (dvr num.a den.a)
    =/  ret  (scow %ud d.result)
    ?:  ?|  =(r.result 0)  =(num-decimals 0)  ==
      ret
    :: Decimals are required
    =.  ret  (weld ret ".")
    =.  result  (dvr (^mul 10 r.result) den.a)
    |-
      ?:  =(num-decimals 0)
        ret
      ?:  =(r.result 0)
        (weld ret (scow %ud d.result))
      %=  $
        num-decimals   (dec num-decimals)
        result  (dvr (^mul 10 r.result) den.a)
        ret            (weld ret (scow %ud d.result))
      ==
  --
--
