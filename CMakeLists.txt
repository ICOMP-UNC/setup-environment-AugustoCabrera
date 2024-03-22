cmake_minimum_required(VERSION 3.25 FATAL_ERROR)

project (
"FirstProjectInCMake"
VERSION 1.2.0
DESCRIPTION "CMake C Project Template for Operating Systems II"
LANGUAGES C
)

include(CTest) #para habilitar los test
#CTest es el framework que permite ejecutar los test
#no solamente permite ejecutar los Utest tambien nos elabora el pipeline

set(CMAKE_C_STANDARD 17)

include_directories(include)

include(FetchContent) #modulo de CMAKE que me permite descargar repositorios

set(UNITY_GIT_URL "https://github.com/ThrowTheSwitch/Unity.git") #variables para gene

set(FETCHCONTENT_QUIET OFF)

FetchContent_Declare(
    Unity      
    GIT_REPOSITORY ${UNITY_GIT_URL}  #REPO DONDE DESCARGAR
    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/external/Unity #a donde hace el gitclone
    UPDATE_COMMAND ""  
)

FetchContent_MakeAvailable(Unity) #EL nombre de la dependencia
# detengo este proceso hasta que TODO el FetchContent_Declare este terminado

file(GLOB_RECURSE SOURCES "src/*.c")  #Donde busca el codigo fuente


#Ahora creo el ejecutable:
#${PROJECT_NAME} para que lea las variables de CMake de la misma forma que
# lo hace en BASH por ende ${PROJECT_NAME} = GLOB_RECURSE SOURCE
# y ${SOURCES} = "src/*.c"

add_executable(${PROJECT_NAME} ${SOURCES}) #ESTE ES EL TOP EN LA ESTRUCTURA DE ARBOL 

#compilacion de librerias 
add_subdirectory(lib/libdyn) #busca en este lugar el CMakeLists.txt y lo considera como un proyecto aislado
add_subdirectory(lib/libsta)

#aca solo incluimos al target
target_include_directories(${PROJECT_NAME} PUBLIC lib/libdyn/include)
target_include_directories(${PROJECT_NAME} PUBLIC lib/libsta/include)

#ahora debo linkear estas librerias
#EN CMake TODO es un target
target_link_libraries(${PROJECT_NAME} StatiCLib DynamiCLib) 
#RUN_TESTS  son variables a pasar cuando estemos haciendo los CMAKE
if(RUN_TESTS EQUAL 1 OR RUN_COVERAGE EQUAL 1)
    add_subdirectory(tests) #se añade este directorio en alguno de estas condiciones
endif()
