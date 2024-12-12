(declare-datatypes ((Pair 2)) ((par (X Y) ((pair (first X) (second Y))))))
(define-fun test ((tmp Bool)) (Pair (Pair (_ BitVec 64) Bool) Bool)
  (pair (pair (_ bv324 64) false) tmp))
