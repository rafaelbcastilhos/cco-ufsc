import java.math.BigInteger;
import java.util.Random;

public class RandomNumberAndCheckPrime {
    /*
    Implementaçao do algoritmo Blum Blum Shub para gerar numeros pseudo-aleatorio.
    Calcula o valor do n, que eh utilizado como modulo.
    Em seguida, eh realizado o cálculo do x inicial, no qual será o numero que dara origem aos demais numeros da sequência e tambehm um vetor de bytes eh inicializado com a quantidade de bytes que o numero pseudo-aleatorio deve possuir.
    Os próximos valores de x são calculados e realizado o modulo para ver se x eh par ou ímpar, determinando se o respectivo bit eh 0 ou 1.
    Os bits são agrupados em bytes, atravehs da soma dos bits que tem o valor 1, utilizando a logica binaria, para então criar um numero pseudo-aleatorio grande.
    @param
    p(int) e q(int): numeros primos grandes, com resto 3 quando divididos por 3;
    s(int): eh relativamente primo para n, ou seja, nem p nem q eh um fator de s;
    size_k e y(int): numero de bits do numero desejado .
    @return
    number(BigInteger)  numero pseudo-aleatorio grande, com numero de bits igual a size_key.
    */
    public static BigInteger blumBlumShub(int p, int q, int s, int size_key) {
        if (p % 4 != 3)
            return null ;
        if (s % p == 0 || s % q == 0)
            return null ;
        int aux ;
        int sum = 0;
        int position = 0;
        int n = p * q ;
        int x = (int) Math.pow(s , 2) % n ;
        byte data [] = new byte [size_key / 8];
        for (int i = 0; i < size_key ; i++) {
            x = (int) Math.pow(x, 2) % n ;
            aux = i % 8;
            if (aux != 7) {
                if (x % 2 == 1)
                    sum += (int) Math.pow(2 , aux);
            } else {
                data [position] = (byte) sum;
                position ++;
                if (x % 2 == 1)
                    sum = 1;
                else
                    sum = 0;
            }
        }
        return new BigInteger(data);
    }

    /*
    Implementacao do algoritmo Linear Congruential Generators para gerar numeros pseudo-aleatorios.
    Inicialmente eh calculado o numero de valores de x que precisa calcular e eh inicializado com a quantidade de bytes que o numero pseudo-aleatorio deve possuir.
    Em seguida, cada inteiro x eh calculado e dividido em bytes para entao criar um numero pseudo-aleatorio grande.
    @param
    modulus(int): tipicamente um valor primo proximo a 2^31;
    multiplies(int): fator de multiplicacao a cada interacao;
    increment(int): utilizado para incrementar o valor de x , a cada  interacao;
    seed(int): valor inicial do algoritmo;
    size_key(int): numero de bits do numero desejado.
    @return
    number(BigInteger): numero pseudo-aleatorio grande, com numero de bits igual a size_key.
    */
    public BigInteger linearCongruential(int modulus, int multiplier, int increment, int seed, int size_key) {
        if (modulus <= 0)
            return null ;
        if (!(0 < multiplier && multiplier < modulus))
            return null ;
        if (!(0 <= increment && increment < modulus))
            return null ;
        if (!(0 <= seed && seed < modulus))
            return null ;
        if (size_key % 32 != 0)
            return null ;
        int x = seed ;
        int aux = Math.floorDiv (size_key , 32) ;
        byte [] data = new byte [aux * 4];
        int position = 0;
        for (int i = 0; i < aux ; i ++) {
            x = (multiplier * x + increment) % modulus;
            data[position] = (byte) ((i& 0x000000FF) >> 24) ;
            data[position + 1] = (byte) ((i & 0x0000FF ) >> 16) ;
            data[position + 2] = (byte) ((i & 0x00FF) >> 8) ;
            data[position + 3] = (byte) (i & 0xFF);
            position = position + 4;
        }
        return new BigInteger ( data );
    }

