(declare-datatypes ((Pair 2)) ((par (X Y) ((pair (first X) (second Y))))))
(define-fun test ((x (Pair (_ BitVec 64) Bool)) (y (Pair (_ BitVec 64) Bool)) (tmp Bool)) (Pair (Pair (_ BitVec 64) Bool) Bool)
  (pair (pair (bvadd (first x) (first y)) (or (second x) (second y))) tmp))
