command="CALL UpdateJenkins('$GIT_COMMIT', 'SUCCESS');"
mysql -u [USERNAME] -p'[PASSWORD]' -h "[IP_ADDRESS]" --execute="$command" -D Program_info
