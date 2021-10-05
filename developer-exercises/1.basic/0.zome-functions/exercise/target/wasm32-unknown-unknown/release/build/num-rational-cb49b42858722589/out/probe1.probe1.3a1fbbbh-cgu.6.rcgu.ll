; ModuleID = 'probe1.3a1fbbbh-cgu.6'
source_filename = "probe1.3a1fbbbh-cgu.6"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

; <core::ptr::non_null::NonNull<T> as core::convert::From<core::ptr::unique::Unique<T>>>::from
; Function Attrs: inlinehint nounwind
define hidden nonnull i8* @"_ZN119_$LT$core..ptr..non_null..NonNull$LT$T$GT$$u20$as$u20$core..convert..From$LT$core..ptr..unique..Unique$LT$T$GT$$GT$$GT$4from17h501f7a2fad2bac77E"(i8* nonnull %unique) unnamed_addr #0 {
start:
; call core::ptr::unique::Unique<T>::as_ptr
  %_2 = call i8* @"_ZN4core3ptr6unique15Unique$LT$T$GT$6as_ptr17hd64e2c4a84f5e768E"(i8* nonnull %unique)
  br label %bb1

bb1:                                              ; preds = %start
; call core::ptr::non_null::NonNull<T>::new_unchecked
  %0 = call nonnull i8* @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked17h7e1445bc54f2691fE"(i8* %_2)
  br label %bb2

bb2:                                              ; preds = %bb1
  ret i8* %0
}

; core::ptr::non_null::NonNull<T>::new_unchecked
; Function Attrs: inlinehint nounwind
define hidden nonnull i8* @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked17h7e1445bc54f2691fE"(i8* %ptr) unnamed_addr #0 {
start:
  %0 = alloca i8*, align 4
  store i8* %ptr, i8** %0, align 4
  %1 = load i8*, i8** %0, align 4, !nonnull !0
  ret i8* %1
}

; core::ptr::non_null::NonNull<T>::as_ptr
; Function Attrs: inlinehint nounwind
define hidden i8* @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_ptr17h05eefda701561d98E"(i8* nonnull %self) unnamed_addr #0 {
start:
  ret i8* %self
}

; core::ptr::unique::Unique<T>::as_ptr
; Function Attrs: inlinehint nounwind
declare dso_local i8* @"_ZN4core3ptr6unique15Unique$LT$T$GT$6as_ptr17hd64e2c4a84f5e768E"(i8* nonnull) unnamed_addr #0

attributes #0 = { inlinehint nounwind "target-cpu"="generic" }

!0 = !{}
