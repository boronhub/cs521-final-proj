(declare-datatypes ((Pair 2)) ((par (X Y) ((pair (first X) (second Y))))))
(define-fun test ((x (Pair (_ BitVec 64) Bool)) (tmp Bool)) (Pair (Pair (_ BitVec 16) Bool) Bool)
  (pair (pair ((_ extract 15 0) (first x)) (second x)) tmp))
