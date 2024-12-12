(declare-datatypes ((Pair 2)) ((par (X Y) ((pair (first X) (second Y))))))
(define-fun test ((x (Pair (_ BitVec 64) Bool)) (y (Pair (_ BitVec 64) Bool)) (tmp Bool)) (Pair (Pair (_ BitVec 64) Bool) Bool)
  (let ((tmp_0 (first y))) 
  (let ((tmp_1 (first x))) 
  (pair (pair (ite (bvugt tmp_1 tmp_0) tmp_1 tmp_0) (or (second x) (second y))) tmp))))
