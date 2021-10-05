; ModuleID = 'probe1.3a1fbbbh-cgu.2'
source_filename = "probe1.3a1fbbbh-cgu.2"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

; <f64 as core::convert::num::FloatToInt<i32>>::to_int_unchecked
; Function Attrs: inlinehint nounwind
define hidden i32 @"_ZN65_$LT$f64$u20$as$u20$core..convert..num..FloatToInt$LT$i32$GT$$GT$16to_int_unchecked17h49b00070b85a7de2E"(double %self) unnamed_addr #0 {
start:
  %0 = alloca i32, align 4
  %1 = call i32 @llvm.wasm.trunc.signed.i32.f64(double %self)
  store i32 %1, i32* %0, align 4
  %2 = load i32, i32* %0, align 4
  br label %bb1

bb1:                                              ; preds = %start
  ret i32 %2
}

; Function Attrs: nounwind readnone
declare i32 @llvm.wasm.trunc.signed.i32.f64(double) #1

attributes #0 = { inlinehint nounwind "target-cpu"="generic" }
attributes #1 = { nounwind readnone }
