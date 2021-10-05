; ModuleID = 'probe1.3a1fbbbh-cgu.0'
source_filename = "probe1.3a1fbbbh-cgu.0"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

%"std::option::Option<(std::ptr::NonNull<u8>, std::alloc::Layout)>" = type { [0 x i32], {}*, [2 x i32] }
%"std::option::Option<(std::ptr::NonNull<u8>, std::alloc::Layout)>::Some" = type { [0 x i32], { [0 x i32], i8*, [0 x i32], { i32, i32 }, [0 x i32] }, [0 x i32] }
%"std::alloc::Global" = type {}

; alloc::raw_vec::RawVec<T,A>::current_memory
; Function Attrs: nounwind
define hidden void @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$14current_memory17hd42d42fb5659243aE"(%"std::option::Option<(std::ptr::NonNull<u8>, std::alloc::Layout)>"* noalias nocapture sret(%"std::option::Option<(std::ptr::NonNull<u8>, std::alloc::Layout)>") dereferenceable(12) %0, { i8*, i32 }* align 4 dereferenceable(8) %self) unnamed_addr #0 {
start:
  %1 = alloca i32, align 4
  %_13 = alloca { [0 x i32], i8*, [0 x i32], { i32, i32 }, [0 x i32] }, align 4
  %_2 = alloca i8, align 1
  br label %bb4

bb4:                                              ; preds = %start
  %2 = icmp eq i32 1, 0
  br i1 %2, label %bb1, label %bb2

bb1:                                              ; preds = %bb4
  store i8 1, i8* %_2, align 1
  br label %bb3

bb2:                                              ; preds = %bb4
  %3 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %self, i32 0, i32 1
  %_5 = load i32, i32* %3, align 4
  %_4 = icmp eq i32 %_5, 0
  %4 = zext i1 %_4 to i8
  store i8 %4, i8* %_2, align 1
  br label %bb3

bb3:                                              ; preds = %bb1, %bb2
  %5 = load i8, i8* %_2, align 1, !range !0
  %6 = trunc i8 %5 to i1
  br i1 %6, label %bb5, label %bb6

bb6:                                              ; preds = %bb3
  store i32 1, i32* %1, align 4
  %7 = load i32, i32* %1, align 4
  br label %bb7

bb5:                                              ; preds = %bb3
  %8 = bitcast %"std::option::Option<(std::ptr::NonNull<u8>, std::alloc::Layout)>"* %0 to {}**
  store {}* null, {}** %8, align 4
  br label %bb12

bb12:                                             ; preds = %bb11, %bb5
  ret void

bb7:                                              ; preds = %bb6
  br label %bb8

bb8:                                              ; preds = %bb7
  %9 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %self, i32 0, i32 1
  %_9 = load i32, i32* %9, align 4
  %size = mul i32 1, %_9
; call core::alloc::layout::Layout::from_size_align_unchecked
  %10 = call { i32, i32 } @_ZN4core5alloc6layout6Layout25from_size_align_unchecked17hec2c9f0849ba5330E(i32 %size, i32 %7)
  %layout.0 = extractvalue { i32, i32 } %10, 0
  %layout.1 = extractvalue { i32, i32 } %10, 1
  br label %bb9

bb9:                                              ; preds = %bb8
  %11 = bitcast { i8*, i32 }* %self to i8**
  %_16 = load i8*, i8** %11, align 4, !nonnull !1
; call core::ptr::unique::Unique<T>::cast
  %_15 = call nonnull i8* @"_ZN4core3ptr6unique15Unique$LT$T$GT$4cast17h2414e52b56521d84E"(i8* nonnull %_16)
  br label %bb10

bb10:                                             ; preds = %bb9
; call <T as core::convert::Into<U>>::into
  %_14 = call nonnull i8* @"_ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17hc7cddd8d383a4c44E"(i8* nonnull %_15)
  br label %bb11

