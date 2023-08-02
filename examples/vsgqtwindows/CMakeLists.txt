set(SOURCES
    main.cpp
)

set(HEADERS
)

add_executable(vsgqtwindows ${MODE} ${SOURCES} ${HEADERS} ${FORMS})

target_link_libraries(vsgqtwindows vsgQt)

if (vsgXchange_FOUND)
    target_compile_definitions(vsgqtwindows PRIVATE vsgXchange_FOUND)
    target_link_libraries(vsgqtwindows vsgXchange::vsgXchange)
endif()

if(ENABLE_QT_SUFFIX)
    set_target_properties(vsgqtwindows
        PROPERTIES
            OUTPUT_NAME vsgqtwindows${VSGQT_PACKAGE_SUFFIX}
    )
endif()

install(TARGETS vsgqtwindows DESTINATION bin)

