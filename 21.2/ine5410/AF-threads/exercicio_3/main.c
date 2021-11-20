#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <stdio.h>
#include <pthread.h>

// Lê o conteúdo do arquivo filename e retorna um vetor E o tamanho dele
// Se filename for da forma "gen:%d", gera um vetor aleatório com %d elementos
//
// +-------> retorno da função, ponteiro para vetor malloc()ado e preenchido
// | 
// |         tamanho do vetor (usado <-----+
// |         como 2o retorno)              |
// v                                       v
double* load_vector(const char* filename, int* out_size);


// Avalia se o prod_escalar é o produto escalar dos vetores a e b. Assume-se
// que ambos a e b sejam vetores de tamanho size.
void avaliar(double* a, double* b, int size, double prod_escalar);

double result = 0;

typedef struct {
    double* a;
    double* b;

    // pedaço inicial
    int begin;
    // pedaço final
    int end;
} info;

void* product(void* args){
    info vector = *((info*)args);
    for (int i = vector.begin; i < vector.end; i++) 
        result += vector.a[i] * vector.b[i];
    
    pthread_exit(NULL);
}

int main(int argc, char* argv[]) {
    srand(time(NULL));

    //Temos argumentos suficientes?
    if(argc < 4) {
        printf("Uso: %s n_threads a_file b_file\n"
               "    n_threads    número de threads a serem usadas na computação\n"
               "    *_file       caminho de arquivo ou uma expressão com a forma gen:N,\n"
               "                 representando um vetor aleatório de tamanho N\n", 
               argv[0]);
        return 1;
    }
  
    //Quantas threads?
    int n_threads = atoi(argv[1]);
    if (!n_threads) {
        printf("Número de threads deve ser > 0\n");
        return 1;
    }
    //Lê números de arquivos para vetores alocados com malloc
    int a_size = 0, b_size = 0;
    double* a = load_vector(argv[2], &a_size);
    if (!a) {
        //load_vector não conseguiu abrir o arquivo
        printf("Erro ao ler arquivo %s\n", argv[2]);
        return 1;
    }
    double* b = load_vector(argv[3], &b_size);
    if (!b) {
        printf("Erro ao ler arquivo %s\n", argv[3]);
        return 1;
    }
    
    //Garante que entradas são compatíveis
    if (a_size != b_size) {
        printf("Vetores a e b tem tamanhos diferentes! (%d != %d)\n", a_size, b_size);
        return 1;
    }

    if (n_threads > a_size)
        n_threads = a_size;

    pthread_t threads[n_threads];
    info vectors[n_threads];
    int vectors_div = a_size / n_threads;

    // define o pedaço de cada thread
    for (int i = 0; i < n_threads; i++) {
        vectors[i].a = a;
        vectors[i].b = b;
        vectors[i].begin = i * vectors_div;
        if ((i == n_threads - 1) && (a_size % n_threads != 0))
            vectors[i].end = i * vectors_div + vectors_div + (a_size % n_threads);
        else
            vectors[i].end = i * vectors_div + vectors_div;
    }

    // cria threads
    for (int i = 0; i < n_threads; i++)
        pthread_create(&threads[i], NULL, product, &vectors[i]);

    // espera terminar todas as threads
    for (int i = 0; i < n_threads; i++)
        pthread_join(threads[i], NULL);

    //Calcula produto escalar. Paralelize essa parte
    // double result = 0;
    // for (int i = 0; i < a_size; ++i) 
    //     result += a[i] * b[i];
    
    //    +---------------------------------+
    // ** | IMPORTANTE: avalia o resultado! | **
    //    +---------------------------------+
    avaliar(a, b, a_size, result);

    //Libera memória
    free(a);
    free(b);

    return 0;
}
