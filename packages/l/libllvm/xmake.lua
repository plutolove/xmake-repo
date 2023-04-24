package("libllvm")

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
        set_urls("https://github.com/llvm/llvm-project/releases/download/llvmorg-$(version)/llvm-project-$(version).src.tar.xz")
        add_versions("11.0.0", "b7b639fc675fa1c86dd6d0bc32267be9eb34451748d2efd03f674b773000e92b")
        add_versions("14.0.0", "35ce9edbc8f774fe07c8f4acdf89ec8ac695c8016c165dd86b8d10e7cba07e23")
        add_versions("15.0.7", "8b5fcb24b4128cf04df1b0b9410ce8b1a729cb3c544e6da885d234280dedeac6")
    end
    
    add_deps("cmake")
    add_includedirs("include")
    add_links("LLVM", "MLIRAnalysis", "MLIRPresburger", "MLIRAffineToStandard", "MLIRArithmeticToLLVM", "MLIRArithmeticToSPIRV", "MLIRArmNeon2dToIntr", "MLIRAsyncToLLVM", "MLIRBufferizationToMemRef", "MLIRComplexToLLVM", "MLIRComplexToStandard", "MLIRGPUToGPURuntimeTransforms", "MLIRGPUToNVVMTransforms", "MLIRGPUToROCDLTransforms", "MLIRGPUToSPIRV", "MLIRGPUToVulkanTransforms", "MLIRLinalgToLLVM", "MLIRLinalgToSPIRV", "MLIRLinalgToStandard", "MLIRLLVMCommonConversion", "MLIRMathToLibm", "MLIRMathToLLVM", "MLIRMathToSPIRV", "MLIRMemRefToLLVM", "MLIRMemRefToSPIRV", "MLIROpenACCToLLVM", "MLIROpenACCToSCF", "MLIROpenMPToLLVM", "MLIRPDLToPDLInterp", "MLIRReconcileUnrealizedCasts", "MLIRSCFToGPU", "MLIRSCFToOpenMP", "MLIRSCFToSPIRV", "MLIRSCFToStandard", "MLIRShapeToStandard", "MLIRSPIRVToLLVM", "MLIRStandardToLLVM", "MLIRStandardToSPIRV", "MLIRTosaToLinalg", "MLIRTosaToSCF", "MLIRTosaToStandard", "MLIRVectorToROCDL", "MLIRVectorToLLVM", "MLIRVectorToGPU", "MLIRVectorToSCF", "MLIRVectorToSPIRV", "MLIRAffineAnalysis", "MLIRAffine", "MLIRAffineTransforms", "MLIRAffineUtils", "MLIRArithmetic", "MLIRArithmeticTransforms", "MLIRArmNeon", "MLIRArmSVE", "MLIRArmSVETransforms", "MLIRAsync", "MLIRAsyncTransforms", "MLIRAMX", "MLIRAMXTransforms", "MLIRBufferization", "MLIRBufferizationTransforms", "MLIRComplex", "MLIRDLTI", "MLIREmitC", "MLIRGPUOps", "MLIRGPUTransforms", "MLIRLinalgAnalysis", "MLIRAffineBufferizableOpInterfaceImpl", "MLIRLinalgBufferizableOpInterfaceImpl", "MLIRModuleBufferization", "MLIRLinalg", "MLIRLinalgTransforms", "MLIRLinalgUtils", "MLIRLLVMIRTransforms", "MLIRLLVMIR", "MLIRNVVMIR", "MLIRROCDLIR", "MLIRMath", "MLIRMathTransforms", "MLIRMemRef", "MLIRMemRefTransforms", "MLIRMemRefUtils", "MLIROpenACC", "MLIROpenMP", "MLIRPDL", "MLIRPDLInterp", "MLIRQuant", "MLIRSCF", "MLIRSCFTransforms", "MLIRSCFUtils", "MLIRShape", "MLIRShapeOpsTransforms", "MLIRSparseTensor", "MLIRSparseTensorTransforms", "MLIRSparseTensorPipelines", "MLIRSparseTensorUtils", "MLIRSPIRV", "MLIRSPIRVModuleCombiner", "MLIRSPIRVConversion", "MLIRSPIRVTransforms", "MLIRSPIRVUtils", "MLIRStandard", "MLIRStandardOpsTransforms", "MLIRTensor", "MLIRTensorInferTypeOpInterfaceImpl", "MLIRTensorTilingInterfaceImpl", "MLIRTensorTransforms", "MLIRTensorUtils", "MLIRTosa", "MLIRTosaTransforms", "MLIRDialectUtils", "MLIRVector", "MLIRVectorTransforms", "MLIRVectorUtils", "MLIRX86Vector", "MLIRX86VectorTransforms", "MLIRDialect", "MLIRIR", "MLIRCallInterfaces", "MLIRCastInterfaces", "MLIRControlFlowInterfaces", "MLIRCopyOpInterface", "MLIRDataLayoutInterfaces", "MLIRDerivedAttributeOpInterface", "MLIRInferTypeOpInterface", "MLIRSideEffectInterfaces", "MLIRTilingInterface", "MLIRVectorInterfaces", "MLIRViewLikeInterface", "MLIRLoopLikeInterface", "MLIRParser", "MLIRPass", "MLIRReduce", "MLIRRewrite", "MLIRSupport", "MLIROptLib", "MLIRTableGen", "MLIRTargetCpp", "MLIRSPIRVDeserialization", "MLIRSPIRVSerialization", "MLIRSPIRVBinaryUtils", "MLIRSPIRVTranslateRegistration", "MLIRArmNeonToLLVMIRTranslation", "MLIRArmSVEToLLVMIRTranslation", "MLIRAMXToLLVMIRTranslation", "MLIRLLVMToLLVMIRTranslation", "MLIRNVVMToLLVMIRTranslation", "MLIROpenACCToLLVMIRTranslation", "MLIROpenMPToLLVMIRTranslation", "MLIRROCDLToLLVMIRTranslation", "MLIRX86VectorToLLVMIRTranslation", "MLIRTargetLLVMIRExport", "MLIRToLLVMIRTranslationRegistration", "MLIRTargetLLVMIRImport", "MLIRLspServerLib", "MLIRReduceLib", "MLIRPDLLAST", "MLIRPDLLParser", "MLIRTransformUtils", "MLIRTransforms", "MLIRTranslation", "MLIRExecutionEngine", "MLIRJitRunner")
    on_load("linux", function (package)
      package:addenv("LLVM_ROOT", package:installdir())
      package:setenv("PATH", package:installdir("bin"))
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
        }
        os.cd("llvm")
        import("package.tools.cmake").install(package, configs)
    end)

    on_test(function (package)
      if not package:is_plat("linux") then
        os.vrun("llvm-config --version")
      end
    end)
