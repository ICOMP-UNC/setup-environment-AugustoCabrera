cmake_minimum_required(VERSION 3.25 FATAL_ERROR)

project (
"FirstProjectInCMake"
VERSION 1.1.0
DESCRIPTION "CMake C Project Template for Operating Systems II"
LANGUAGES C
)

set(CMAKE_C_STANDARD 17)

include_directories(include)

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
