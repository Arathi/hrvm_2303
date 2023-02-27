grammar Task;

task
    : level name description memory inbox outbox EOF
    ;

level
    : 'level:' NUMBER EOL ;

name
    : 'name:' STRING EOL ;

description
    : 'description:' STRING EOL ;

memory
    : ''

LEVEL : 'level:' ;

NUMBER : [0-9]+ ;

EOL : ('\r\n' | '\n' | '\r') ;
