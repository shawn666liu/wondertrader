add_rules("mode.debug", "mode.release", "mode.releasedbg")
set_languages("c++17")
if is_os("windows")then 
    add_defines("_WINDOWS")
else
    -- set_toolchains("gcc-12")
end    
if is_mode("debug")then
    add_defines("_DEBUG")
end

------------------------------- requires -------------------------------
add_requires("vcpkg::fmt 5.2.1")
add_requires("vcpkg::spdlog 1.3.1")
add_requires("vcpkg::rapidjson 1.1.0")
add_requires("vcpkg::yaml-cpp 0.8.0")
add_requires("vcpkg::nanomsg 1.2.1")
add_requires("vcpkg::boost-filesystem 1.75.0")
add_requires("vcpkg::boost-thread 1.75.0")
add_requires("vcpkg::boost-asio 1.75.0")
add_requires("vcpkg::boost-pool 1.75.0")
add_requires("vcpkg::boost-property-tree 1.75.0")
add_requires("vcpkg::boost-xpressive 1.75.0")
add_requires("vcpkg::boost-interprocess 1.75.0")
add_requires("vcpkg::boost-circular-buffer 1.75.0")
add_requires("vcpkg::zstd 1.5.6")
add_requires("vcpkg::lmdb 0.9.31")


------------------------------- global packages -------------------------------
add_packages("vcpkg::fmt")
add_packages("vcpkg::spdlog")
add_packages("vcpkg::boost-asio")
add_packages("vcpkg::boost-filesystem")
add_packages("vcpkg::boost-interprocess")

------------------------------- BaseLibs -------------------------------

-- target("Share")
--     set_kind("shared")
--     add_includedirs("src/Share")
--     add_includedirs("src/Share/threadpool")
--     add_includedirs("src/Share/threadpool/detail")


target("WTSTools")
    set_kind("shared")
    add_includedirs("src/WTSTools")
    add_files("src/WTSTools/*.cpp")
    add_packages("vcpkg::boost-xpressive")
    
    
target("WTSUtils")
    set_kind("shared")
    add_includedirs("src/WTSUtils")
    add_includedirs("src/WTSUtils/StackTracer")
    add_files("src/WTSUtils/*.cpp")
    add_files("src/WTSUtils/StackTracer/*.cpp")
    add_packages("vcpkg::lmdb")
    add_packages("vcpkg::yaml-cpp")
    add_packages("vcpkg::rapidjson")

------------------------------- Tools -------------------------------
target("CTPLoader")
    set_kind("shared")
    add_includedirs("src/CTPLoader")
    add_files("src/CTPLoader/*.cpp")
    add_packages("vcpkg::nanomsg")
    add_packages("vcpkg::rapidjson")
    add_packages("vcpkg::boost-property-tree")

target("CTPOptLoader")
    set_kind("shared")
    add_includedirs("src/CTPOptLoader")
    add_files("src/CTPOptLoader/*.cpp")
    add_packages("vcpkg::rapidjson")
    add_packages("vcpkg::boost-property-tree")

target("LoaderRunner")
    set_kind("binary")
    add_includedirs("src/LoaderRunner")
    add_files("src/LoaderRunner/*.cpp")
    add_runenvs("LD_LIBRARY_PATH","./")

target("TraderDumper")
    set_kind("shared")
    add_includedirs("src/TraderDumper")
    add_files("src/TraderDumper/*.cpp")
    add_packages("vcpkg::boost-xpressive")

target("WtMsgQue")
    set_kind("shared")
    add_includedirs("src/WtMsgQue")
    add_files("src/WtMsgQue/*.cpp")
    add_packages("vcpkg::nanomsg")

target("WtShareHelper")
    set_kind("shared")
    add_includedirs("src/WtShareHelper")
    add_files("src/WtShareHelper/*.cpp")

------------------------------- DataKit -------------------------------

target("QuoteFactory")
    set_kind("binary")
    add_includedirs("src/QuoteFactory")
    add_files("src/QuoteFactory/*.cpp")
    add_deps("WTSTools")
    add_deps("WTSUtils")
    add_deps("WtDtCore")
    add_deps("ParserCTP")
    add_deps("ParserXTP")
    add_deps("ParserFemas")
    add_deps("ParserCTPMini")
    add_deps("WtDataStorage")
    
    add_runenvs("LD_LIBRARY_PATH","./")
    
    
