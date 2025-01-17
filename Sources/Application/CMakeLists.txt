#####################################
# Define Target Information
#####################################
set(TARGET_NAME Application)
set(TARGET_INCLUDE_FOLDER ${CMAKE_CURRENT_SOURCE_DIR})
set(TARGET_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp)

#####################################
# Support IDE Visualization
#####################################
source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${TARGET_SOURCES})

#####################################
# Define Target according to options
#####################################
add_executable(${TARGET_NAME} ${TARGET_SOURCES})


#####################################
# Define Target Properties and Optional Dependencies
#####################################


# add target properties such as debug postfix and MSVC runtime
set_target_properties(${TARGET_NAME} PROPERTIES DEBUG_POSTFIX "-d" )

# set target compile options as defined in the cmake/compiler_options.cmake Module
target_compile_options(${TARGET_NAME} PRIVATE ${compiler_options})

# add compiler definition WITH_OPENSSL, if found
target_compile_definitions(${TARGET_NAME} PRIVATE ${compiler_definitions} $<$<BOOL:${BUILD_SHARED_LIBS}>:BUILD_SHARED_CORE> )#$<$<BOOL:${OPENSSL_FOUND}>:WITH_OPENSSL>)

# set target link options as defined in the cmake/compiler_options.cmake Module
target_link_options(${TARGET_NAME} PRIVATE ${linker_flags})

# include all the necessary directories
target_include_directories(${TARGET_NAME}
  PRIVATE 
    ${TARGET_INCLUDE_FOLDER} 
    ${CMAKE_SOURCE_DIR}/Libs/Internals/TinyCore/include  
    ${MLPACK_INCLUDE_DIRS} 
    ${LUA_INCLUDE_DIR} 
    ${Stb_INCLUDE_DIR}
    # Any other extra include required
)

target_link_directories(${TARGET_NAME} PRIVATE ${CMAKE_BINARY_DIR})

# link 
target_link_libraries(${TARGET_NAME} PUBLIC TinyCore  GTest::gtest 
GTest::gtest_main 
GTest::gmock 
GTest::gmock_main 
ZLIB::ZLIB 
imgui::imgui 
spdlog::spdlog 
glad::glad
Tracy::TracyClient 
sol2 
RmlLua 
RmlCore 
RmlDebugger
OpenAL::OpenAL 
${LUA_LIBRARIES} 
unofficial::joltphysics::Jolt 
unofficial::imguizmo::imguizmo 
unofficial::imgui-node-editor::imgui-node-editor 
glm::glm 
Freetype::Freetype 
unofficial::enet::enet  
EASTL 
CURL::libcurl 
box2d::box2d 
assimp::assimp 
rapidjson 
asio::asio)