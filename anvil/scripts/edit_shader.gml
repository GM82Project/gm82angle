if (FILENAME!="" && file_exists(FILENAME)) {
    execute_shell(FILENAME,"")
    window_minimize()
    EDITING=1
}
