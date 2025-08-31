# Install script for directory: C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/build/fltk/cmake_install.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/lib/cfltk.lib")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/lib" TYPE STATIC_LIBRARY FILES "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/build/Debug/cfltk.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/lib/cfltk.lib")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/lib" TYPE STATIC_LIBRARY FILES "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/build/Release/cfltk.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/lib/cfltk.lib")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/lib" TYPE STATIC_LIBRARY FILES "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/build/MinSizeRel/cfltk.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/lib/cfltk.lib")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/lib" TYPE STATIC_LIBRARY FILES "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/build/RelWithDebInfo/cfltk.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk/cfl.h;C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk/cfl_box.h;C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk/cfl_browser.h;C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk/cfl_button.h;C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk/cfl_dialog.h;C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk/cfl_draw.h;C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk/cfl_enums.h;C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk/cfl_group.h;C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk/cfl_image.h;C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk/cfl_input.h;C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk/cfl_lock.h;C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk/cfl_macros.h;C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk/cfl_menu.h;C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk/cfl_misc.h;C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk/cfl_prefs.h;C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk/cfl_printer.h;C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk/cfl_surface.h;C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk/cfl_table.h;C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk/cfl_term.h;C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk/cfl_text.h;C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk/cfl_tree.h;C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk/cfl_utils.h;C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk/cfl_valuator.h;C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk/cfl_widget.h;C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk/cfl_widget.hpp;C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk/cfl_window.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/include/cfltk" TYPE FILE FILES
    "C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk/include/cfl.h"
    "C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk/include/cfl_box.h"
    "C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk/include/cfl_browser.h"
    "C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk/include/cfl_button.h"
    "C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk/include/cfl_dialog.h"
    "C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk/include/cfl_draw.h"
    "C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk/include/cfl_enums.h"
    "C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk/include/cfl_group.h"
    "C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk/include/cfl_image.h"
    "C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk/include/cfl_input.h"
    "C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk/include/cfl_lock.h"
    "C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk/include/cfl_macros.h"
    "C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk/include/cfl_menu.h"
    "C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk/include/cfl_misc.h"
    "C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk/include/cfl_prefs.h"
    "C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk/include/cfl_printer.h"
    "C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk/include/cfl_surface.h"
    "C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk/include/cfl_table.h"
    "C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk/include/cfl_term.h"
    "C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk/include/cfl_text.h"
    "C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk/include/cfl_tree.h"
    "C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk/include/cfl_utils.h"
    "C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk/include/cfl_valuator.h"
    "C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk/include/cfl_widget.h"
    "C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk/include/cfl_widget.hpp"
    "C:/Users/note/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/fltk-sys-1.5.10/cfltk/include/cfl_window.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/share/cmake/cfltk/cfltkConfig.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/share/cmake/cfltk/cfltkConfig.cmake"
         "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/build/CMakeFiles/Export/0bbe9eebe0efed80bbaaef7053548487/cfltkConfig.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/share/cmake/cfltk/cfltkConfig-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/share/cmake/cfltk/cfltkConfig.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/share/cmake/cfltk/cfltkConfig.cmake")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/share/cmake/cfltk" TYPE FILE FILES "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/build/CMakeFiles/Export/0bbe9eebe0efed80bbaaef7053548487/cfltkConfig.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/share/cmake/cfltk/cfltkConfig-debug.cmake")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/share/cmake/cfltk" TYPE FILE FILES "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/build/CMakeFiles/Export/0bbe9eebe0efed80bbaaef7053548487/cfltkConfig-debug.cmake")
  endif()
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/share/cmake/cfltk/cfltkConfig-minsizerel.cmake")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/share/cmake/cfltk" TYPE FILE FILES "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/build/CMakeFiles/Export/0bbe9eebe0efed80bbaaef7053548487/cfltkConfig-minsizerel.cmake")
  endif()
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/share/cmake/cfltk/cfltkConfig-relwithdebinfo.cmake")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/share/cmake/cfltk" TYPE FILE FILES "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/build/CMakeFiles/Export/0bbe9eebe0efed80bbaaef7053548487/cfltkConfig-relwithdebinfo.cmake")
  endif()
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/share/cmake/cfltk/cfltkConfig-release.cmake")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/share/cmake/cfltk" TYPE FILE FILES "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/build/CMakeFiles/Export/0bbe9eebe0efed80bbaaef7053548487/cfltkConfig-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/share/cmake/cfltk/cfltkConfigVersion.cmake")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/share/cmake/cfltk" TYPE FILE FILES "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/build/cfltkConfigVersion.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/share/pkgconfig/cfltk.pc")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/share/pkgconfig" TYPE FILE FILES "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/build/cfltk.pc")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/build/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
if(CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_COMPONENT MATCHES "^[a-zA-Z0-9_.+-]+$")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
  else()
    string(MD5 CMAKE_INST_COMP_HASH "${CMAKE_INSTALL_COMPONENT}")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INST_COMP_HASH}.txt")
    unset(CMAKE_INST_COMP_HASH)
  endif()
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "C:/Users/note/Documents/Faculdade/Bengala Fecaf/projeto - Rust/project/server rust/rust/target/debug/build/fltk-sys-f6528b1d7b7851ab/out/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
