#------------------------------------------------------------------------------#
# Copyright (c) 2014 Los Alamos National Security, LLC
# All rights reserved.
#------------------------------------------------------------------------------#

#------------------------------------------------------------------------------#
# Add Caliper support.
#------------------------------------------------------------------------------#

option(ENABLE_CALIPER "Enable Caliper" OFF)

if(ENABLE_CALIPER)
    find_package(Caliper REQUIRED)

    if(NOT Caliper_FOUND)
	    message(FATAL_ERROR "Caliper is required for this build configuration")
    endif()

    message(STATUS "Found Caliper: ${Caliper_INCLUDE_DIRS}")

    include_directories(${Caliper_INCLUDE_DIRS})
    add_definitions(-DENABLE_CALIPER)
    list(APPEND CINCH_RUNTIME_LIBRARIES ${Caliper_LIBRARIES})
    if(ENABLE_MPI)
        list(APPEND CINCH_RUNTIME_LIBRARIES ${Caliper_MPI_LIBRARIES})
    endif(ENABLE_MPI)
endif(ENABLE_CALIPER)

#------------------------------------------------------------------------------#
# Formatting options for emacs and vim.
# vim: set tabstop=4 shiftwidth=4 expandtab :
#------------------------------------------------------------------------------#
