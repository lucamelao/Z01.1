/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 */

package assembler;

/**
 * Traduz mnemônicos da linguagem assembly para códigos binários da arquitetura Z0.
 */
public class Code {

    /**
     * Retorna o código binário do(s) registrador(es) que vão receber o valor da instrução.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 4 bits) com código em linguagem de máquina para a instrução.
     */
    public static String dest(String[] mnemnonic) {
        /* TODO: implementar */

        if (mnemnonic.length < 2){
            return "0000";
        }

        if (mnemnonic.length > 3) {
            switch (mnemnonic[mnemnonic.length - 1]) {
                case "%A":
                    switch (mnemnonic[mnemnonic.length - 2]) {
                        case "(%A)":
                            if (mnemnonic[0].equals("movw")){
                                return "0101";
                            }
                            return "0001";
                        case "%D":
                            return "0011";
                        case "%A":
                            return "0001";
                        default:
                            return "0000";
                    }

                case "%D":
                    switch (mnemnonic[mnemnonic.length - 2]) {
                        case "(%A)":
                            return "0110";
                        case "%A":
                            return "0011";
                        case "%D":
                            return "0010";
                        default:
                            return "0000";
                    }
                case "(%A)":
                    switch (mnemnonic[mnemnonic.length - 2]) {
                        case "%A":
                            return "0101";
                        case "%D":
                            return "0110";
                        default:
                            return "0000";
                    }
            }
        } else {
            switch (mnemnonic[mnemnonic.length - 1]) {
                case "%A"   : return "0001";
                case "%D"   : return "0010";
                case "(%A)"   : return "0100";
                default: return "0000";
            }
        }
        return "0000";
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 7 bits) com código em linguagem de máquina para a instrução.
     */
    public static String comp(String[] mnemnonic) {
        /* TODO: implementar */
        switch(mnemnonic[0]){
            case "movw":
                switch(mnemnonic[1]){
                    case "%D"   : return "000001100";
                    case "%A"   : return "000110000";
                    case "(%A)" : return "001110000";
                    default     : return "000000000";
                }
            case "notw":
                switch(mnemnonic[1]){
                    case "%D"   : return "000001101";
                    case "%A"   : return "000110001";
                    case "(%A)" : return "001110001";
                    default     : return "000000000";
                }
            case "negw":
                switch(mnemnonic[1]){
                    case "%D"   : return "000001111";
                    case "%A"   : return "000110011";
                    case "(%A)" : return "001110011";
                    default     : return "000000000";
                }
            case "incw":
                switch(mnemnonic[1]){
                    case "%D"   : return "000011111";
                    case "%A"   : return "000110111";
                    case "(%A)" : return "001110111";
                    default     : return "000000000";
                }
            case "decw":
                switch(mnemnonic[1]){
                    case "%D"   : return "000001110";
                    case "%A"   : return "000110010";
                    case "(%A)" : return "001110010";
                    default     : return "000000000";
                }
            case "orw":
                switch(mnemnonic[1]){
                    case "%D":
                        switch(mnemnonic[2]){
                            case "%A"    : return "000010101";
                            case "(%A)"  : return "001010101";
                            default      : return "000000000";
                        }
                    case "%A":
                        switch(mnemnonic[2]){
                            case "%D"    : return "000010101";
                            default      : return "000000000";
                        }
                    case "(%A)":
                        switch(mnemnonic[2]){
                            case "%D"    : return "001010101";
                            default      : return "000000000";
                        }
                    default: return "000000000";
                }
            case "andw":
                switch(mnemnonic[1]){
                    case "%D":
                        switch(mnemnonic[2]){
                            case "%A"    : return "000000000";
                            case "(%A)"  : return "001000000";
                            default      : return "000000000";
                        }
                    case "%A":
                        switch(mnemnonic[2]){
                            case "%D"    : return "000000000";
                            default      : return "000000000";
                        }
                    case "(%A)":
                        switch(mnemnonic[2]){
                            case "%D"    : return "001000000";
                            default      : return "000000000";
                        }
                    default: return "000000000";
                }
            case "addw":
                switch(mnemnonic[1]){
                    case "$0":
                        switch(mnemnonic[2]){
                            case "$0"    : return "000101010";
                            case "$1"    : return "000111111";
                            case "$-1"   : return "000111010";
                            case "%D"    : return "000001100";
                            case "%A"    : return "000110000";
                            case "(%A)"  : return "001110000";
                            default      : return "000000000";
                        }
                    case "$1":
                        switch(mnemnonic[2]){
                            case "$0"    : return "000111111";
                            case "$-1"   : return "000101010";
                            case "%D"    : return "000011111";
                            case "%A"    : return "000110111";
                            case "(%A)"  : return "001110111";
                            default      : return "000000000";
                        }
                    case "$-1":
                        switch(mnemnonic[2]){
                            case "$0"    : return "000111010";
                            case "$1"    : return "000101010";
                            case "%D"    : return "000001110";
                            case "%A"    : return "000110010";
                            case "(%A)"  : return "001110010";
                            default      : return "000000000";
                        }
                    case "%D":
                        switch(mnemnonic[2]){
                            case "$0"    : return "000001100";
                            case "$1"    : return "000011111";
                            case "$-1"   : return "000001110";
                            case "%A"    : return "000000010";
                            case "(%A)"  : return "001000010";
                            default      : return "000000000";
                        }
                    case "%A":
                        switch(mnemnonic[2]){
                            case "$0"    : return "000110000";
                            case "$1"    : return "000110111";
                            case "$-1"   : return "000110010";
                            case "%D"    : return "000000010";
                            default      : return "000000000";
                        }
                    case "(%A)":
                        switch(mnemnonic[2]){
                            case "$0"    : return "001110000";
                            case "$1"    : return "001110111";
                            case "$-1"   : return "001110010";
                            case "%D"    : return "001000010";
                            default      : return "000000000";
                        }
                    default: return "000000000";
                }
            case "subw":
                switch(mnemnonic[1]){
                    case "$0":
                        switch(mnemnonic[2]){
                            case "$0"    : return "000101010";
                            case "$1"    : return "000111010";
                            case "$-1"   : return "000111111";
                            case "%D"    : return "000001111";
                            case "%A"    : return "000110011";
                            case "(%A)"  : return "001110011";
                            default      : return "000000000";
                        }
                    case "$1":
                        switch(mnemnonic[2]){
                            case "$0"    : return "000111111";
                            case "$1"    : return "000101010";
                            default      : return "000000000";
                        }
                    case "$-1":
                        switch(mnemnonic[2]){
                            case "$0"    : return "000111010";
                            case "$-1"   : return "000101010";
                            default      : return "000000000";
                        }
                    case "%D":
                        switch(mnemnonic[2]){
                            case "$0"    : return "000001100";
                            case "$1"    : return "000001110";
                            case "$-1"   : return "000011111";
                            case "%A"    : return "000010011";
                            case "(%A)"  : return "001010011";
                            default      : return "000000000";
                        }
                    case "%A":
                        switch(mnemnonic[2]){
                            case "$0"    : return "000110000";
                            case "$1"    : return "000110010";
                            case "$-1"   : return "000110111";
                            case "%D"    : return "000000111";
                            default      : return "000000000";
                        }
                    case "(%A)":
                        switch(mnemnonic[2]){
                            case "$0"    : return "001110000";
                            case "$1"    : return "001110010";
                            case "$-1"   : return "001110111";
                            case "%D"    : return "001000111";
                            default      : return "000000000";
                        }
                    default: return "000000000";
                }
            case "rsubw":
                switch(mnemnonic[1]){
                    case "$0":
                        switch(mnemnonic[2]){
                            case "$0"    : return "000101010";
                            case "$1"    : return "000111111";
                            case "$-1"   : return "000111010";
                            case "%D"    : return "000001100";
                            case "%A"    : return "000110000";
                            case "(%A)"  : return "001110000";
                            default      : return "000000000";
                        }
                    case "$1":
                        switch(mnemnonic[2]){
                            case "$0"    : return "000111010";
                            case "$1"    : return "000101010";
                            case "%D"    : return "000001110";
                            case "%A"    : return "000110010";
                            case "(%A)"  : return "001110010";
                            default      : return "000000000";
                        }
                    case "$-1":
                        switch(mnemnonic[2]){
                            case "$0"    : return "000111111";
                            case "$-1"   : return "000101010";
                            case "%D"    : return "000011111";
                            case "%A"    : return "000110111";
                            case "(%A)"  : return "001110111";
                            default      : return "000000000";
                        }
                    case "%D":
                        switch(mnemnonic[2]){
                            case "$0"    : return "000001111";
                            case "%A"    : return "000000111";
                            case "(%A)"  : return "001000111";
                            default      : return "000000000";
                        }
                    case "%A":
                        switch(mnemnonic[2]){
                            case "$0"    : return "000110011";
                            case "%D"    : return "000010011";
                            default      : return "000000000";
                        }
                    case "(%A)":
                        switch(mnemnonic[2]){
                            case "$0"    : return "001110011";
                            case "%D"    : return "001010011";
                            default      : return "000000000";
                        }
                    default: return "000000000";
                }
            case "jmp": return "000001100";
            case "je": return "000001100";
            case "jne": return "000001100";
            case "jg": return "000001100";
            case "jge": return "000001100";
            case "jl": return "000001100";
            case "jle": return "000001100";
            default: return "000000000";
        }
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de jump (salto).
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 3 bits) com código em linguagem de máquina para a instrução.
     */
    public static String jump(String[] mnemnonic) {
        /* TODO: implementar */
        switch (mnemnonic[0]){
            case "jmp"  : return "111";

            case "jle"  : return "110";

            case "jne"  : return "101";

            case "jl"   : return "100";

            case "jge"   : return "011";

            case "je"   : return "010";

            case "jg"   : return "001";

            default    : return "000";
        }
    }

    /**
     * Retorna o código binário de um valor decimal armazenado numa String.
     * @param  symbol valor numérico decimal armazenado em uma String.
     * @return Valor em binário (String de 15 bits) representado com 0s e 1s.
     */
    public static String toBinary(String symbol) {
        /* TODO: implementar */
        int dividendo = Integer.valueOf(symbol);
        String binario = "";
        while (dividendo > 0) {
            if (dividendo % 2 == 1) {
                binario = '1' + binario;
            } else {
                binario = '0' + binario;
            }
            dividendo = dividendo / 2;
        }
        while (16 - binario.length() > 0) {
            binario = '0' + binario;
        }
    	return binario;
    }

}
