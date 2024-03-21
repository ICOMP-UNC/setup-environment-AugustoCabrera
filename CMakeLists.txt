cmake_minimum_required(VERSION 3.25 FATAL_ERROR)

project (
"FirstProjectInCMake"
VERSION 1.0.0
DESCRIPTION "CMake C Project Template for Operating Systems II"
LANGUAGES C
)

set(CMAKE_C_STANDARD 17)

include_directories(include)

file(GLOB_RECURSE SOURCES "src/*.c") #Donde busca el codigo fuente


#Ahora creo el ejecutable:
#${PROJECT_NAME} para que lea las variables de CMake de la misma forma que
# lo hace en BASH por ende ${PROJECT_NAME} = GLOB_RECURSE SOURCE
# y ${SOURCES} = "src/*.c"

add_executable(${PROJECT_NAME} ${SOURCES})

