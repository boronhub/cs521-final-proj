(declare-datatypes ((Pair 2)) ((par (X Y) ((pair (first X) (second Y))))))
(define-fun test ((x (Pair (_ BitVec 64) Bool)) (y (Pair (_ BitVec 64) Bool)) (tmp Bool)) (Pair (Pair (_ BitVec 64) Bool) (Pair (Pair (_ BitVec 64) Bool) Bool))
  (let ((tmp_0 (or (second x) (second y)))) 
  (let ((tmp_1 (bvmul ((_ sign_extend 64) (first x)) ((_ sign_extend 64) (first y))))) 
  (pair (pair ((_ extract 63 0) tmp_1) tmp_0) (pair (pair ((_ extract 127 64) tmp_1) tmp_0) tmp)))))