    /*
    Implementacao do algoritmo de Miller-Rabin para verificar se um numero n eh primo.
    Calcula seus valores k, q e um numero aleatorio para verificar a primalidade de n.
    Entao, executa um loop com k interacoes e verificando a sua primalidade.
    @param
    number(BigInteger): numero que vai ser verificado se eh primo.
    @return
    (boolean): se falso o numero nao eh primo, se verdadeiro provavelmente eh primo.
    */
    public static boolean miller_rabin(BigInteger number) {
        if (number.mod(BigInteger.valueOf(2)).equals(BigInteger.valueOf(0)) || number.equals(
                BigInteger.valueOf(0)) || number.equals(BigInteger.valueOf(1)))
            return false;
        BigInteger data[] = calculate_k_q(number);
        BigInteger k = data [0];
        BigInteger q = data [1];
        Random rand = new Random();
        BigInteger a;
        do {
            a = new BigInteger (number.bitLength (), rand);
        } while (a.compareTo (BigInteger.valueOf (2)) == -1 || number . subtract (BigInteger.valueOf (1) ).compareTo(a) == -1);
        if (a.modPow(q, number).equals(BigInteger.valueOf (1)))
            return true;
        BigInteger aux ;
        BigInteger i = BigInteger.valueOf(0);
        while (i.compareTo(k) == -1) {
            aux = BigInteger.valueOf(2).modPow(i, number).multiply(q) ;
            if (a.modPow(aux, number).equals(number.subtract(BigInteger.valueOf(1))))
                return true;
            i = i.add(BigInteger.valueOf(1));
        }
        return false;
    }

    /*
    Note que n -1 eh um inteiro par. Em seguida, divida (n -1) por 2 ate que o resultado
    seja um numero impar q, para um total de k divisoes.
    @param
    number (BigInteger): numero que vai ser verificado se eh primo.
    @return
    data (BigInteger[2]): data [0] eh a quantidade de divisoes que foi realizado e data [1] eh o valor de quando o resultado das sucessivas divisoes nao eh inteiro .
    */
    public static BigInteger [] calculate_k_q(BigInteger number) {
        BigInteger k = BigInteger.valueOf(0);
        BigInteger q = number.subtract(BigInteger.valueOf(1));
        while (q.mod(BigInteger.valueOf(2)).equals(BigInteger.valueOf(0))) {
            k = k.add(BigInteger.valueOf(1));
            q = q.shiftRight(1);
        }
        BigInteger [] data = new BigInteger [2];
        data [0] = k;
        data [1] = q;
        return data;
    }

    /*
    Implementacao do teorema de Fermat.
    Se o numero for menor que 2 ou divisivel por dois, entao o numero nao eh primo.
    Segundo o teorema, se um numero n eh primo, qualquer numero entre 1 e n-1 elevado a n -1 modulo n, o resultado sera 1.
    Se existir um numero que nao atende a esta condicao , entao , com certeza , n nao e um numero primo.
    Caso contrario, n eh, com uma grande chance primo.
    @param
    number (BigInteger): numero que vai ser verificado se eh primo.
    @return
    (boolean): se falso o numero nao eh primo, se verdadeiro provavelmente eh primo.
    */
    public static boolean fermat(BigInteger number) {
        if (number.mod (BigInteger.valueOf(2)).equals(BigInteger.valueOf (0)) || number.equals(BigInteger.valueOf(0)) || number.equals(BigInteger.valueOf(1)))
            return false;
        Random rand = new Random ();
        BigInteger a , result;
        for (int i = 0; i < number.bitLength(); i++) {
            do {
                a = new BigInteger (number.bitLength(), rand);
            } while (a.compareTo(BigInteger.valueOf(2)) == -1 || number.subtract(BigInteger.valueOf(1)).compareTo(a) == -1);
            result = a.modPow(number.subtract(BigInteger.valueOf(1)), number);
            if (!result.equals(BigInteger.valueOf(1))) {
                return false;
            } else {
                continue;
            }
        }
        return true;
    }
}

