; ModuleID = '/home/zqy/LLM4CHIP/dataset/pair_slow_fast/New/machsuite/spmv_crs/hls_prj/solution/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_spmv_ir(double* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="1666" %val, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="1666" %cols, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="495" %rowDelimiters, double* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="494" %vec, double* noalias nocapture nonnull "fpga.decayed.dim.hint"="494" %out) local_unnamed_addr #0 {
entry:
  %malloccall = tail call i8* @malloc(i64 13328)
  %val_copy = bitcast i8* %malloccall to [1666 x double]*
  %malloccall1 = tail call i8* @malloc(i64 6664)
  %cols_copy = bitcast i8* %malloccall1 to [1666 x i32]*
  %rowDelimiters_copy = alloca [495 x i32], align 512
  %vec_copy = alloca [494 x double], align 512
  %out_copy = alloca [494 x double], align 512
  %0 = bitcast double* %val to [1666 x double]*
  %1 = bitcast i32* %cols to [1666 x i32]*
  %2 = bitcast i32* %rowDelimiters to [495 x i32]*
  %3 = bitcast double* %vec to [494 x double]*
  %4 = bitcast double* %out to [494 x double]*
  call fastcc void @copy_in([1666 x double]* nonnull %0, [1666 x double]* %val_copy, [1666 x i32]* nonnull %1, [1666 x i32]* %cols_copy, [495 x i32]* nonnull %2, [495 x i32]* nonnull align 512 %rowDelimiters_copy, [494 x double]* nonnull %3, [494 x double]* nonnull align 512 %vec_copy, [494 x double]* nonnull %4, [494 x double]* nonnull align 512 %out_copy)
  %5 = getelementptr inbounds [1666 x double], [1666 x double]* %val_copy, i32 0, i32 0
  %6 = getelementptr inbounds [1666 x i32], [1666 x i32]* %cols_copy, i32 0, i32 0
  %7 = getelementptr inbounds [495 x i32], [495 x i32]* %rowDelimiters_copy, i32 0, i32 0
  %8 = getelementptr inbounds [494 x double], [494 x double]* %vec_copy, i32 0, i32 0
  %9 = getelementptr inbounds [494 x double], [494 x double]* %out_copy, i32 0, i32 0
  call void @apatb_spmv_hw(double* %5, i32* %6, i32* %7, double* %8, double* %9)
  call void @copy_back([1666 x double]* %0, [1666 x double]* %val_copy, [1666 x i32]* %1, [1666 x i32]* %cols_copy, [495 x i32]* %2, [495 x i32]* %rowDelimiters_copy, [494 x double]* %3, [494 x double]* %vec_copy, [494 x double]* %4, [494 x double]* %out_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in([1666 x double]* noalias readonly, [1666 x double]* noalias, [1666 x i32]* noalias readonly, [1666 x i32]* noalias, [495 x i32]* noalias readonly, [495 x i32]* noalias align 512, [494 x double]* noalias readonly, [494 x double]* noalias align 512, [494 x double]* noalias readonly, [494 x double]* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1666f64([1666 x double]* %1, [1666 x double]* %0)
  call fastcc void @onebyonecpy_hls.p0a1666i32([1666 x i32]* %3, [1666 x i32]* %2)
  call fastcc void @onebyonecpy_hls.p0a495i32([495 x i32]* align 512 %5, [495 x i32]* %4)
  call fastcc void @onebyonecpy_hls.p0a494f64([494 x double]* align 512 %7, [494 x double]* %6)
  call fastcc void @onebyonecpy_hls.p0a494f64([494 x double]* align 512 %9, [494 x double]* %8)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a1666f64([1666 x double]* noalias, [1666 x double]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [1666 x double]* %0, null
  %3 = icmp eq [1666 x double]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [1666 x double], [1666 x double]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [1666 x double], [1666 x double]* %1, i64 0, i64 %for.loop.idx1
  %5 = load double, double* %src.addr, align 8
  store double %5, double* %dst.addr, align 8
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 1666
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a1666i32([1666 x i32]* noalias, [1666 x i32]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [1666 x i32]* %0, null
  %3 = icmp eq [1666 x i32]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [1666 x i32], [1666 x i32]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [1666 x i32], [1666 x i32]* %1, i64 0, i64 %for.loop.idx1
  %5 = load i32, i32* %src.addr, align 4
  store i32 %5, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 1666
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a495i32([495 x i32]* noalias align 512, [495 x i32]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [495 x i32]* %0, null
  %3 = icmp eq [495 x i32]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [495 x i32], [495 x i32]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [495 x i32], [495 x i32]* %1, i64 0, i64 %for.loop.idx1
  %5 = load i32, i32* %src.addr, align 4
  store i32 %5, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 495
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a494f64([494 x double]* noalias align 512, [494 x double]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [494 x double]* %0, null
  %3 = icmp eq [494 x double]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [494 x double], [494 x double]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [494 x double], [494 x double]* %1, i64 0, i64 %for.loop.idx1
  %5 = load double, double* %src.addr, align 8
  store double %5, double* %dst.addr, align 8
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 494
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_out([1666 x double]* noalias, [1666 x double]* noalias readonly, [1666 x i32]* noalias, [1666 x i32]* noalias readonly, [495 x i32]* noalias, [495 x i32]* noalias readonly align 512, [494 x double]* noalias, [494 x double]* noalias readonly align 512, [494 x double]* noalias, [494 x double]* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1666f64([1666 x double]* %0, [1666 x double]* %1)
  call fastcc void @onebyonecpy_hls.p0a1666i32([1666 x i32]* %2, [1666 x i32]* %3)
  call fastcc void @onebyonecpy_hls.p0a495i32([495 x i32]* %4, [495 x i32]* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0a494f64([494 x double]* %6, [494 x double]* align 512 %7)
  call fastcc void @onebyonecpy_hls.p0a494f64([494 x double]* %8, [494 x double]* align 512 %9)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_spmv_hw(double*, i32*, i32*, double*, double*)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back([1666 x double]* noalias, [1666 x double]* noalias readonly, [1666 x i32]* noalias, [1666 x i32]* noalias readonly, [495 x i32]* noalias, [495 x i32]* noalias readonly align 512, [494 x double]* noalias, [494 x double]* noalias readonly align 512, [494 x double]* noalias, [494 x double]* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0a494f64([494 x double]* %8, [494 x double]* align 512 %9)
  ret void
}

define void @spmv_hw_stub_wrapper(double*, i32*, i32*, double*, double*) #4 {
entry:
  %5 = bitcast double* %0 to [1666 x double]*
  %6 = bitcast i32* %1 to [1666 x i32]*
  %7 = bitcast i32* %2 to [495 x i32]*
  %8 = bitcast double* %3 to [494 x double]*
  %9 = bitcast double* %4 to [494 x double]*
  call void @copy_out([1666 x double]* null, [1666 x double]* %5, [1666 x i32]* null, [1666 x i32]* %6, [495 x i32]* null, [495 x i32]* %7, [494 x double]* null, [494 x double]* %8, [494 x double]* null, [494 x double]* %9)
  %10 = bitcast [1666 x double]* %5 to double*
  %11 = bitcast [1666 x i32]* %6 to i32*
  %12 = bitcast [495 x i32]* %7 to i32*
  %13 = bitcast [494 x double]* %8 to double*
  %14 = bitcast [494 x double]* %9 to double*
  call void @spmv_hw_stub(double* %10, i32* %11, i32* %12, double* %13, double* %14)
  call void @copy_in([1666 x double]* null, [1666 x double]* %5, [1666 x i32]* null, [1666 x i32]* %6, [495 x i32]* null, [495 x i32]* %7, [494 x double]* null, [494 x double]* %8, [494 x double]* null, [494 x double]* %9)
  ret void
}

declare void @spmv_hw_stub(double*, i32*, i32*, double*, double*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #4 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
