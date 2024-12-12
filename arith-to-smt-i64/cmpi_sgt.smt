(declare-datatypes ((Pair 2)) ((par (X Y) ((pair (first X) (second Y))))))
(define-fun test ((x (Pair (_ BitVec 64) Bool)) (y (Pair (_ BitVec 64) Bool)) (tmp Bool)) (Pair (Pair (_ BitVec 1) Bool) Bool)
  (pair (pair (ite (bvsgt (first x) (first y)) (_ bv1 1) (_ bv0 1)) (or (second x) (second y))) tmp))
