; ModuleID = 'probe1.3a1fbbbh-cgu.5'
source_filename = "probe1.3a1fbbbh-cgu.5"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

%"std::vec::Vec<u8>" = type { [0 x i32], { i8*, i32 }, [0 x i32], i32, [0 x i32] }

; alloc::vec::Vec<T,A>::as_mut_ptr
; Function Attrs: inlinehint nounwind
define hidden i8* @"_ZN5alloc3vec16Vec$LT$T$C$A$GT$10as_mut_ptr17h0ded27bc874334d9E"(%"std::vec::Vec<u8>"* align 4 dereferenceable(12) %self) unnamed_addr #0 {
start:
  %_2 = bitcast %"std::vec::Vec<u8>"* %self to { i8*, i32 }*
; call alloc::raw_vec::RawVec<T,A>::ptr
  %ptr = call i8* @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$3ptr17h52d813ea1815b42bE"({ i8*, i32 }* align 4 dereferenceable(8) %_2)
  br label %bb1

bb1:                                              ; preds = %start
; call core::ptr::mut_ptr::<impl *mut T>::is_null
  %_5 = call zeroext i1 @"_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17h9146b81804f91bd6E"(i8* %ptr)
  br label %bb2

bb2:                                              ; preds = %bb1
  %_4 = xor i1 %_5, true
  call void @llvm.assume(i1 %_4)
  br label %bb3

bb3:                                              ; preds = %bb2
  ret i8* %ptr
}

; <alloc::vec::Vec<T,A> as core::ops::drop::Drop>::drop
; Function Attrs: nounwind
define hidden void @"_ZN70_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17hbd6a9b60e2125187E"(%"std::vec::Vec<u8>"* align 4 dereferenceable(12) %self) unnamed_addr #1 {
start:
; call alloc::vec::Vec<T,A>::as_mut_ptr
  %_3 = call i8* @"_ZN5alloc3vec16Vec$LT$T$C$A$GT$10as_mut_ptr17h0ded27bc874334d9E"(%"std::vec::Vec<u8>"* align 4 dereferenceable(12) %self)
  br label %bb1

bb1:                                              ; preds = %start
  %0 = getelementptr inbounds %"std::vec::Vec<u8>", %"std::vec::Vec<u8>"* %self, i32 0, i32 3
  %_5 = load i32, i32* %0, align 4
; call core::ptr::slice_from_raw_parts_mut
  %1 = call { [0 x i8]*, i32 } @_ZN4core3ptr24slice_from_raw_parts_mut17hfec89ed6da4096b3E(i8* %_3, i32 %_5)
  %_2.0 = extractvalue { [0 x i8]*, i32 } %1, 0
  %_2.1 = extractvalue { [0 x i8]*, i32 } %1, 1
  br label %bb2

bb2:                                              ; preds = %bb1
  br label %bb3

bb3:                                              ; preds = %bb2
  ret void
}

; alloc::raw_vec::RawVec<T,A>::ptr
; Function Attrs: inlinehint nounwind
declare dso_local i8* @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$3ptr17h52d813ea1815b42bE"({ i8*, i32 }* align 4 dereferenceable(8)) unnamed_addr #0

; core::ptr::mut_ptr::<impl *mut T>::is_null
; Function Attrs: inlinehint nounwind
declare dso_local zeroext i1 @"_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17h9146b81804f91bd6E"(i8*) unnamed_addr #0

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #2

; core::ptr::slice_from_raw_parts_mut
; Function Attrs: inlinehint nounwind
declare dso_local { [0 x i8]*, i32 } @_ZN4core3ptr24slice_from_raw_parts_mut17hfec89ed6da4096b3E(i8*, i32) unnamed_addr #0

attributes #0 = { inlinehint nounwind "target-cpu"="generic" }
attributes #1 = { nounwind "target-cpu"="generic" }
attributes #2 = { nofree nosync nounwind willreturn }
