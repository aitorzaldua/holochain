; ModuleID = 'probe1.3a1fbbbh-cgu.8'
source_filename = "probe1.3a1fbbbh-cgu.8"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

%"std::fmt::Arguments" = type { [0 x i32], { [0 x { [0 x i8]*, i32 }]*, i32 }, [0 x i32], { i32*, i32 }, [0 x i32], { [0 x { i8*, i32* }]*, i32 }, [0 x i32] }
%"std::string::String" = type { [0 x i32], %"std::vec::Vec<u8>", [0 x i32] }
%"std::vec::Vec<u8>" = type { [0 x i32], { i8*, i32 }, [0 x i32], i32, [0 x i32] }
%"std::fmt::Formatter" = type { [0 x i32], i32, [0 x i32], i32, [0 x i32], { i32, i32 }, [0 x i32], { i32, i32 }, [0 x i32], { {}*, [3 x i32]* }, [0 x i8], i8, [3 x i8] }

@alloc1 = private unnamed_addr constant <{ [0 x i8] }> zeroinitializer, align 1
@alloc2 = private unnamed_addr constant <{ i8*, [4 x i8] }> <{ i8* getelementptr inbounds (<{ [0 x i8] }>, <{ [0 x i8] }>* @alloc1, i32 0, i32 0, i32 0), [4 x i8] zeroinitializer }>, align 4
@alloc4 = private unnamed_addr constant <{ [4 x i8] }> zeroinitializer, align 4

; probe1::probe
; Function Attrs: nounwind
define hidden void @_ZN6probe15probe17h8e14904c6c5c619cE() unnamed_addr #0 {
start:
  %_11 = alloca i32*, align 4
  %_10 = alloca [1 x { i8*, i32* }], align 4
  %_3 = alloca %"std::fmt::Arguments", align 4
  %res = alloca %"std::string::String", align 4
  %_1 = alloca %"std::string::String", align 4
  store i32* bitcast (<{ [4 x i8] }>* @alloc4 to i32*), i32** %_11, align 4
  %arg0 = load i32*, i32** %_11, align 4, !nonnull !0
; call core::fmt::ArgumentV1::new
  %0 = call { i8*, i32* } @_ZN4core3fmt10ArgumentV13new17h6ad3444321f4fb64E(i32* align 4 dereferenceable(4) %arg0, i1 (i32*, %"std::fmt::Formatter"*)* nonnull @"_ZN4core3fmt3num3imp55_$LT$impl$u20$core..fmt..LowerExp$u20$for$u20$isize$GT$3fmt17hdcae1624c69b507dE")
  %_14.0 = extractvalue { i8*, i32* } %0, 0
  %_14.1 = extractvalue { i8*, i32* } %0, 1
  br label %bb1

bb1:                                              ; preds = %start
  %1 = bitcast [1 x { i8*, i32* }]* %_10 to { i8*, i32* }*
  %2 = getelementptr inbounds { i8*, i32* }, { i8*, i32* }* %1, i32 0, i32 0
  store i8* %_14.0, i8** %2, align 4
  %3 = getelementptr inbounds { i8*, i32* }, { i8*, i32* }* %1, i32 0, i32 1
  store i32* %_14.1, i32** %3, align 4
  %_7.0 = bitcast [1 x { i8*, i32* }]* %_10 to [0 x { i8*, i32* }]*
; call core::fmt::Arguments::new_v1
  call void @_ZN4core3fmt9Arguments6new_v117ha320c258b6750e5eE(%"std::fmt::Arguments"* noalias nocapture sret(%"std::fmt::Arguments") dereferenceable(24) %_3, [0 x { [0 x i8]*, i32 }]* nonnull align 4 bitcast (<{ i8*, [4 x i8] }>* @alloc2 to [0 x { [0 x i8]*, i32 }]*), i32 1, [0 x { i8*, i32* }]* nonnull align 4 %_7.0, i32 1)
  br label %bb2

bb2:                                              ; preds = %bb1
; call alloc::fmt::format
  call void @_ZN5alloc3fmt6format17h5a2da4699a2db80fE(%"std::string::String"* noalias nocapture sret(%"std::string::String") dereferenceable(12) %res, %"std::fmt::Arguments"* noalias nocapture dereferenceable(24) %_3)
  br label %bb3

bb3:                                              ; preds = %bb2
  %4 = bitcast %"std::string::String"* %_1 to i8*
  %5 = bitcast %"std::string::String"* %res to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %4, i8* align 4 %5, i32 12, i1 false)
; call core::ptr::drop_in_place<alloc::string::String>
  call void @"_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h30092645c0b27462E"(%"std::string::String"* %_1)
  br label %bb4

bb4:                                              ; preds = %bb3
  ret void
}

; core::fmt::num::imp::<impl core::fmt::LowerExp for isize>::fmt
; Function Attrs: nounwind
declare dso_local zeroext i1 @"_ZN4core3fmt3num3imp55_$LT$impl$u20$core..fmt..LowerExp$u20$for$u20$isize$GT$3fmt17hdcae1624c69b507dE"(i32* align 4 dereferenceable(4), %"std::fmt::Formatter"* align 4 dereferenceable(36)) unnamed_addr #0

; core::fmt::ArgumentV1::new
; Function Attrs: nounwind
declare dso_local { i8*, i32* } @_ZN4core3fmt10ArgumentV13new17h6ad3444321f4fb64E(i32* align 4 dereferenceable(4), i1 (i32*, %"std::fmt::Formatter"*)* nonnull) unnamed_addr #0

; core::fmt::Arguments::new_v1
; Function Attrs: inlinehint nounwind
declare hidden void @_ZN4core3fmt9Arguments6new_v117ha320c258b6750e5eE(%"std::fmt::Arguments"* noalias nocapture sret(%"std::fmt::Arguments") dereferenceable(24), [0 x { [0 x i8]*, i32 }]* nonnull align 4, i32, [0 x { i8*, i32* }]* nonnull align 4, i32) unnamed_addr #1

; alloc::fmt::format
; Function Attrs: nounwind
declare dso_local void @_ZN5alloc3fmt6format17h5a2da4699a2db80fE(%"std::string::String"* noalias nocapture sret(%"std::string::String") dereferenceable(12), %"std::fmt::Arguments"* noalias nocapture dereferenceable(24)) unnamed_addr #0

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #2

; core::ptr::drop_in_place<alloc::string::String>
; Function Attrs: nounwind
declare dso_local void @"_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h30092645c0b27462E"(%"std::string::String"*) unnamed_addr #0

attributes #0 = { nounwind "target-cpu"="generic" }
attributes #1 = { inlinehint nounwind "target-cpu"="generic" }
attributes #2 = { argmemonly nofree nosync nounwind willreturn }

!0 = !{}
