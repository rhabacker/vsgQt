set(SOURCES
    main.cpp
)

set(HEADERS
)

add_executable(vsgqtmdi ${MODE} ${SOURCES} ${HEADERS} ${FORMS})

target_link_libraries(vsgqtmdi vsgQt)

if (vsgXchange_FOUND)
    target_compile_definitions(vsgqtmdi PRIVATE vsgXchange_FOUND)
    target_link_libraries(vsgqtmdi vsgXchange::vsgXchange)
endif()

if(ENABLE_QT_SUFFIX)
    set_target_properties(vsgqtmdi
        PROPERTIES
            OUTPUT_NAME vsgqtmdi${VSGQT_PACKAGE_SUFFIX}
    )
endif()

install(TARGETS vsgqtmdi DESTINATION bin)

