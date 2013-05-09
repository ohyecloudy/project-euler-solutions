;;;; solution for project euler
;;;; #71 Ordered fractions
;;;; http://projecteuler.net/problem=71
;;;; 
;;;; ohyecloudy, 2013-05-09

;;; [2/5, 3/7] 사이에서 가장 큰 수를 구하는 문제가 된다.
(ns problem-071)

(defn gcd [a b]
  (if (zero? a)
    b
    (recur (rem b a) a)))

(defn reduced-proper-fractions [n]
  (map 
    #(/ % n) 
    (filter #(= (gcd % n) 1) (range 1 n))))

(defn max-in-range [min-val max-val s]
  (last
    (take-while #(< % max-val) 
                (drop-while #(<= % min-val) s))))

(reduce max 
        (filter #(not (nil? %))
                (map #(max-in-range 2/5 3/7
                                    (reduced-proper-fractions %))
                     (range 1 1000))))

