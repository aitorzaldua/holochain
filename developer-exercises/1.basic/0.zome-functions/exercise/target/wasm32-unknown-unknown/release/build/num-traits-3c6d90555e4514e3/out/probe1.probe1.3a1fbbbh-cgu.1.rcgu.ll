; ModuleID = 'probe1.3a1fbbbh-cgu.1'
source_filename = "probe1.3a1fbbbh-cgu.1"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

; probe1::probe
; Function Attrs: nounwind
define hidden void @_ZN6probe15probe17h8e14904c6c5c619cE() unnamed_addr #0 {
start:
; call core::f64::<impl f64>::to_int_unchecked
  %_1 = call i32 @"_ZN4core3f6421_$LT$impl$u20$f64$GT$16to_int_unchecked17h5463583f92d95f41E"(double 1.000000e+00)
  br label %bb1

bb1:                                              ; preds = %start
  ret void
}

; core::f64::<impl f64>::to_int_unchecked
; Function Attrs: inlinehint nounwind
declare dso_local i32 @"_ZN4core3f6421_$LT$impl$u20$f64$GT$16to_int_unchecked17h5463583f92d95f41E"(double) unnamed_addr #1

attributes #0 = { nounwind "target-cpu"="generic" }
attributes #1 = { inlinehint nounwind "target-cpu"="generic" }
