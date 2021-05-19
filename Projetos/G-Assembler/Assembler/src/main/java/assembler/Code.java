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

        return "";

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
    	return "";
    }

}