target("WtDataStorage")
    set_kind("shared")
    add_includedirs("src/WtDataStorage")
    add_files("src/WtDataStorage/*.cpp")
    add_packages("vcpkg::rapidjson")
    
    add_packages("vcpkg::boost-xpressive")
    add_packages("vcpkg::boost-property-tree")


target("WtDataStorageAD")
    set_kind("shared")
    add_includedirs("src/WtDataStorageAD")
    add_files("src/WtDataStorageAD/*.cpp")
    add_packages("vcpkg::boost-circular-buffer")
    
    add_packages("vcpkg::boost-xpressive")

target("WtDtCore")
    set_kind("shared")
    add_includedirs("src/WtDtCore")
    add_files("src/WtDtCore/*.cpp")
    add_deps("WTSUtils")
    add_packages("vcpkg::boost-thread")
    add_packages("vcpkg::boost-xpressive")
    add_packages("vcpkg::zstd")
    
    
target("WtDtHelper")
    set_kind("shared")
    add_includedirs("src/WtDtHelper")
    add_files("src/WtDtHelper/*.cpp")
    add_packages("vcpkg::rapidjson")
    add_packages("vcpkg::zstd")
    

target("WtDtPorter")
    set_kind("shared")
    add_includedirs("src/WtDtPorter")
    add_files("src/WtDtPorter/*.cpp")
    add_deps("WtDtCore")
    add_deps("WTSTools")
    add_packages("vcpkg::zstd")
    

target("WtDtServo")
    set_kind("shared")
    add_includedirs("src/WtDtServo")
    add_files("src/WtDtServo/*.cpp")
    add_packages("vcpkg::boost-xpressive")


------------------------------- Parsers -------------------------------

target("ParserCTP")
    set_kind("shared")
    add_includedirs("src/ParserCTP")
    add_files("src/ParserCTP/*.cpp")

target("ParserCTPMini")
    set_kind("shared")
    add_includedirs("src/ParserCTPMini")
    add_files("src/ParserCTPMini/*.cpp")
    
target("ParserCTPOpt")
    set_kind("shared")
    add_includedirs("src/ParserCTPOpt")
    add_files("src/ParserCTPOpt/*.cpp")

target("ParserFemas")
    set_kind("shared")
    add_includedirs("src/ParserFemas")
    add_files("src/ParserFemas/*.cpp")

target("ParserHuaX")
    set_kind("shared")
    add_includedirs("src/ParserHuaX")
    add_files("src/ParserHuaX/*.cpp")
    
    

target("ParserOES")
    set_kind("shared")
    add_includedirs("src/API/oesApi0.17.5.8/include")
    add_includedirs("src/ParserOES")
    add_files("src/ParserOES/*.cpp")

target("ParserShm")
    set_kind("shared")
    add_includedirs("src/ParserShm")
    add_files("src/ParserShm/*.cpp")
    
    

target("ParserUDP")
    set_kind("shared")
    add_includedirs("src/ParserUDP")
    add_files("src/ParserUDP/*.cpp")
    

target("ParserXeleSkt")
    set_kind("shared")
    add_includedirs("src/ParserXeleSkt")
    add_files("src/ParserXeleSkt/*.cpp")

target("ParserXTP")
    set_kind("shared")
    add_includedirs("src/ParserXTP")
    add_files("src/ParserXTP/*.cpp")
    
    
target("ParserYD")
    set_kind("shared")
    add_includedirs("src/ParserYD")
    add_files("src/ParserYD/*.cpp")
    


------------------------------- Plugins -------------------------------

target("WtCtaStraFact")
    set_kind("shared")
    add_includedirs("src/WtCtaStraFact")
    add_files("src/WtCtaStraFact/*.cpp")

target("WtExeFact")
    set_kind("shared")
    add_includedirs("src/WtExeFact")
    add_files("src/WtExeFact/*.cpp")
    add_packages("vcpkg::rapidjson")

target("WtHftStraFact")
    set_kind("shared")
    add_includedirs("src/WtHftStraFact")
    add_files("src/WtHftStraFact/*.cpp")

target("WtRiskMonFact")
    set_kind("shared")
    add_includedirs("src/WtRiskMonFact")
    add_files("src/WtRiskMonFact/*.cpp")

