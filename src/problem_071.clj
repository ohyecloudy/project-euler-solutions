;;;; solution for project euler
;;;; #71 Ordered fractions
;;;; http://projecteuler.net/problem=71
;;;; 
;;;; ohyecloudy, 2013-05-09

;;; 시도 1 - upper bound를 무식하게 구함 
;;; * 1부터 하나씩 증가하며 3/7보다 작은지 검사
;;; * 세월아 네월아
;;; 시도 2 - upper bound를 b < ad/c로 구함

(ns problem-071)

(defn coprime? [a b]
  (letfn [(gcd [a b]
            (if (zero? a)
              b
              (recur (rem b a) a)))]
    (= (gcd a b) 1)))

(defn numerator-seq [n]
  (let [upper (/ (* n 3) 7)]
    (range
      (if (= upper (int upper))
        (dec (int upper))
        (int upper))
      0 -1)))

; rpf: reduced-proper-fractions
(defn max-rpf [n]
  (let [-max (first (take-while #(coprime? n %) (numerator-seq n)))]
    (if (nil? -max)
      0
      (/ -max n))))

(time
  (reduce max
          (map max-rpf (range 1 (inc 1000000)))))