bb11:                                             ; preds = %bb10
  %12 = bitcast { [0 x i32], i8*, [0 x i32], { i32, i32 }, [0 x i32] }* %_13 to i8**
  store i8* %_14, i8** %12, align 4
  %13 = getelementptr inbounds { [0 x i32], i8*, [0 x i32], { i32, i32 }, [0 x i32] }, { [0 x i32], i8*, [0 x i32], { i32, i32 }, [0 x i32] }* %_13, i32 0, i32 3
  %14 = getelementptr inbounds { i32, i32 }, { i32, i32 }* %13, i32 0, i32 0
  store i32 %layout.0, i32* %14, align 4
  %15 = getelementptr inbounds { i32, i32 }, { i32, i32 }* %13, i32 0, i32 1
  store i32 %layout.1, i32* %15, align 4
  %16 = bitcast %"std::option::Option<(std::ptr::NonNull<u8>, std::alloc::Layout)>"* %0 to %"std::option::Option<(std::ptr::NonNull<u8>, std::alloc::Layout)>::Some"*
  %17 = bitcast %"std::option::Option<(std::ptr::NonNull<u8>, std::alloc::Layout)>::Some"* %16 to { [0 x i32], i8*, [0 x i32], { i32, i32 }, [0 x i32] }*
  %18 = bitcast { [0 x i32], i8*, [0 x i32], { i32, i32 }, [0 x i32] }* %17 to i8*
  %19 = bitcast { [0 x i32], i8*, [0 x i32], { i32, i32 }, [0 x i32] }* %_13 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %18, i8* align 4 %19, i32 12, i1 false)
  br label %bb12
}

; alloc::raw_vec::RawVec<T,A>::ptr
; Function Attrs: inlinehint nounwind
define hidden i8* @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$3ptr17h52d813ea1815b42bE"({ i8*, i32 }* align 4 dereferenceable(8) %self) unnamed_addr #1 {
start:
  %0 = bitcast { i8*, i32 }* %self to i8**
  %_2 = load i8*, i8** %0, align 4, !nonnull !1
; call core::ptr::unique::Unique<T>::as_ptr
  %1 = call i8* @"_ZN4core3ptr6unique15Unique$LT$T$GT$6as_ptr17h967ca352c8e3b8d9E"(i8* nonnull %_2)
  br label %bb1

bb1:                                              ; preds = %start
  ret i8* %1
}

; <alloc::raw_vec::RawVec<T,A> as core::ops::drop::Drop>::drop
; Function Attrs: nounwind
define hidden void @"_ZN77_$LT$alloc..raw_vec..RawVec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h8b65d110bf6a4a74E"({ i8*, i32 }* align 4 dereferenceable(8) %self) unnamed_addr #0 {
start:
  %_2 = alloca %"std::option::Option<(std::ptr::NonNull<u8>, std::alloc::Layout)>", align 4
  %0 = alloca {}, align 1
; call alloc::raw_vec::RawVec<T,A>::current_memory
  call void @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$14current_memory17hd42d42fb5659243aE"(%"std::option::Option<(std::ptr::NonNull<u8>, std::alloc::Layout)>"* noalias nocapture sret(%"std::option::Option<(std::ptr::NonNull<u8>, std::alloc::Layout)>") dereferenceable(12) %_2, { i8*, i32 }* align 4 dereferenceable(8) %self)
  br label %bb1

bb1:                                              ; preds = %start
  %1 = bitcast %"std::option::Option<(std::ptr::NonNull<u8>, std::alloc::Layout)>"* %_2 to {}**
  %2 = load {}*, {}** %1, align 4
  %3 = icmp eq {}* %2, null
  %_4 = select i1 %3, i32 0, i32 1
  %4 = icmp eq i32 %_4, 1
  br i1 %4, label %bb3, label %bb2

