# Generated from C:/Users/foroz/Desktop/Compilador\lenguajeutb.g4 by ANTLR 4.7
from antlr4 import *
from antlr4.tree.Tree import TerminalNodeImpl
if __name__ is not None and "." in __name__:
    from .lenguajeutbParser import lenguajeutbParser
else:
    from lenguajeutbParser import lenguajeutbParser

# This class defines a complete generic visitor for a parse tree produced by lenguajeutbParser.

class lenguajeutbVisitor(ParseTreeVisitor):
    tabla_de_simbolos = {}
    resultado = ""

    # Visit a parse tree produced by lenguajeutbParser#start_rule.
    def visitStart_rule(self, ctx:lenguajeutbParser.Start_ruleContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by lenguajeutbParser#mensaje.
    def visitMensaje(self, ctx:lenguajeutbParser.MensajeContext):
        if ctx.n is not None:
            print("#",ctx.n.text)
        return self.visitChildren(ctx)


    # Visit a parse tree produced by lenguajeutbParser#nombre_programa.
    def visitNombre_programa(self, ctx:lenguajeutbParser.Nombre_programaContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by lenguajeutbParser#variables.
    def visitVariables(self, ctx:lenguajeutbParser.VariablesContext):
        print("\n.Section \t .Data")
        return self.visitChildren(ctx)


    # Visit a parse tree produced by lenguajeutbParser#declaracion.
    def visitDeclaracion(self, ctx:lenguajeutbParser.DeclaracionContext):

        if ctx.entero is not None and ctx.v_entero is not None:
            resultado = None

            for hijo in ctx.children:
                 resultado = self.visit(hijo)
            if resultado == int:
                var = (ctx.entero.text).split('$')
                print(var[1], ".int", (str(ctx.v_entero)))
                lenguajeutbVisitor.tabla_de_simbolos[ctx.entero.text] = int
            else:
                var = (ctx.entero.text).split('$')
                print(var[1], ".int", (str(ctx.v_entero)))

        if ctx.entero is not None and ctx.v_entero is None:
            lenguajeutbVisitor.tabla_de_simbolos[ctx.entero.text] = int

        if ctx.real is not None:
            resultado = None
            for hijo in ctx.children:
                resultado = self.visit(hijo)
            if resultado == float:
                lenguajeutbVisitor.tabla_de_simbolos[ctx.real.text] = float
            else:
                raise ValueError

        if ctx.texto is not None:
            resultado = None
            for hijo in ctx.children:
                resultado = self.visit(hijo)
            if resultado == str:
                lenguajeutbVisitor.tabla_de_simbolos[ctx.texto.text] = str
            else:
                raise ValueError

        if ctx.booleano is not None:
            resultado = None
            for hijo in ctx.children:
                resultado = self.visit(hijo)
            if resultado == bool:
                lenguajeutbVisitor.tabla_de_simbolos[ctx.booleano.text] = bool
            else:
                raise ValueError

        if ctx.lista_entero is not None:
            lenguajeutbVisitor.tabla_de_simbolos[ctx.lista_entero.text] = ([],int)
        elif ctx.lista_real is not None:
            lenguajeutbVisitor.tabla_de_simbolos[ctx.lista_real.text] = ([], float)
        elif ctx.lista_texto is not None:
            lenguajeutbVisitor.tabla_de_simbolos[ctx.lista_texto.text] = ([], str)
        elif ctx.lista_booleano is not None:
            lenguajeutbVisitor.tabla_de_simbolos[ctx.lista_booleano.text] = ([], bool)

        if ctx.matriz_entero is not None:
            lenguajeutbVisitor.tabla_de_simbolos[ctx.matriz_entero.text] = ([[]],int)
        elif ctx.lista_real is not None:
            lenguajeutbVisitor.tabla_de_simbolos[ctx.matriz_real.text] = ([[]], float)
        elif ctx.matriz_texto is not None:
            lenguajeutbVisitor.tabla_de_simbolos[ctx.matriz_texto.text] = ([[]], str)
        elif ctx.matriz_booleano is not None:
            lenguajeutbVisitor.tabla_de_simbolos[ctx.matriz_booleano.text] = ([[]], bool)

        return self.visitChildren(ctx)



    # Visit a parse tree produced by lenguajeutbParser#flujo.
    def visitFlujo(self, ctx:lenguajeutbParser.FlujoContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by lenguajeutbParser#sentencias.
    def visitSentencias(self, ctx:lenguajeutbParser.SentenciasContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by lenguajeutbParser#asignacion.
    def visitAsignacion(self, ctx:lenguajeutbParser.AsignacionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by lenguajeutbParser#ciclo_para.
    def visitCiclo_para(self, ctx:lenguajeutbParser.Ciclo_paraContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by lenguajeutbParser#ciclo_mientras.
    def visitCiclo_mientras(self, ctx:lenguajeutbParser.Ciclo_mientrasContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by lenguajeutbParser#si.
    def visitSi(self, ctx:lenguajeutbParser.SiContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by lenguajeutbParser#expresion.
    def visitExpresion(self, ctx:lenguajeutbParser.ExpresionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by lenguajeutbParser#div.
    def visitDiv(self, ctx:lenguajeutbParser.DivContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by lenguajeutbParser#atom.
    def visitAtom(self, ctx:lenguajeutbParser.AtomContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by lenguajeutbParser#condicion.
    def visitCondicion(self, ctx:lenguajeutbParser.CondicionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by lenguajeutbParser#posicion.
    def visitPosicion(self, ctx:lenguajeutbParser.PosicionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by lenguajeutbParser#conversion.
    def visitConversion(self, ctx:lenguajeutbParser.ConversionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by lenguajeutbParser#acceso_lista.
    def visitAcceso_lista(self, ctx:lenguajeutbParser.Acceso_listaContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by lenguajeutbParser#acceso_matriz.
    def visitAcceso_matriz(self, ctx:lenguajeutbParser.Acceso_matrizContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by lenguajeutbParser#imprimir.
    def visitImprimir(self, ctx:lenguajeutbParser.ImprimirContext):
        return self.visitChildren(ctx)



del lenguajeutbParser