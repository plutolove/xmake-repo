package("libllvmcpu")

    set_homepage("https://llvm.org/")
    set_description("The LLVM Compiler Infrastructure")

    if is_plat("windows") then
        if is_arch("x86") then
            set_urls("https://github.com/xmake-mirror/llvm-windows/releases/download/$(version)/clang+llvm-$(version)-win32.zip")
            add_versions("11.0.0", "268043ae0b656cf6272ccb9b8e3f21f51170b74ed8997ddc0b99587983b821ca")
            add_versions("14.0.0", "63afc3c472cb279978c5a7efc25b8783a700aeb416df67886b7057eba52a8742")
            add_versions("15.0.7", "8dbabb2194404220f8641b4b18b24b36eca0ae751380c23fc7743097e205b95f")
        else
            set_urls("https://github.com/xmake-mirror/llvm-windows/releases/download/$(version)/clang+llvm-$(version)-win64.zip")
            add_versions("11.0.0", "db5b3a44f8f784ebc71f716b54eb63c0d8d21aead12449f36291ab00820271c7")
            add_versions("14.0.0", "c1e1ddf11aa73c58073956d9217086550544328ed5e6ec64c1a709badb231711")
            add_versions("15.0.7", "7d29ca82f8b73e9973209e90428ec9f3fbd3b01925bd26e34f59e959e9ea7eb3")
        end
    elseif is_plat("macosx") then
        if is_arch("x86_64") then
            set_urls("https://github.com/llvm/llvm-project/releases/download/llvmorg-$(version)/clang+llvm-$(version)-x86_64-apple-darwin.tar.xz")
            add_versions("11.0.0", "b93886ab0025cbbdbb08b46e5e403a462b0ce034811c929e96ed66c2b07fe63a")
            add_versions("14.0.0", "cf5af0f32d78dcf4413ef6966abbfd5b1445fe80bba57f2ff8a08f77e672b9b3")
        elseif is_arch("arm64") then
            set_urls("https://github.com/llvm/llvm-project/releases/download/llvmorg-$(version)/clang+llvm-$(version)-arm64-apple-darwin21.0.tar.xz")
            add_versions("15.0.0", "cfd5c3fa07d7fccea0687f5b4498329a6172b7a15bbc45b547d0ac86bd3452a5")
        end
    elseif is_plat("bsd") then
        if is_arch("x86_64") then
            set_urls("https://github.com/llvm/llvm-project/releases/download/llvmorg-$(version)/clang+llvm-$(version)-amd64-unknown-freebsd13.tar.xz")
            add_versions("14.0.0", "b68d73fd57be385e7f06046a87381f7520c8861f492c294e6301d2843d9a1f57")
        elseif is_arch("i386") then
            set_urls("https://github.com/llvm/llvm-project/releases/download/llvmorg-$(version)/clang+llvm-$(version)-i386-unknown-freebsd13.tar.xz")
            add_versions("14.0.0", "81f49eb466ce9149335ac8918a5f02fa724d562a94464ed13745db0165b4a220")
        end
    else
        set_urls("https://github.com/plutolove/llvm-project/archive/refs/tags/llvmorg-$(version).tar.gz")
        add_versions("15.0.7-fix", "1794e4d9824d6dd63a9b1032a562dd694c42c359968eb0efb313e5d392500e5e")
        add_versions("16.0.6-fix", "b56198aec5ae81dcbfa6c5edecbf17a0fcb1966a9f7ea2b6141af89e10c30454")
        add_versions("17.0.1", "d51b10be66c10a6a81f4c594b554ffbf1063ffbadcb810af37d1f88d6e0b49dd")
        add_versions("18.1.8", "dad24392e622aab1d95863b1d53b83751c5ce2be06f42eb030997eaa0ba6d397")
    end
    
    add_deps("cmake")
    add_includedirs("include")
    add_links("LLVM","MLIR", "LTO", "mlir_async_runtime", "mlir_c_runner_utils", "mlir_cuda_runtime", "mlir_runner_utils", "Remarks")
    -- add_links("LLVM", "MLIRAnalysis", "MLIRPresburger", "MLIRAffineToStandard", "MLIRArithmeticToLLVM", 
    --           "MLIRArithmeticToSPIRV", "MLIRArmNeon2dToIntr", "MLIRAsyncToLLVM", "MLIRBufferizationToMemRef", 
    --           "MLIRComplexToLLVM", "MLIRComplexToStandard", "MLIRGPUToGPURuntimeTransforms", "MLIRGPUToNVVMTransforms", 
    --           "MLIRGPUToROCDLTransforms", "MLIRGPUToSPIRV", "MLIRGPUToVulkanTransforms", "MLIRLinalgToLLVM", 
    --           "MLIRLinalgToSPIRV", "MLIRLinalgToStandard", "MLIRLLVMCommonConversion", "MLIRMathToLibm", 
    --           "MLIRMathToLLVM", "MLIRMathToSPIRV", "MLIRMemRefToLLVM", "MLIRMemRefToSPIRV", "MLIROpenACCToLLVM", 
    --           "MLIROpenACCToSCF", "MLIROpenMPToLLVM", "MLIRPDLToPDLInterp", "MLIRReconcileUnrealizedCasts", 
    --           "MLIRSCFToGPU", "MLIRSCFToOpenMP", "MLIRSCFToSPIRV", "MLIRSCFToStandard", "MLIRShapeToStandard", 
    --           "MLIRSPIRVToLLVM", "MLIRStandardToLLVM", "MLIRStandardToSPIRV", "MLIRTosaToLinalg", 
    --           "MLIRTosaToSCF", "MLIRTosaToStandard", "MLIRVectorToROCDL", "MLIRVectorToLLVM", "MLIRVectorToGPU", 
    --           "MLIRVectorToSCF", "MLIRVectorToSPIRV", "MLIRAffineAnalysis", "MLIRAffine", "MLIRAffineTransforms", 
    --           "MLIRAffineUtils", "MLIRArithmetic", "MLIRArithmeticTransforms", "MLIRArmNeon", "MLIRArmSVE", "MLIRArmSVETransforms", 
    --           "MLIRAsync", "MLIRAsyncTransforms", "MLIRAMX", "MLIRAMXTransforms", "MLIRBufferization", "MLIRBufferizationTransforms", 
    --           "MLIRComplex", "MLIRDLTI", "MLIREmitC", "MLIRGPUOps", "MLIRGPUTransforms", "MLIRLinalgAnalysis", 
    --           "MLIRAffineBufferizableOpInterfaceImpl", "MLIRLinalgBufferizableOpInterfaceImpl", "MLIRModuleBufferization", 
    --           "MLIRLinalg", "MLIRLinalgTransforms", "MLIRLinalgUtils", "MLIRLLVMIRTransforms", "MLIRLLVMIR", "MLIRNVVMIR", 
    --           "MLIRROCDLIR", "MLIRMath", "MLIRMathTransforms", "MLIRMemRef", "MLIRMemRefTransforms", "MLIRMemRefUtils", "MLIROpenACC", 
    --           "MLIROpenMP", "MLIRPDL", "MLIRPDLInterp", "MLIRQuant", "MLIRSCF", "MLIRSCFTransforms", "MLIRSCFUtils", "MLIRShape", 
    --           "MLIRShapeOpsTransforms", "MLIRSparseTensor", "MLIRSparseTensorTransforms", "MLIRSparseTensorPipelines", "MLIRSparseTensorUtils", 
    --           "MLIRSPIRV", "MLIRSPIRVModuleCombiner", "MLIRSPIRVConversion", "MLIRSPIRVTransforms", "MLIRSPIRVUtils", "MLIRStandard", 
    --           "MLIRStandardOpsTransforms", "MLIRTensor", "MLIRTensorInferTypeOpInterfaceImpl", "MLIRTensorTilingInterfaceImpl", 
    --           "MLIRTensorTransforms", "MLIRTensorUtils", "MLIRTosa", "MLIRTosaTransforms", "MLIRDialectUtils", "MLIRVector", 
    --           "MLIRVectorTransforms", "MLIRVectorUtils", "MLIRX86Vector", "MLIRX86VectorTransforms", "MLIRDialect", "MLIRIR", 
    --           "MLIRCallInterfaces", "MLIRCastInterfaces", "MLIRControlFlowInterfaces", "MLIRCopyOpInterface", "MLIRDataLayoutInterfaces", 
    --           "MLIRDerivedAttributeOpInterface", "MLIRInferTypeOpInterface", "MLIRSideEffectInterfaces", "MLIRTilingInterface", 
    --           "MLIRVectorInterfaces", "MLIRViewLikeInterface", "MLIRLoopLikeInterface", "MLIRParser", "MLIRPass", "MLIRReduce", 
    --           "MLIRRewrite", "MLIRSupport", "MLIROptLib", "MLIRTableGen", "MLIRTargetCpp", "MLIRSPIRVDeserialization", "MLIRSPIRVSerialization", 
    --           "MLIRSPIRVBinaryUtils", "MLIRSPIRVTranslateRegistration", "MLIRArmNeonToLLVMIRTranslation", "MLIRArmSVEToLLVMIRTranslation", 
    --           "MLIRAMXToLLVMIRTranslation", "MLIRLLVMToLLVMIRTranslation", "MLIRNVVMToLLVMIRTranslation", "MLIROpenACCToLLVMIRTranslation", 
    --           "MLIROpenMPToLLVMIRTranslation", "MLIRROCDLToLLVMIRTranslation", "MLIRX86VectorToLLVMIRTranslation", "MLIRTargetLLVMIRExport", 
    --           "MLIRToLLVMIRTranslationRegistration", "MLIRTargetLLVMIRImport", "MLIRLspServerLib", "MLIRReduceLib", "MLIRPDLLAST", "MLIRPDLLParser", 
    --           "MLIRTransformUtils", "MLIRTransforms", "MLIRTranslation", "MLIRExecutionEngine", "MLIRJitRunner")
    on_load("linux", function (package)
      package:addenv("LLVM_ROOT", package:installdir())
      package:addenv("PATH", package:installdir("bin"))
    end)
  
    on_install("linux", function (package)
        local configs = {
            "-DCMAKE_BUILD_TYPE=Release",
            "-DLLVM_ENABLE_PROJECTS=mlir",
            "-DLLVM_LINK_LLVM_DYLIB=ON",
            "-DLLVM_ENABLE_ASSERTIONS=ON",
            "-DLLVM_INSTALL_UTILS=ON",
            "-DLLVM_ENABLE_EH=ON",
            "-DLLVM_ENABLE_RTTI=ON",
            "-DLLVM_TARGETS_TO_BUILD=X86",
        }
        os.cd("llvm")
        import("package.tools.cmake").install(package, configs)
        os.rm(package:installdir("lib/*.a"))
    end)

    on_test(function (package)
      if not package:is_plat("linux") then
        os.vrun("llvm-config --version")
      end
    end)