target("WtSelStraFact")
    set_kind("shared")
    add_includedirs("src/WtSelStraFact")
    add_files("src/WtSelStraFact/*.cpp")

------------------------------- Product -------------------------------

target("WtCore")
    set_kind("shared")
    add_includedirs("src/WtCore")
    add_files("src/WtCore/*.cpp")
    add_deps("WTSTools")
    add_packages("vcpkg::rapidjson")
    add_packages("vcpkg::boost-thread")
    add_packages("vcpkg::boost-xpressive")
    add_packages("vcpkg::boost-circular-buffer")

target("WtExecMon")
    set_kind("shared")
    add_includedirs("src/WtExecMon")
    add_files("src/WtExecMon/*.cpp")
    add_deps("WtCore")
    add_deps("WTSTools")
    add_deps("WTSUtils")
    add_packages("vcpkg::boost-xpressive")
    

target("WtPorter")
    set_kind("shared")
    add_includedirs("src/WtPorter")
    add_files("src/WtPorter/*.cpp")
    add_deps("WtCore")
    add_deps("WTSTools")
    add_deps("WTSUtils")    
    add_packages("vcpkg::boost-circular-buffer")

target("WtRunner")
    set_kind("binary")
    add_includedirs("src/WtRunner")
    add_files("src/WtRunner/*.cpp")
    add_deps("WtCore")
    add_deps("WtShareHelper")
    add_deps("WTSTools")
    add_deps("WTSUtils")
    add_packages("vcpkg::boost-circular-buffer")
    add_runenvs("LD_LIBRARY_PATH","./")

------------------------------- Backtest -------------------------------

target("WtBtCore")
    set_kind("shared")
    add_includedirs("src/WtBtCore")
    add_files("src/WtBtCore/*.cpp")
    add_packages("vcpkg::rapidjson")
    add_packages("vcpkg::zstd")
    add_packages("vcpkg::boost-xpressive")
    

target("WtBtPorter")
    set_kind("shared")
    add_includedirs("src/WtBtPorter")
    add_files("src/WtBtPorter/*.cpp")
    add_deps("WtBtCore")
    add_deps("WTSTools")
    add_deps("WTSUtils")

target("WtBtRunner")
    set_kind("binary")
    add_includedirs("src/WtBtRunner")
    add_files("src/WtBtRunner/*.cpp")
    add_deps("WtBtCore")
    add_deps("WTSTools")
    add_deps("WTSUtils")
    
    add_packages("vcpkg::zstd")
    add_runenvs("LD_LIBRARY_PATH","./")

    
------------------------------- Traders -------------------------------

target("TraderATP")
    set_kind("shared")
    add_includedirs("src/API/AtpTradeApi/include")
    add_includedirs("src/TraderATP")
    add_files("src/TraderATP/*.cpp")
    
    


target("TraderCTP")
    set_kind("shared")
    add_includedirs("src/TraderCTP")
    add_files("src/TraderCTP/*.cpp")
    
    

target("TraderCTPMini")
    set_kind("shared")
    add_includedirs("src/TraderCTPMini")
    add_files("src/TraderCTPMini/*.cpp")
    
    

target("TraderCTPOpt")
    set_kind("shared")
    add_includedirs("src/TraderCTPOpt")
    add_files("src/TraderCTPOpt/*.cpp")
    add_packages("vcpkg::boost-property-tree")

target("TraderDD")
    set_kind("shared")
    add_includedirs("src/TraderDD")
    add_files("src/TraderDD/*.cpp")
    add_packages("vcpkg::boost-property-tree")

target("TraderDumper")
    set_kind("shared")
    add_includedirs("src/TraderDumper")
    add_files("src/TraderDumper/*.cpp")

target("TraderFemas")
    set_kind("shared")
    add_includedirs("src/TraderFemas")
    add_files("src/TraderFemas/*.cpp")
    

target("TraderHuaX")
    set_kind("shared")
    add_includedirs("src/TraderHuaX")
    add_files("src/TraderHuaX/*.cpp")
    
    

target("TraderMocker")
    set_kind("shared")
    add_includedirs("src/TraderMocker")
    add_files("src/TraderMocker/*.cpp")
    add_packages("vcpkg::rapidjson")

target("TraderOES")
    set_kind("shared")
    add_includedirs("src/API/oesApi0.17.5.8/include")
    add_includedirs("src/TraderOES")
    add_files("src/TraderOES/*.cpp")
    
    
    

