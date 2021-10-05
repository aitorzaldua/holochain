; ModuleID = 'probe1.3a1fbbbh-cgu.9'
source_filename = "probe1.3a1fbbbh-cgu.9"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

%"std::string::String" = type { [0 x i32], %"std::vec::Vec<u8>", [0 x i32] }
%"std::vec::Vec<u8>" = type { [0 x i32], { i8*, i32 }, [0 x i32], i32, [0 x i32] }

; core::num::nonzero::NonZeroUsize::new_unchecked
; Function Attrs: inlinehint nounwind
define internal i32 @_ZN4core3num7nonzero12NonZeroUsize13new_unchecked17h93cf8a70d3a8953cE(i32 %n) unnamed_addr #0 {
start:
  %0 = alloca i32, align 4
  store i32 %n, i32* %0, align 4
  %1 = load i32, i32* %0, align 4, !range !0
  ret i32 %1
}

; core::num::nonzero::NonZeroUsize::get
; Function Attrs: inlinehint nounwind
define internal i32 @_ZN4core3num7nonzero12NonZeroUsize3get17hfecf577b5f3227deE(i32 %self) unnamed_addr #0 {
start:
  ret i32 %self
}

; core::ptr::slice_from_raw_parts_mut
; Function Attrs: inlinehint nounwind
define hidden { [0 x i8]*, i32 } @_ZN4core3ptr24slice_from_raw_parts_mut17hfec89ed6da4096b3E(i8* %data, i32 %len) unnamed_addr #0 {
start:
  %0 = bitcast i8* %data to {}*
  br label %bb1

bb1:                                              ; preds = %start
; call core::ptr::metadata::from_raw_parts_mut
  %1 = call { [0 x i8]*, i32 } @_ZN4core3ptr8metadata18from_raw_parts_mut17hd6a1dce2dc1794ceE({}* %0, i32 %len)
  %2 = extractvalue { [0 x i8]*, i32 } %1, 0
  %3 = extractvalue { [0 x i8]*, i32 } %1, 1
  br label %bb2

bb2:                                              ; preds = %bb1
  %4 = insertvalue { [0 x i8]*, i32 } undef, [0 x i8]* %2, 0
  %5 = insertvalue { [0 x i8]*, i32 } %4, i32 %3, 1
  ret { [0 x i8]*, i32 } %5
}

; core::ptr::drop_in_place<alloc::string::String>
; Function Attrs: nounwind
define hidden void @"_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h30092645c0b27462E"(%"std::string::String"* %_1) unnamed_addr #1 {
start:
  %0 = bitcast %"std::string::String"* %_1 to %"std::vec::Vec<u8>"*
; call core::ptr::drop_in_place<alloc::vec::Vec<u8>>
  call void @"_ZN4core3ptr46drop_in_place$LT$alloc..vec..Vec$LT$u8$GT$$GT$17haeed634b99b8e277E"(%"std::vec::Vec<u8>"* %0)
  br label %bb1

bb1:                                              ; preds = %start
  ret void
}

; core::ptr::drop_in_place<alloc::vec::Vec<u8>>
; Function Attrs: nounwind
define hidden void @"_ZN4core3ptr46drop_in_place$LT$alloc..vec..Vec$LT$u8$GT$$GT$17haeed634b99b8e277E"(%"std::vec::Vec<u8>"* %_1) unnamed_addr #1 {
start:
; call <alloc::vec::Vec<T,A> as core::ops::drop::Drop>::drop
  call void @"_ZN70_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17hbd6a9b60e2125187E"(%"std::vec::Vec<u8>"* align 4 dereferenceable(12) %_1)
  br label %bb2

bb2:                                              ; preds = %start
  %0 = bitcast %"std::vec::Vec<u8>"* %_1 to { i8*, i32 }*
; call core::ptr::drop_in_place<alloc::raw_vec::RawVec<u8>>
  call void @"_ZN4core3ptr53drop_in_place$LT$alloc..raw_vec..RawVec$LT$u8$GT$$GT$17hfda10d6b595a1812E"({ i8*, i32 }* %0)
  br label %bb1

bb1:                                              ; preds = %bb2
  ret void
}

