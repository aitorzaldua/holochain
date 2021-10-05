; ModuleID = 'probe1.3a1fbbbh-cgu.1'
source_filename = "probe1.3a1fbbbh-cgu.1"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

; core::ptr::mut_ptr::<impl *mut T>::guaranteed_eq
; Function Attrs: inlinehint nounwind
define hidden zeroext i1 @"_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$13guaranteed_eq17h76c5cda0425ebf64E"(i8* %self, i8* %other) unnamed_addr #0 {
start:
  %0 = alloca i8, align 1
  %1 = icmp eq i8* %self, %other
  %2 = zext i1 %1 to i8
  store i8 %2, i8* %0, align 1
  %3 = load i8, i8* %0, align 1, !range !0
  %4 = trunc i8 %3 to i1
  br label %bb1

bb1:                                              ; preds = %start
  ret i1 %4
}

; core::ptr::mut_ptr::<impl *mut T>::cast
; Function Attrs: inlinehint nounwind
define hidden {}* @"_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$4cast17h0dd756f86e00c6eeE"(i8* %self) unnamed_addr #0 {
start:
  %0 = bitcast i8* %self to {}*
  ret {}* %0
}

; core::ptr::mut_ptr::<impl *mut T>::is_null
; Function Attrs: inlinehint nounwind
define hidden zeroext i1 @"_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17hbd183bb38adb55eaE"(i8* %self) unnamed_addr #0 {
start:
  br label %bb1

bb1:                                              ; preds = %start
; call core::ptr::mut_ptr::<impl *mut T>::guaranteed_eq
  %0 = call zeroext i1 @"_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$13guaranteed_eq17h76c5cda0425ebf64E"(i8* %self, i8* null)
  br label %bb2

bb2:                                              ; preds = %bb1
  ret i1 %0
}

attributes #0 = { inlinehint nounwind "target-cpu"="generic" }

!0 = !{i8 0, i8 2}
