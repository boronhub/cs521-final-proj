(declare-datatypes ((Pair 2)) ((par (X Y) ((pair (first X) (second Y))))))
(define-fun test ((x (Pair (_ BitVec 64) Bool)) (y (Pair (_ BitVec 64) Bool)) (tmp Bool)) (Pair (Pair (_ BitVec 64) Bool) Bool)
  (let ((tmp_0 (first y))) 
  (pair (pair (bvshl (first x) tmp_0) (or (bvugt tmp_0 (_ bv64 64)) (or (second x) (second y)))) tmp)))
