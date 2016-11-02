# qmake template project include file by Lunina

isEmpty(TEMPLATE_PRI_IS_USED) {
        TEMPLATE_PRI_IS_USED = true
} else {
        error(qmake-template.pri included more than once. Check your .pro file)
}

contains( TEMPLATE, app ) {
        DESTDIR = $${PROJECT_ROOT}/../bin
}

CONFIG(debug, debug|release) {
        DEBUG_SUFFIX = .debug
        !contains( TARGET, $$DEBUG_SUFFIX ) {
                TARGET = $$join(TARGET,,,$$DEBUG_SUFFIX)
                TARGET_SUFFIX = $$DEBUG_SUFFIX
        }
}

BUILDPATH   = $${PROJECT_ROOT}/build/$$TARGET


OBJECTS_DIR = $${BUILDPATH}/obj
RCC_DIR     = $${BUILDPATH}/rcc
MOC_DIR     = $${BUILDPATH}/moc
UI_DIR      = $${BUILDPATH}/ui
