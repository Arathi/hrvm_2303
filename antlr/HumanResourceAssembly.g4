grammar HumanResourceAssembly;

program
    : line* EOF
    ;

line
    : label? (macroInstruction | instruction)? EOL
    ;

label
    : labelName ':'
    ;

labelName
    : symbol
    ;

macroInstruction
    : org
    | set
    ;

instruction
    : brk
    | nop
    | pla
    | pha
    | lda
    | sta
    | add
    | sub
    | inc
    | dec
    | jmp
    | beq
    | bmi
    ;

/* Macro Instructions */

org
    : ORG uint
    ;

set
    : SET symbol ',' uint
    ;

/* Instructions */

brk
    : BRK
    ;

nop
    : NOP
    ;

pla
    : PLA
    ;

pha
    : PHA
    ;

lda
    : LDA absoluteAddressing
    | LDA indirectAddressing
    ;

sta
    : STA absoluteAddressing
    | STA indirectAddressing
    ;

add
    : ADD absoluteAddressing
    | ADD indirectAddressing
    ;

sub
    : SUB absoluteAddressing
    | SUB indirectAddressing
    ;

inc
    : INC absoluteAddressing
    | INC indirectAddressing
    ;

dec
    : DEC absoluteAddressing
    | DEC indirectAddressing
    ;

jmp
    : JMP absoluteAddressing
    ;

beq
    : BEQ relativeAddressing
    ;

bmi
    : BMI relativeAddressing
    ;

/* Addressing Modes */

absoluteAddressing
    : uint
    | symbol
    ;

indirectAddressing
    : LBRACKET uint RBRACKET
    | LBRACKET symbol RBRACKET
    ;

relativeAddressing
    : int
    | symbol
    ;

/* Arguments */

symbol
    : NAME
    ;

uint
    : DECIMAL
    | HEXADECIMAL
    ;

int
    : SIGN? DECIMAL
    | HEXADECIMAL
    ;

/* Tokens */

LBRACKET
    : '['
    ;

RBRACKET
    : ']'
    ;

SET
    : ('.SET' | '.set')
    ;

ORG
    : ('.ORG' | '.org')
    ;

BRK
    : ('BRK' | 'brk')
    ;

NOP
    : ('NOP' | 'nop')
    ;

PLA
    : ('PLA' | 'pla')
    ;

PHA
    : ('PHA' | 'pha')
    ;

LDA
    : ('LDA' | 'lda')
    ;

STA
    : ('STA' | 'sta')
    ;

ADD
    : ('ADD' | 'add')
    ;

SUB
    : ('SUB' | 'sub')
    ;

INC
    : ('INC' | 'inc')
    ;

DEC
    : ('DEC' | 'dec')
    ;

JMP
    : ('JMP' | 'jmp')
    ;

BEQ
    : ('BEQ' | 'beq')
    ;

BMI
    : ('BMI' | 'bmi')
    ;

NAME
    : [A-Za-z_] [0-9A-Za-z_]*
    ;

SIGN
    : ('+' | '-')
    ;

DECIMAL
    : [0-9]+
    ;

HEXADECIMAL
    : '$' [0-9A-Fa-f]+
    ;

EOL
    : ('\r\n' | '\n' | '\r')
    ;

COMMENT
    :  ';' ~ [\r\n]* -> skip
    ;

SPACE
    : [ \t]+ -> skip
    ;