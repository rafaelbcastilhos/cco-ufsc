#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <stdio.h>
#include <pthread.h>
#include <time.h>
#include <semaphore.h>
#define THREADS_SIZE 2 // quantidade de threads necessárias

int produzir(int value);    //< definida em helper.c
void consumir(int produto); //< definida em helper.c
void *produtor_func(void *arg);
void *consumidor_func(void *arg);

int indice_produtor, indice_consumidor, tamanho_buffer;
int* buffer;

// semaforos para controlar a quantidade de espacos livres 
// e a quantidade de produtos armazenados no buffer
sem_t spaces, products;

//Você deve fazer as alterações necessárias nesta função e na função
//consumidor_func para que usem semáforos para coordenar a produção
//e consumo de elementos do buffer.
void *produtor_func(void *arg) {
    //arg contem o número de itens a serem produzidos
    int max = *((int*)arg);
    for (int i = 0; i <= max; ++i) {
        int produto;
        sem_wait(&spaces); // decrementa em espacos

        if (i == max)
            produto = -1;          //envia produto sinlizando FIM
        else 
            produto = produzir(i); //produz um elemento normal
        indice_produtor = (indice_produtor + 1) % tamanho_buffer; //calcula posição próximo elemento
        buffer[indice_produtor] = produto; //adiciona o elemento produzido à lista

        sem_post(&products); // incrementa em produtos
    }
    return NULL;
}

void *consumidor_func(void *arg) {
    while (1) {
        sem_wait(&products);  // decrementa em produtos
        indice_consumidor = (indice_consumidor + 1) % tamanho_buffer; //Calcula o próximo item a consumir
        int produto = buffer[indice_consumidor]; //obtém o item da lista
        //Podemos receber um produto normal ou um produto especial
        if (produto >= 0){
            consumir(produto); //Consome o item obtido.
            sem_post(&spaces); // incrementa em espacos
        }
        else{
            sem_post(&spaces); // incrementa em espacos
            break; //produto < 0 é um sinal de que o consumidor deve parar
        }
    }
    return NULL;
}

int main(int argc, char *argv[]) {
    if (argc < 3) {
        printf("Uso: %s tamanho_buffer itens_produzidos\n", argv[0]);
        return 0;
    }

    tamanho_buffer = atoi(argv[1]);
    int n_itens = atoi(argv[2]);
    printf("n_itens: %d\n", n_itens);

    //Iniciando buffer
    indice_produtor = 0;
    indice_consumidor = 0;
    buffer = malloc(sizeof(int) * tamanho_buffer);

    // Crie threads e o que mais for necessário para que uma produtor crie 
    // n_itens produtos e o consumidor os consuma
    sem_init(&spaces, 0, tamanho_buffer); // inicia semaforo de espacos
    sem_init(&products, 0, 0); // inicia semaforo de produtos

    pthread_t threads[THREADS_SIZE]; // lista de threads, 0 produtor; 1 consumidor
    pthread_create(&threads[0], NULL, produtor_func, &n_itens); // cria thread produtora
    pthread_create(&threads[1], NULL, consumidor_func, NULL); // cria thread consumidora

    for(int i = 0; i < THREADS_SIZE; i++)
        pthread_join(threads[i], NULL);

    sem_destroy(&spaces); // destroi semaforo de espacos
    sem_destroy(&products); // destroi semaforo de produtos

    //Libera memória do buffer
    free(buffer);
    return 0;
}

