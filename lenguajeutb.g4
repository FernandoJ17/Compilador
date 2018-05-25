grammar lenguajeutb;

start_rule: mensaje* nombre_programa variables flujo;
mensaje:    n=NOTA;
nombre_programa: NOMBRE_EJERCICIO NOMBRE_PRG;
variables: VARIABLES declaracion* FIN_VARIABLES;
declaracion: (TIPO (
TIPO_ENTERO NOMBRE entero=IDENTIFICADOR (VALOR_INICIAL v_entero=expresion)?
| TIPO_REAL NOMBRE real=IDENTIFICADOR (VALOR_INICIAL v_real=expresion)?
| TIPO_TEXTO NOMBRE texto=IDENTIFICADOR (VALOR_INICIAL v_texto=STRING)?
| TIPO_BOOLEANO NOMBRE booleano=IDENTIFICADOR (VALOR_INICIAL v_booleano=expresion)?
| TIPO_LISTA_DE_ENTERO NOMBRE lista_entero=IDENTIFICADOR
| TIPO_LISTA_DE_TEXTO NOMBRE lista_texto=IDENTIFICADOR
| TIPO_LISTA_DE_REAL NOMBRE lista_real=IDENTIFICADOR
| TIPO_LISTA_DE_BOOLEANO NOMBRE lista_booleano=IDENTIFICADOR
| TIPO_MATRIZ_DE_BOOLEANO NOMBRE matriz_booleano=IDENTIFICADOR
| TIPO_MATRIZ_DE_TEXTO NOMBRE matriz_texto=IDENTIFICADOR
| TIPO_MATRIZ_DE_ENTERO NOMBRE matriz_entero=IDENTIFICADOR
| TIPO_MATRIZ_DE_REAL NOMBRE matriz_real=IDENTIFICADOR
))+;
flujo: FLUJO sentencias* FIN_FLUJO;
sentencias: (asignacion|ciclo_para|ciclo_mientras|si|imprimir|expresion);

asignacion: CAMBIAR_VALOR_DE IDENTIFICADOR POR expresion;
ciclo_para: INICIO_PARA expresion+ EN sentencias+  FIN_PARA;
ciclo_mientras: INICIO_MIENTRAS expresion+ ':' sentencias+ FIN_MIENTRAS;
si: INICIO_SI  expresion+ ENTONCES sentencias+ (SINO ENTONCES sentencias+)? FIN_SI;


expresion: div ((SUMA|RESTA) div)*;
div: atom ((MULTIPLICACION|DIVISION|MODULO) atom)*;
atom: (t=STRING|e=ENTERO|r=REAL|b=BOOL|PAR_IZQ exp=expresion PAR_DER|conv=conversion|iden=IDENTIFICADOR|condicion|IDENTICO|posicion);
condicion:  (MAYOR|MAYOR_IGUAL|MENOR|MENOR_IGUAL|MOSTRAR_EN_PANTALLA|IGUAL|DESIGUALDA);
posicion:    (EN_COORDENADA|EN_POSICION);
conversion: CONVERTIR expresion A (TIPO_ENTERO|TIPO_REAL|TIPO_TEXTO|TIPO_BOOLEANO);
acceso_lista: CAMBIAR_VALOR_DE IDENTIFICADOR EN_POSICION expresion POR expresion;
acceso_matriz: CAMBIAR_VALOR_DE IDENTIFICADOR EN_COORDENADA PAR_IZQ expresion COMA expresion PAR_DER;

imprimir: MOSTRAR_EN_PANTALLA exp=expresion (',' expresion)*;

SINO: 'sino';
ENTONCES: 'entonces';
MOSTRAR_EN_PANTALLA: 'mostrar_en_pantalla';
COMA: ',';
INICIO_PARA: 'inicio_para';
FIN_PARA: 'fin_para';
INICIO_MIENTRAS: 'mientras';
FIN_MIENTRAS: 'fin_mientras';
INICIO_SI: 'si';
FIN_SI: 'fin_si';

