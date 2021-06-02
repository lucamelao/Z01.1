/**
 * Curso: Elementos de Sistemas
 * Arquivo: Assemble.java
 * Created by Luciano <lpsoares@insper.edu.br>
 * Date: 04/02/2017
 *
 * 2018 @ Rafael Corsi
 */

package assembler;

import java.io.*;

/**
 * Faz a geração do código gerenciando os demais módulos
 */
public class Assemble {
    private String inputFile;              // arquivo de entrada nasm
    File hackFile = null;                  // arquivo de saída hack
    private PrintWriter outHACK = null;    // grava saida do código de máquina em Hack
    boolean debug;                         // flag que especifica se mensagens de debug são impressas
    private SymbolTable table;             // tabela de símbolos (variáveis e marcadores)
    private int breakIndex;

    /*
     * inicializa assembler
     * @param inFile
     * @param outFileHack
     * @param debug
     * @throws IOException
     */
    public Assemble(String inFile, String outFileHack, boolean debug) throws IOException {
        this.debug = debug;
        inputFile  = inFile;
        hackFile   = new File(outFileHack);                      // Cria arquivo de saída .hack
        outHACK    = new PrintWriter(new FileWriter(hackFile));  // Cria saída do print para
                                                                 // o arquivo hackfile
        table      = new SymbolTable();                          // Cria e inicializa a tabela de simbolos
    }

    /**
     * primeiro passo para a construção da tabela de símbolos de marcadores (labels)
     * varre o código em busca de novos Labels e Endereços de memórias (variáveis)
     * e atualiza a tabela de símbolos com os endereços (table).
     *
     * Dependencia : Parser, SymbolTable
     * @return
     */
    public SymbolTable fillSymbolTable() throws FileNotFoundException, IOException {

        // primeira passada pelo código deve buscar os labels
        // LOOP:
        // END:
        Parser parser = new Parser(inputFile);
        int romAddress = 0;
        Boolean flagJump = false;
        while (parser.advance()) {
            if (parser.commandType(parser.command()) == Parser.CommandType.L_COMMAND) {
                String label = parser.label(parser.command());
                /* TODO: implementar */
                // deve verificar se tal label já existe na tabela,
                // se não, deve inserir. Caso contrário, ignorar.
                if (flagJump) {
                    romAddress++;
                }
                flagJump = false;
                if (!table.contains(label)) {
                    table.addEntry(label, romAddress);
                }
            }
            else{
                String com = parser.command();
                if (flagJump && !com.equals("nop")) {
                    romAddress++;
                }
                flagJump = false;
                if (com.equals("jmp") || com.equals("je") || com.equals("jne") || com.equals("jg") || com.equals("jge") || com.equals("jl") || com.equals("jle")) {
                    flagJump = true;
                } else if (com.equals("break")) {
                    romAddress++;
                    romAddress++;
                }
                romAddress++;
            }
        }
        table.addEntry("break", romAddress);
        breakIndex = romAddress;
        parser.close();

        // a segunda passada pelo código deve buscar pelas variáveis
        // leaw $var1, %A
        // leaw $X, %A
        // para cada nova variável deve ser alocado um endereço,
        // começando no RAM[15] e seguindo em diante.
        parser = new Parser(inputFile);
        int ramAddress = 15;
        while (parser.advance()){
            if (parser.commandType(parser.command()) == Parser.CommandType.A_COMMAND) {
                String symbol = parser.symbol(parser.command());
                if (Character.isDigit(symbol.charAt(0))){
                    /* TODO: implementar */
                    // deve verificar se tal símbolo já existe na tabela,
                    // se não, deve inserir associando um endereço de
                    // memória RAM a ele.
                    if (!table.contains(symbol)) {
                        table.addEntry(symbol, ramAddress);
                    }
                }
            }
            else{
                ramAddress++;
            }
        }
        parser.close();
        return table;
    }

    /**
     * Segundo passo para a geração do código de máquina
     * Varre o código em busca de instruções do tipo A, C
     * gerando a linguagem de máquina a partir do parse das instruções.
     *
     * Dependencias : Parser, Code
     */
    public void generateMachineCode() throws FileNotFoundException, IOException{
        Parser parser = new Parser(inputFile);  // abre o arquivo e aponta para o começo
        Code code = new Code();
        String instruction  = "";
        Boolean flagJump = false;
        Boolean flagNop = false;
        Boolean flagBreak = false;
        String linha = "";

        /**
         * Aqui devemos varrer o código nasm linha a linha
         * e gerar a string 'instruction' para cada linha
         * de instrução válida do nasm
         * seguindo o instruction set
         */
        while (parser.advance()){
            flagBreak = false;
            instruction = "";
            String command = parser.command();
            switch (parser.commandType(parser.command())){
                /* TODO: implementar */
                case C_COMMAND:
                    if (!command.equals("break")) {
                        instruction += "10";
                        instruction += code.comp(parser.instruction(command));
                        instruction += code.dest(parser.instruction(command));
                        String jump = code.jump(parser.instruction(command));
                        instruction += jump;
                        if (!instruction.equals("100000000000000000") && flagJump) {
                            System.out.println("Está faltando 'nop' após a linha " + linha + ".");
                            flagNop = true;
                        }
                        flagJump = false;
                        if (jump != "000") {
                            linha = String.valueOf(parser.getLineNumber());
                            flagJump = true;
                        }
                    } else {
                        instruction = "00" + Code.toBinary(String.valueOf(breakIndex));
                        System.out.println("BREAK FOI FEITO.");
                        outHACK.println(instruction);
                        outHACK.println("100000011000000111");
                        outHACK.println("100000000000000000");
                        flagBreak = true;
                    }
                    break;
                case A_COMMAND:
                    String symbol = parser.symbol(command);
                    try{
                        instruction = "00" + Code.toBinary(symbol);
                    } catch (Exception e){
                        instruction = "00" + Code.toBinary(table.getAddress(symbol).toString());
                    }
                    if (flagJump) {
                        System.out.println("Está faltando 'nop' após a linha " + linha + ".");
                        flagNop = true;
                    }
                    flagJump = false;
                    break;

                default:
                    continue;
            }
            // Escreve no arquivo .hack a instrução
            if(outHACK!=null && !flagBreak) {
                if (flagNop) {
                    outHACK.println("100000000000000000");
                    flagNop = false;
                }
                outHACK.println(instruction);
            }
            instruction = null;
        }
        if (flagJump) {
            System.out.println("Está faltando 'nop' após a linha " + linha + ".");
            outHACK.println("100000000000000000");
        }

    }

    /**
     * Fecha arquivo de escrita
     */
    public void close() throws IOException {
        if(outHACK!=null) {
            outHACK.close();
        }
    }

    /**
     * Remove o arquivo de .hack se algum erro for encontrado
     */
    public void delete() {
        try{
            if(hackFile!=null) {
                hackFile.delete();
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

}