bb3:                                              ; preds = %bb1
  %5 = bitcast %"std::option::Option<(std::ptr::NonNull<u8>, std::alloc::Layout)>"* %_2 to %"std::option::Option<(std::ptr::NonNull<u8>, std::alloc::Layout)>::Some"*
  %6 = bitcast %"std::option::Option<(std::ptr::NonNull<u8>, std::alloc::Layout)>::Some"* %5 to { [0 x i32], i8*, [0 x i32], { i32, i32 }, [0 x i32] }*
  %7 = bitcast { [0 x i32], i8*, [0 x i32], { i32, i32 }, [0 x i32] }* %6 to i8**
  %ptr = load i8*, i8** %7, align 4, !nonnull !1
  %8 = bitcast %"std::option::Option<(std::ptr::NonNull<u8>, std::alloc::Layout)>"* %_2 to %"std::option::Option<(std::ptr::NonNull<u8>, std::alloc::Layout)>::Some"*
  %9 = bitcast %"std::option::Option<(std::ptr::NonNull<u8>, std::alloc::Layout)>::Some"* %8 to { [0 x i32], i8*, [0 x i32], { i32, i32 }, [0 x i32] }*
  %10 = getelementptr inbounds { [0 x i32], i8*, [0 x i32], { i32, i32 }, [0 x i32] }, { [0 x i32], i8*, [0 x i32], { i32, i32 }, [0 x i32] }* %9, i32 0, i32 3
  %11 = getelementptr inbounds { i32, i32 }, { i32, i32 }* %10, i32 0, i32 0
  %layout.0 = load i32, i32* %11, align 4
  %12 = getelementptr inbounds { i32, i32 }, { i32, i32 }* %10, i32 0, i32 1
  %layout.1 = load i32, i32* %12, align 4, !range !2
  %_7 = bitcast { i8*, i32 }* %self to %"std::alloc::Global"*
; call <alloc::alloc::Global as core::alloc::Allocator>::deallocate
  call void @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$10deallocate17h13d75bc87f3e6843E"(%"std::alloc::Global"* nonnull align 1 %_7, i8* nonnull %ptr, i32 %layout.0, i32 %layout.1)
  br label %bb4

bb2:                                              ; preds = %bb1
  br label %bb5

bb5:                                              ; preds = %bb4, %bb2
  ret void

bb4:                                              ; preds = %bb3
  br label %bb5
}

; core::alloc::layout::Layout::from_size_align_unchecked
; Function Attrs: inlinehint nounwind
declare hidden { i32, i32 } @_ZN4core5alloc6layout6Layout25from_size_align_unchecked17hec2c9f0849ba5330E(i32, i32) unnamed_addr #1

; core::ptr::unique::Unique<T>::cast
; Function Attrs: inlinehint nounwind
declare dso_local nonnull i8* @"_ZN4core3ptr6unique15Unique$LT$T$GT$4cast17h2414e52b56521d84E"(i8* nonnull) unnamed_addr #1

; <T as core::convert::Into<U>>::into
; Function Attrs: nounwind
declare dso_local nonnull i8* @"_ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17hc7cddd8d383a4c44E"(i8* nonnull) unnamed_addr #0

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #2

; core::ptr::unique::Unique<T>::as_ptr
; Function Attrs: inlinehint nounwind
declare dso_local i8* @"_ZN4core3ptr6unique15Unique$LT$T$GT$6as_ptr17h967ca352c8e3b8d9E"(i8* nonnull) unnamed_addr #1

; <alloc::alloc::Global as core::alloc::Allocator>::deallocate
; Function Attrs: inlinehint nounwind
declare hidden void @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$10deallocate17h13d75bc87f3e6843E"(%"std::alloc::Global"* nonnull align 1, i8* nonnull, i32, i32) unnamed_addr #1

attributes #0 = { nounwind "target-cpu"="generic" }
attributes #1 = { inlinehint nounwind "target-cpu"="generic" }
attributes #2 = { argmemonly nofree nosync nounwind willreturn }

!0 = !{i8 0, i8 2}
!1 = !{}
!2 = !{i32 1, i32 0}
