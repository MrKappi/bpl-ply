#modules
import ply.lex as lex
import sys

#%---- tokens/re
reserved = {
    'if': 'IF_STMT',
    'else': 'ELSE_STMT',
    'return': 'RETURN_STMT',
    'write': 'WRITE_FUNCT',
    'writeln': 'WRITELN_FUNCT',
    'read': 'READ_FUNCT',
    'int' : 'INTEGER_TYPE',
    'string' : 'STRING_TYPE',
    'void' : 'VOID_TYPE',
}


tokens = [
    'COMMENT',
    'NEW_LINE',
    'STRING',
    'NUMBER',
    'REFERENCE',
    #'POINTERTYPE',
    'SEMI_COLON',
    'COMMA',
    'L_CURLY',
    'R_CURLY',
    'L_PAREN',
    'R_PAREN',
    'L_BRACKET',
    'R_BRACKET',
    'MATH_OPERATOR',
    'LOGIC_OPERATOR',
    'ASIGNATION',
    'COMPOUND_STMT',
    'IDENTIFIER',
]+list(reserved.values())

t_ignore  = '\t \b' 

def t_error(t):
    print("Illegal character '%s'" % t.value[0])
    t.lexer.skip(1)

def t_NEW_LINE(t):
    r"\n+"
    global count_line
    count_line+=1
    return

t_COMMENT= r'(?s)/\*((.|\n)*?)(.|\n)?(\*/)'
t_STRING = r'(?s)\"((.|\n)*?)(.|\n)?(\")'
t_NUMBER = r'[0-9]+'
t_REFERENCE = r'&'
t_SEMI_COLON = r';'
t_COMMA = r','
t_R_CURLY = r'}'
t_L_CURLY = r'{'
t_R_PAREN = r'\)'
t_L_PAREN = r'\('
t_L_BRACKET = r'\['
t_R_BRACKET = r'\]'
t_MATH_OPERATOR = r'(\+|-|\*|\/|%)'
t_LOGIC_OPERATOR = r'(<=|<|==|!=|>|>=)'
t_ASIGNATION = r'(=)'

def t_IDENTIFIER(t): 
    r'[_a-zA-Z][_a-zA-Z0-9]*' #despues reservar si es palabra reservada
    t.type = reserved.get(t.value,'IDENTIFIER')
    return t

#%----code
def check_cmd():
    if(len(sys.argv) == 1):
        print("Usage: compiler.py file.bpl")
        exit(1)
    return

def getFile():
    check_cmd()
    fullFile = ""
    with open(sys.argv[1]) as openedFile:
        File = openedFile.read()
        print(sys.argv[1])
    return File

def decoder(File):
    lexer = lex.lex()
    lexer.input(File)

    for tok in lexer:
        print("Line:",count_line," ~ ",tok.type, ": ", tok.value, sep="")                         
            
def main():
    global count_line
    count_line = 0
    decoder(getFile())
    return

if __name__ == "__main__":
    main()

    