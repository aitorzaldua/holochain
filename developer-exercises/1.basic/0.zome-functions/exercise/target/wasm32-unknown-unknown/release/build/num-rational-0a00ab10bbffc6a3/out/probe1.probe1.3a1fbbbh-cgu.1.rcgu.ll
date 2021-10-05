; ModuleID = 'probe1.3a1fbbbh-cgu.1'
source_filename = "probe1.3a1fbbbh-cgu.1"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

%"std::alloc::Global" = type {}

; alloc::alloc::dealloc
; Function Attrs: inlinehint nounwind
define internal void @_ZN5alloc5alloc7dealloc17hc244b12799da327fE(i8* %ptr, i32 %0, i32 %1) unnamed_addr #0 {
start:
  %layout = alloca { i32, i32 }, align 4
  %2 = getelementptr inbounds { i32, i32 }, { i32, i32 }* %layout, i32 0, i32 0
  store i32 %0, i32* %2, align 4
  %3 = getelementptr inbounds { i32, i32 }, { i32, i32 }* %layout, i32 0, i32 1
  store i32 %1, i32* %3, align 4
; call core::alloc::layout::Layout::size
  %_4 = call i32 @_ZN4core5alloc6layout6Layout4size17hc1aeb3fd66a0e1f9E({ i32, i32 }* align 4 dereferenceable(8) %layout)
  br label %bb1

bb1:                                              ; preds = %start
; call core::alloc::layout::Layout::align
  %_6 = call i32 @_ZN4core5alloc6layout6Layout5align17h1dfc79d529e0b952E({ i32, i32 }* align 4 dereferenceable(8) %layout)
  br label %bb2

bb2:                                              ; preds = %bb1
  call void @__rust_dealloc(i8* %ptr, i32 %_4, i32 %_6)
  br label %bb3

bb3:                                              ; preds = %bb2
  ret void
}

; <alloc::alloc::Global as core::alloc::Allocator>::deallocate
; Function Attrs: inlinehint nounwind
define hidden void @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$10deallocate17h13d75bc87f3e6843E"(%"std::alloc::Global"* nonnull align 1 %self, i8* nonnull %ptr, i32 %0, i32 %1) unnamed_addr #0 {
start:
  %2 = alloca {}, align 1
  %layout = alloca { i32, i32 }, align 4
  %3 = getelementptr inbounds { i32, i32 }, { i32, i32 }* %layout, i32 0, i32 0
  store i32 %0, i32* %3, align 4
  %4 = getelementptr inbounds { i32, i32 }, { i32, i32 }* %layout, i32 0, i32 1
  store i32 %1, i32* %4, align 4
; call core::alloc::layout::Layout::size
  %_4 = call i32 @_ZN4core5alloc6layout6Layout4size17hc1aeb3fd66a0e1f9E({ i32, i32 }* align 4 dereferenceable(8) %layout)
  br label %bb1

bb1:                                              ; preds = %start
  %5 = icmp eq i32 %_4, 0
  br i1 %5, label %bb3, label %bb2

bb3:                                              ; preds = %bb1
  br label %bb6

bb2:                                              ; preds = %bb1
; call core::ptr::non_null::NonNull<T>::as_ptr
  %_6 = call i8* @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_ptr17h222f5e37c6a12539E"(i8* nonnull %ptr)
  br label %bb4

bb4:                                              ; preds = %bb2
  %6 = getelementptr inbounds { i32, i32 }, { i32, i32 }* %layout, i32 0, i32 0
  %_8.0 = load i32, i32* %6, align 4
  %7 = getelementptr inbounds { i32, i32 }, { i32, i32 }* %layout, i32 0, i32 1
  %_8.1 = load i32, i32* %7, align 4, !range !0
; call alloc::alloc::dealloc
  call void @_ZN5alloc5alloc7dealloc17hc244b12799da327fE(i8* %_6, i32 %_8.0, i32 %_8.1)
  br label %bb5

bb5:                                              ; preds = %bb4
  br label %bb6

bb6:                                              ; preds = %bb3, %bb5
  ret void
}

; core::alloc::layout::Layout::size
; Function Attrs: inlinehint nounwind
declare hidden i32 @_ZN4core5alloc6layout6Layout4size17hc1aeb3fd66a0e1f9E({ i32, i32 }* align 4 dereferenceable(8)) unnamed_addr #0

; core::alloc::layout::Layout::align
; Function Attrs: inlinehint nounwind
declare hidden i32 @_ZN4core5alloc6layout6Layout5align17h1dfc79d529e0b952E({ i32, i32 }* align 4 dereferenceable(8)) unnamed_addr #0

; Function Attrs: nounwind
declare dso_local void @__rust_dealloc(i8*, i32, i32) unnamed_addr #1

; core::ptr::non_null::NonNull<T>::as_ptr
; Function Attrs: inlinehint nounwind
declare dso_local i8* @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_ptr17h222f5e37c6a12539E"(i8* nonnull) unnamed_addr #0

attributes #0 = { inlinehint nounwind "target-cpu"="generic" }
attributes #1 = { nounwind "target-cpu"="generic" }

!0 = !{i32 1, i32 0}
