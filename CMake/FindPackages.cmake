# generated by Buildyard, do not edit.

include(System)
list(APPEND FIND_PACKAGES_DEFINES ${SYSTEM})
find_package(PkgConfig)

set(ENV{PKG_CONFIG_PATH} "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig:$ENV{PKG_CONFIG_PATH}")
if(PKG_CONFIG_EXECUTABLE)
  find_package(OpenGL )
  if((NOT OpenGL_FOUND) AND (NOT OPENGL_FOUND))
    pkg_check_modules(OpenGL OpenGL)
  endif()
else()
  find_package(OpenGL  )
endif()

if(PKG_CONFIG_EXECUTABLE)
  find_package(Qt4 4.6 COMPONENTS QtNetwork)
  if((NOT Qt4_FOUND) AND (NOT QT4_FOUND))
    pkg_check_modules(Qt4 Qt4>=4.6)
  endif()
else()
  find_package(Qt4 4.6  COMPONENTS QtNetwork)
endif()

if(PKG_CONFIG_EXECUTABLE)
  find_package(X11 )
  if((NOT X11_FOUND) AND (NOT X11_FOUND))
    pkg_check_modules(X11 X11)
  endif()
else()
  find_package(X11  )
endif()

if(PKG_CONFIG_EXECUTABLE)
  find_package(Lunchbox 1.9)
  if((NOT Lunchbox_FOUND) AND (NOT LUNCHBOX_FOUND))
    pkg_check_modules(Lunchbox Lunchbox>=1.9)
  endif()
  if((NOT Lunchbox_FOUND) AND (NOT LUNCHBOX_FOUND))
    message(FATAL_ERROR "Could not find Lunchbox")
  endif()
else()
  find_package(Lunchbox 1.9  REQUIRED)
endif()

if(PKG_CONFIG_EXECUTABLE)
  find_package(Boost 1.41.0 COMPONENTS program_options regex system)
  if((NOT Boost_FOUND) AND (NOT BOOST_FOUND))
    pkg_check_modules(Boost Boost>=1.41.0)
  endif()
  if((NOT Boost_FOUND) AND (NOT BOOST_FOUND))
    message(FATAL_ERROR "Could not find Boost COMPONENTS program_options regex system")
  endif()
else()
  find_package(Boost 1.41.0  REQUIRED program_options regex system)
endif()


if(EXISTS ${PROJECT_SOURCE_DIR}/CMake/FindPackagesPost.cmake)
  include(${PROJECT_SOURCE_DIR}/CMake/FindPackagesPost.cmake)
endif()

if(OPENGL_FOUND)
  set(OpenGL_name OPENGL)
  set(OpenGL_FOUND TRUE)
elseif(OpenGL_FOUND)
  set(OpenGL_name OpenGL)
  set(OPENGL_FOUND TRUE)
endif()
if(OpenGL_name)
  list(APPEND FIND_PACKAGES_DEFINES HWSD_USE_OPENGL)
  set(FIND_PACKAGES_FOUND "${FIND_PACKAGES_FOUND} OpenGL")
  link_directories(${${OpenGL_name}_LIBRARY_DIRS})
  if(NOT "${${OpenGL_name}_INCLUDE_DIRS}" MATCHES "-NOTFOUND")
    include_directories(${${OpenGL_name}_INCLUDE_DIRS})
  endif()
endif()

if(QT4_FOUND)
  set(Qt4_name QT4)
  set(Qt4_FOUND TRUE)
elseif(Qt4_FOUND)
  set(Qt4_name Qt4)
  set(QT4_FOUND TRUE)
endif()
if(Qt4_name)
  list(APPEND FIND_PACKAGES_DEFINES HWSD_USE_QT4)
  set(FIND_PACKAGES_FOUND "${FIND_PACKAGES_FOUND} Qt4")
  link_directories(${${Qt4_name}_LIBRARY_DIRS})
  if(NOT "${${Qt4_name}_INCLUDE_DIRS}" MATCHES "-NOTFOUND")
    include_directories(SYSTEM ${${Qt4_name}_INCLUDE_DIRS})
  endif()
endif()

if(X11_FOUND)
  set(X11_name X11)
  set(X11_FOUND TRUE)
elseif(X11_FOUND)
  set(X11_name X11)
  set(X11_FOUND TRUE)
endif()
if(X11_name)
  list(APPEND FIND_PACKAGES_DEFINES HWSD_USE_X11)
  set(FIND_PACKAGES_FOUND "${FIND_PACKAGES_FOUND} X11")
  link_directories(${${X11_name}_LIBRARY_DIRS})
  if(NOT "${${X11_name}_INCLUDE_DIRS}" MATCHES "-NOTFOUND")
    include_directories(${${X11_name}_INCLUDE_DIRS})
  endif()
endif()

if(LUNCHBOX_FOUND)
  set(Lunchbox_name LUNCHBOX)
  set(Lunchbox_FOUND TRUE)
elseif(Lunchbox_FOUND)
  set(Lunchbox_name Lunchbox)
  set(LUNCHBOX_FOUND TRUE)
endif()
if(Lunchbox_name)
  list(APPEND FIND_PACKAGES_DEFINES HWSD_USE_LUNCHBOX)
  set(FIND_PACKAGES_FOUND "${FIND_PACKAGES_FOUND} Lunchbox")
  link_directories(${${Lunchbox_name}_LIBRARY_DIRS})
  if(NOT "${${Lunchbox_name}_INCLUDE_DIRS}" MATCHES "-NOTFOUND")
    include_directories(${${Lunchbox_name}_INCLUDE_DIRS})
  endif()