; core::ptr::drop_in_place<alloc::raw_vec::RawVec<u8>>
; Function Attrs: nounwind
define hidden void @"_ZN4core3ptr53drop_in_place$LT$alloc..raw_vec..RawVec$LT$u8$GT$$GT$17hfda10d6b595a1812E"({ i8*, i32 }* %_1) unnamed_addr #1 {
start:
; call <alloc::raw_vec::RawVec<T,A> as core::ops::drop::Drop>::drop
  call void @"_ZN77_$LT$alloc..raw_vec..RawVec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h8b65d110bf6a4a74E"({ i8*, i32 }* align 4 dereferenceable(8) %_1)
  br label %bb1

bb1:                                              ; preds = %start
  ret void
}

; core::alloc::layout::Layout::from_size_align_unchecked
; Function Attrs: inlinehint nounwind
define hidden { i32, i32 } @_ZN4core5alloc6layout6Layout25from_size_align_unchecked17hec2c9f0849ba5330E(i32 %size, i32 %align) unnamed_addr #0 {
start:
  %0 = alloca { i32, i32 }, align 4
; call core::num::nonzero::NonZeroUsize::new_unchecked
  %_4 = call i32 @_ZN4core3num7nonzero12NonZeroUsize13new_unchecked17h93cf8a70d3a8953cE(i32 %align), !range !0
  br label %bb1

bb1:                                              ; preds = %start
  %1 = bitcast { i32, i32 }* %0 to i32*
  store i32 %size, i32* %1, align 4
  %2 = getelementptr inbounds { i32, i32 }, { i32, i32 }* %0, i32 0, i32 1
  store i32 %_4, i32* %2, align 4
  %3 = getelementptr inbounds { i32, i32 }, { i32, i32 }* %0, i32 0, i32 0
  %4 = load i32, i32* %3, align 4
  %5 = getelementptr inbounds { i32, i32 }, { i32, i32 }* %0, i32 0, i32 1
  %6 = load i32, i32* %5, align 4, !range !0
  %7 = insertvalue { i32, i32 } undef, i32 %4, 0
  %8 = insertvalue { i32, i32 } %7, i32 %6, 1
  ret { i32, i32 } %8
}

; core::alloc::layout::Layout::size
; Function Attrs: inlinehint nounwind
define hidden i32 @_ZN4core5alloc6layout6Layout4size17hc1aeb3fd66a0e1f9E({ i32, i32 }* align 4 dereferenceable(8) %self) unnamed_addr #0 {
start:
  %0 = bitcast { i32, i32 }* %self to i32*
  %1 = load i32, i32* %0, align 4
  ret i32 %1
}

; core::alloc::layout::Layout::align
; Function Attrs: inlinehint nounwind
define hidden i32 @_ZN4core5alloc6layout6Layout5align17h1dfc79d529e0b952E({ i32, i32 }* align 4 dereferenceable(8) %self) unnamed_addr #0 {
start:
  %0 = getelementptr inbounds { i32, i32 }, { i32, i32 }* %self, i32 0, i32 1
  %_2 = load i32, i32* %0, align 4, !range !0
; call core::num::nonzero::NonZeroUsize::get
  %1 = call i32 @_ZN4core3num7nonzero12NonZeroUsize3get17hfecf577b5f3227deE(i32 %_2)
  br label %bb1

bb1:                                              ; preds = %start
  ret i32 %1
}

; core::ptr::metadata::from_raw_parts_mut
; Function Attrs: inlinehint nounwind
declare dso_local { [0 x i8]*, i32 } @_ZN4core3ptr8metadata18from_raw_parts_mut17hd6a1dce2dc1794ceE({}*, i32) unnamed_addr #0

; <alloc::vec::Vec<T,A> as core::ops::drop::Drop>::drop
; Function Attrs: nounwind
declare dso_local void @"_ZN70_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17hbd6a9b60e2125187E"(%"std::vec::Vec<u8>"* align 4 dereferenceable(12)) unnamed_addr #1

; <alloc::raw_vec::RawVec<T,A> as core::ops::drop::Drop>::drop
; Function Attrs: nounwind
declare dso_local void @"_ZN77_$LT$alloc..raw_vec..RawVec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h8b65d110bf6a4a74E"({ i8*, i32 }* align 4 dereferenceable(8)) unnamed_addr #1

attributes #0 = { inlinehint nounwind "target-cpu"="generic" }
attributes #1 = { nounwind "target-cpu"="generic" }

!0 = !{i32 1, i32 0}
