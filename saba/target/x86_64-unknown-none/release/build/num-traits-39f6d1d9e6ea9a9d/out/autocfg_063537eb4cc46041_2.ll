; ModuleID = 'autocfg_063537eb4cc46041_2.19ef72fa1d5b3180-cgu.0'
source_filename = "autocfg_063537eb4cc46041_2.19ef72fa1d5b3180-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-none-elf"

@alloc_f93507f8ba4b5780b14b2c2584609be0 = private unnamed_addr constant <{ [8 x i8] }> <{ [8 x i8] c"\00\00\00\00\00\00\F0?" }>, align 8
@alloc_ef0a1f828f3393ef691f2705e817091c = private unnamed_addr constant <{ [8 x i8] }> <{ [8 x i8] c"\00\00\00\00\00\00\00@" }>, align 8

; core::f64::<impl f64>::total_cmp
; Function Attrs: inlinehint noredzone nounwind nonlazybind
define internal i8 @"_ZN4core3f6421_$LT$impl$u20$f64$GT$9total_cmp17h1b977f02618a3e17E"(ptr align 8 %self, ptr align 8 %other) unnamed_addr #0 {
start:
  %right = alloca i64, align 8
  %left = alloca i64, align 8
  %_0 = alloca i8, align 1
  %self1 = load double, ptr %self, align 8, !noundef !4
  %_4 = bitcast double %self1 to i64
  store i64 %_4, ptr %left, align 8
  %self2 = load double, ptr %other, align 8, !noundef !4
  %_7 = bitcast double %self2 to i64
  store i64 %_7, ptr %right, align 8
  %_13 = load i64, ptr %left, align 8, !noundef !4
  %_12 = ashr i64 %_13, 63
  %_10 = lshr i64 %_12, 1
  %0 = load i64, ptr %left, align 8, !noundef !4
  %1 = xor i64 %0, %_10
  store i64 %1, ptr %left, align 8
  %_18 = load i64, ptr %right, align 8, !noundef !4
  %_17 = ashr i64 %_18, 63
  %_15 = lshr i64 %_17, 1
  %2 = load i64, ptr %right, align 8, !noundef !4
  %3 = xor i64 %2, %_15
  store i64 %3, ptr %right, align 8
  %_22 = load i64, ptr %left, align 8, !noundef !4
  %_23 = load i64, ptr %right, align 8, !noundef !4
  %_21 = icmp slt i64 %_22, %_23
  br i1 %_21, label %bb1, label %bb2

bb2:                                              ; preds = %start
  %_24 = icmp eq i64 %_22, %_23
  br i1 %_24, label %bb3, label %bb4

bb1:                                              ; preds = %start
  store i8 -1, ptr %_0, align 1
  br label %bb6

bb4:                                              ; preds = %bb2
  store i8 1, ptr %_0, align 1
  br label %bb5

bb3:                                              ; preds = %bb2
  store i8 0, ptr %_0, align 1
  br label %bb5

bb5:                                              ; preds = %bb3, %bb4
  br label %bb6

bb6:                                              ; preds = %bb1, %bb5
  %4 = load i8, ptr %_0, align 1, !range !5, !noundef !4
  ret i8 %4
}

; autocfg_063537eb4cc46041_2::probe
; Function Attrs: noredzone nounwind nonlazybind
define void @_ZN26autocfg_063537eb4cc46041_25probe17he23e1b6dc7645129E() unnamed_addr #1 {
start:
; call core::f64::<impl f64>::total_cmp
  %_1 = call i8 @"_ZN4core3f6421_$LT$impl$u20$f64$GT$9total_cmp17h1b977f02618a3e17E"(ptr align 8 @alloc_f93507f8ba4b5780b14b2c2584609be0, ptr align 8 @alloc_ef0a1f828f3393ef691f2705e817091c) #2, !range !5
  ret void
}

attributes #0 = { inlinehint noredzone nounwind nonlazybind "probe-stack"="inline-asm" "target-cpu"="x86-64" "target-features"="-mmx,-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-3dnow,-3dnowa,-avx,-avx2,+soft-float" }
attributes #1 = { noredzone nounwind nonlazybind "probe-stack"="inline-asm" "target-cpu"="x86-64" "target-features"="-mmx,-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-3dnow,-3dnowa,-avx,-avx2,+soft-float" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 1, !"Code Model", i32 2}
!2 = !{i32 2, !"RtLibUseGOT", i32 1}
!3 = !{!"rustc version 1.77.0-nightly (e51e98dde 2023-12-31)"}
!4 = !{}
!5 = !{i8 -1, i8 2}