endif()

if(BOOST_FOUND)
  set(Boost_name BOOST)
  set(Boost_FOUND TRUE)
elseif(Boost_FOUND)
  set(Boost_name Boost)
  set(BOOST_FOUND TRUE)
endif()
if(Boost_name)
  list(APPEND FIND_PACKAGES_DEFINES HWSD_USE_BOOST)
  set(FIND_PACKAGES_FOUND "${FIND_PACKAGES_FOUND} Boost")
  link_directories(${${Boost_name}_LIBRARY_DIRS})
  if(NOT "${${Boost_name}_INCLUDE_DIRS}" MATCHES "-NOTFOUND")
    include_directories(SYSTEM ${${Boost_name}_INCLUDE_DIRS})
  endif()
endif()

set(HWSD_BUILD_DEBS autoconf;automake;cmake;doxygen;git;git-review;libavahi-compat-libdnssd-dev;libboost-filesystem-dev;libboost-program-options-dev;libboost-regex-dev;libboost-serialization-dev;libboost-system-dev;libboost-thread-dev;libgl1-mesa-dev;libhwloc-dev;libjpeg-turbo8-dev;libleveldb-dev;libqt4-dev;libturbojpeg;libx11-dev;pkg-config;subversion)

set(HWSD_DEPENDS OpenGL;Qt4;X11;Lunchbox;Boost)

# Write defines.h and options.cmake
if(NOT PROJECT_INCLUDE_NAME)
  message(WARNING "PROJECT_INCLUDE_NAME not set, old or missing Common.cmake?")
  set(PROJECT_INCLUDE_NAME ${PROJECT_NAME})
endif()
if(NOT OPTIONS_CMAKE)
  set(OPTIONS_CMAKE ${CMAKE_CURRENT_BINARY_DIR}/options.cmake)
endif()
set(DEFINES_FILE "${CMAKE_CURRENT_BINARY_DIR}/include/${PROJECT_INCLUDE_NAME}/defines${SYSTEM}.h")
list(APPEND COMMON_INCLUDES ${DEFINES_FILE})
set(DEFINES_FILE_IN ${DEFINES_FILE}.in)
file(WRITE ${DEFINES_FILE_IN}
  "// generated by CMake/FindPackages.cmake, do not edit.\n\n"
  "#ifndef ${PROJECT_NAME}_DEFINES_${SYSTEM}_H\n"
  "#define ${PROJECT_NAME}_DEFINES_${SYSTEM}_H\n\n")
file(WRITE ${OPTIONS_CMAKE} "# Optional modules enabled during build\n"
  "list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR})\n")
foreach(DEF ${FIND_PACKAGES_DEFINES})
  add_definitions(-D${DEF}=1)
  file(APPEND ${DEFINES_FILE_IN}
  "#ifndef ${DEF}\n"
  "#  define ${DEF} 1\n"
  "#endif\n")
if(NOT DEF STREQUAL SYSTEM)
  file(APPEND ${OPTIONS_CMAKE} "set(${DEF} ON)\n")
endif()
endforeach()
if(CMAKE_MODULE_INSTALL_PATH)
  install(FILES ${OPTIONS_CMAKE} DESTINATION ${CMAKE_MODULE_INSTALL_PATH}
    COMPONENT dev)
else()
  message(WARNING "CMAKE_MODULE_INSTALL_PATH not set, old or missing Common.cmake?")
endif()
file(APPEND ${DEFINES_FILE_IN}
  "\n#endif\n")

include(UpdateFile)
configure_file(${DEFINES_FILE_IN} ${DEFINES_FILE} COPYONLY)
if(Boost_FOUND) # another WAR for broken boost stuff...
  set(Boost_VERSION ${Boost_MAJOR_VERSION}.${Boost_MINOR_VERSION}.${Boost_SUBMINOR_VERSION})
endif()
if(CUDA_FOUND)
  string(REPLACE "-std=c++11" "" CUDA_HOST_FLAGS "${CUDA_HOST_FLAGS}")
  string(REPLACE "-std=c++0x" "" CUDA_HOST_FLAGS "${CUDA_HOST_FLAGS}")
endif()
if(OPENMP_FOUND)
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
endif()
if(QT4_FOUND)
  if(WIN32)
    set(QT_USE_QTMAIN TRUE)
  endif()
  # Configure a copy of the 'UseQt4.cmake' system file.
  if(NOT EXISTS ${QT_USE_FILE})
    message(WARNING "Can't find QT_USE_FILE!")
  else()
    set(_customUseQt4File "${CMAKE_CURRENT_BINARY_DIR}/UseQt4.cmake")
    file(READ ${QT_USE_FILE} content)
    # Change all include_directories() to use the SYSTEM option
    string(REPLACE "include_directories(" "include_directories(SYSTEM " content ${content})
    string(REPLACE "INCLUDE_DIRECTORIES(" "INCLUDE_DIRECTORIES(SYSTEM " content ${content})
    file(WRITE ${_customUseQt4File} ${content})
    set(QT_USE_FILE ${_customUseQt4File})
    include(${QT_USE_FILE})
  endif()
endif()
if(FIND_PACKAGES_FOUND)
  if(MSVC)
    message(STATUS "Configured with ${FIND_PACKAGES_FOUND}")
  else()
    message(STATUS "Configured with ${CMAKE_BUILD_TYPE}${FIND_PACKAGES_FOUND}")
  endif()
endif()