target("TraderXTP")
    set_kind("shared")
    add_includedirs("src/TraderXTP")
    add_files("src/TraderXTP/*.cpp")
    

target("TraderXTPXAlgo")
    set_kind("shared")
    add_includedirs("src/TraderXTPXAlgo")
    add_files("src/TraderXTPXAlgo/*.cpp")
    

target("TraderYD")
    set_kind("shared")
    add_includedirs("src/TraderYD")
    add_files("src/TraderYD/*.cpp")
    add_packages("vcpkg::boost-property-tree")
    

------------------------------- UltraFT -------------------------------

target("WtUftCore")
    set_kind("shared")
    add_includedirs("src/WtUftCore")
    add_files("src/WtUftCore/*.cpp")
    add_packages("vcpkg::rapidjson")

target("WtUftRunner")
    set_kind("binary")
    add_includedirs("src/WtUftRunner")
    add_files("src/WtUftRunner/*.cpp")
    add_deps("WTSTools")
    add_deps("WtUftCore")
    add_deps("WTSUtils")
    add_runenvs("LD_LIBRARY_PATH","./")

target("WtUftStraFact")
    set_kind("shared")
    add_includedirs("src/WtUftStraFact")
    add_files("src/WtUftStraFact/*.cpp")

------------------------------- Tests -------------------------------

target("TestBtPorter")
    set_kind("binary")
    add_includedirs("src/TestBtPorter")
    add_files("src/TestBtPorter/*.cpp")
    add_deps("WtBtPorter")
    add_runenvs("LD_LIBRARY_PATH","./")

target("TestDtPorter")
    set_kind("binary")
    add_includedirs("src/TestDtPorter")
    add_files("src/TestDtPorter/*.cpp")
    add_deps("WtDtPorter")
    add_deps("WtDtHelper")
    add_runenvs("LD_LIBRARY_PATH","./")

target("TestExecPorter")
    set_kind("binary")
    add_includedirs("src/TestExecPorter")
    add_files("src/TestExecPorter/*.cpp")    
    add_deps("WtExecMon")
    add_runenvs("LD_LIBRARY_PATH","./")

target("TestParser")
    set_kind("binary")
    add_includedirs("src/TestParser")
    add_files("src/TestParser/*.cpp")
    add_deps("WTSUtils")
    add_deps("WTSTools")
    add_runenvs("LD_LIBRARY_PATH","./")
    

target("TestPorter")
    set_kind("binary")
    add_includedirs("src/TestPorter")
    add_files("src/TestPorter/*.cpp")
    add_deps("WtPorter")
    add_packages("vcpkg::boost-xpressive")
    add_runenvs("LD_LIBRARY_PATH","./")

target("TestTrader")
    set_kind("binary")
    add_includedirs("src/TestTrader")
    add_files("src/TestTrader/*.cpp")
    add_deps("WTSUtils")
    add_deps("WTSTools")
    add_runenvs("LD_LIBRARY_PATH","./")

target("TestUnits")
    set_kind("binary")
    add_includedirs("src/TestUnits")
    add_includedirs("src/TestUnits/gtest")
    add_files("src/TestUnits/*.cpp")
    add_files("src/TestUnits/gtest/*.cc")
    add_packages("vcpkg::boost-xpressive")    
    add_packages("vcpkg::boost-property-tree")
    add_packages("vcpkg::lmdb")
    add_deps("WtShareHelper")
    add_deps("WTSUtils")    
    add_runenvs("LD_LIBRARY_PATH","./")

target("WtLatencyHFT")
    set_kind("binary")
    add_includedirs("src/WtLatencyHFT")
    add_files("src/WtLatencyHFT/*.cpp")
    add_deps("WtCore")
    add_deps("WTSTools")
    add_deps("WTSUtils")
    add_packages("vcpkg::boost-circular-buffer")
    
    add_runenvs("LD_LIBRARY_PATH","./")

target("WtLatencyUFT")
    set_kind("binary")
    add_includedirs("src/WtLatencyUFT")
    add_files("src/WtLatencyUFT/*.cpp")
    add_deps("WtUftCore")
    add_deps("WTSTools")
    add_deps("WTSUtils")
    add_runenvs("LD_LIBRARY_PATH","./")
    
