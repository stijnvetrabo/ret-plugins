function _autocomplete_splunk_index() {
    # Get the possible prefix for the values. For example "-i=" or "" when -i is followed by a space rather than "="
    local flag_word_prefix=$([[ ${words[$CURRENT]} =~ ^.*= ]] && echo -n "$MATCH")
    # Get the value from the option -i or else --index
    local index_flag_value=${RET_COMBINED_OPT_ARGS[-i]-${RET_COMBINED_OPT_ARGS[--index]}}
    desc=("${(@f)$(RET_ENV=ZSH_AUTOCOMPLETE ret splunk autocomplete indexes --word="${index_flag_value}")}")
    vals=( ${desc%%:*} )
    compadd -p "$flag_word_prefix" -d desc -aQU vals
    compstate[insert]=menu # no expand
}
