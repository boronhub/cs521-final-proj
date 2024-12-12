(declare-datatypes ((Pair 2)) ((par (X Y) ((pair (first X) (second Y))))))
(define-fun test ((x (Pair (_ BitVec 64) Bool)) (y (Pair (_ BitVec 64) Bool)) (tmp Bool)) (Pair (Pair (_ BitVec 64) Bool) Bool)
  (let ((tmp_0 (first y))) 
  (let ((tmp_1 (first x))) 
  (pair (pair (bvsdiv tmp_1 tmp_0) (or (and (= tmp_1 (_ bv9223372036854775808 64)) (= tmp_0 (_ bv18446744073709551615 64))) (or (second x) (second y)))) (ite (= tmp_0 (_ bv0 64)) true tmp)))))
