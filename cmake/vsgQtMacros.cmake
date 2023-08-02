
#
# create and install cmake support files
#
# available arguments:
#
#    [EXPORT_PREFIX <prefix>] prefix for the export target name
#                             If not specified, ${PROJECT_NAME} is used
#
# @TODO: merge into vsg
macro(vsg_qt_setup_dir_vars)
    set(options)
    set(oneValueArgs EXPORT_PREFIX)
    set(multiValueArgs)
    cmake_parse_arguments(VQSDV "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    set(OUTPUT_BINDIR ${PROJECT_BINARY_DIR}/bin)
    set(OUTPUT_LIBDIR ${PROJECT_BINARY_DIR}/lib)

    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${OUTPUT_LIBDIR})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${OUTPUT_BINDIR})

    include(GNUInstallDirs)

    if(VQSDV_EXPORT_PREFIX)
        set(EXPORT_PREFIX ${VQSDV_EXPORT_PREFIX})
    else()
        set(EXPORT_PREFIX ${PROJECT_NAME})
    endif()

    if(WIN32)
        set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${OUTPUT_BINDIR})
        # set up local bin directory to place all binaries
        make_directory(${OUTPUT_BINDIR})
        make_directory(${OUTPUT_LIBDIR})
        set(VSGQT_INSTALL_TARGETS_DEFAULT_FLAGS
            EXPORT ${EXPORT_PREFIX}Targets
            RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
            LIBRARY DESTINATION ${CMAKE_INSTALL_BINDIR}
            ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
            INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
        )
    else()
        set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${OUTPUT_LIBDIR})
        # set up local bin directory to place all binaries
        make_directory(${OUTPUT_LIBDIR})
        set(VSGQT_INSTALL_TARGETS_DEFAULT_FLAGS
            EXPORT ${EXPORT_PREFIX}Targets
            RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
            LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
            ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
            INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
        )
    endif()
endmacro()