MAYOR:              'es_mayor_que';
MAYOR_IGUAL:        'es_mayor_o_igual_que';
MENOR:              'es_menor_que';
MENOR_IGUAL:        'es_menor_o_igual_que';
IGUAL:              'es_igual_que';
DESIGUALDA:         'no_es_igual_a';


POR: 'por';
CAMBIAR_VALOR_DE: 'cambiar_valor_de';
NOMBRE_EJERCICIO: 'Nombre_del_ejercicio';
NOTA            : 'nota:' ('A'..'Z'|' '|'a'..'z'|'_'|'0'..'9'|'$')+;
VARIABLES       : 'variables';
FIN_VARIABLES   : 'fin_variables';
FLUJO           : 'Flujo';
FIN_FLUJO       : 'fin_flujo';
VALOR           : 'valor';
DE              : 'de';
AGREGAR         : 'agregar';
OP_POSC         : '<-';
CAMBIAR         : 'cambiar';

EN_POSICION        : 'en_la_posicion';
EN_COORDENADA   : 'en_la_coordenada';
COORDENADA      : '('('0'..'9')+','('0'..'9')+')';
CONVERTIR       : 'convertir';
A               : 'a';
LEER            : 'leer';
TIPO            : 'tipo';


TIPO_LISTA_DE_ENTERO: 'lista_de_entero';
TIPO_LISTA_DE_REAL: 'lista_de_real';
TIPO_LISTA_DE_BOOLEANO: 'lista_de_booleano';
TIPO_LISTA_DE_TEXTO: 'lista_de_texto';

TIPO_MATRIZ_DE_ENTERO: 'matriz_de_entero';
TIPO_MATRIZ_DE_REAL: 'matriz_de_real';
TIPO_MATRIZ_DE_BOOLEANO: 'matriz_de_booleano';
TIPO_MATRIZ_DE_TEXTO: 'matriz_de_texto';

TIPO_ENTERO: 'entero';
TIPO_REAL: 'real';
TIPO_BOOLEANO: 'booleano';
TIPO_TEXTO: 'texto';

EN:             'en';
NOMBRE          : 'nombre';
VALOR_INICIAL   : 'valor_inicial';
TAMANO          : 'tamano';
EQUIS           : 'x';

PAR_IZQ: '(';
PAR_DER: ')';

O: 'o';
SUMA: '+';
RESTA: '-';
MULTIPLICACION: '*';
DIVISION: '/';
MODULO: '%';
IDENTICO:   '=';

ENTERO          : ('-')?('0'..'9')+;
REAL            : ('-')?('0'..'9')+'.'('0'..'9')+;
CHAR            : ('A'..'Z'|'a'..'z');
BOOL            : 'FALSO'|'VERDADERO';
STRING          : '"'('a'..'z'|'A'..'Z'|'0'..'9'|' '|'-'|'_'|'?'|'!'|'$'|'.'|',')*'"';
COMILLAS_DOBLES: '<>';
TEXTO           : COMILLAS_DOBLES (('A'..'Z'|'a'..'z'|'_')+) COMILLAS_DOBLES;
IDENTIFICADOR   : '$'('A'..'Z'|'a'..'z'|'_')('A'..'Z'|'a'..'z'|'_'|'0'..'9')*;
NOMBRE_PRG: ('A'..'Z'|'a'..'z'|'_')('A'..'Z'|'a'..'z'|'_'|'0'..'9')*;

WS              : [ \t\r\n]+ -> skip;

//OBSERVACION 1: LOS INDICES DE DEBEN CONVERTIRSE A POSITIVOS
// YA QUE ESTAN CON EL TOKEN 'ENTERO' QUE ADMITE NUMEROS NEGATIVOS
// APLICA PARA: lista, compuesto, tipo_matriz
