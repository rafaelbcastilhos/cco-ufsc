#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <stdio.h>
#include <pthread.h>
#include <time.h>
#include <semaphore.h>

int produzir(int value); //< definida em helper.c
void consumir(int produto); //< definida em helper.c
void *produtor_func(void *arg);
void *consumidor_func(void *arg);

int indice_produtor, indice_consumidor, tamanho_buffer;
int* buffer;

// semaforos para controlar a quantidade de espacos livres 
// e a quantidade de produtos armazenados no buffer
sem_t spaces, products;
sem_t access_buffer; // semaforo de controle de acesso ao buffer
int finished; // flag para indicar se threads produtoras finalizaram 

//Você deve fazer as alterações necessárias nesta função e na função
//consumidor_func para que usem semáforos para coordenar a produção
//e consumo de elementos do buffer.
void *produtor_func(void *arg) {
    //arg contem o número de itens a serem produzidos
    int max = *((int*)arg);
    for (int i = 0; i < max; i++) {
        sem_wait(&spaces); // decrementa em espacos
        sem_wait(&access_buffer); // decrementa em acesso

        int produto;
        produto = produzir(i); //produz um elemento normal
        indice_produtor = (indice_produtor + 1) % tamanho_buffer; //calcula posição próximo elemento
        buffer[indice_produtor] = produto; //adiciona o elemento produzido à lista

        sem_post(&access_buffer); // incrementa em acesso
        sem_post(&products); // incrementa em produtos
    }
    return NULL;
}

void *consumidor_func(void *arg) {
    while (1) {
        if (sem_trywait(&products) == 0) {
            sem_wait(&access_buffer); // decrementa em acesso
            indice_consumidor = (indice_consumidor + 1) % tamanho_buffer; //Calcula o próximo item a consumir
            int produto = buffer[indice_consumidor]; //obtém o item da lista

            consumir(produto); //Consome o item obtido.

            sem_post(&access_buffer); // incrementa em acesso
            sem_post(&spaces); // incrementa em espacos
        }
        else if(finished == 1)
            break; 
    }
    return NULL;
}

int main(int argc, char *argv[]) {
    if (argc < 5) {
        printf("Uso: %s tamanho_buffer itens_produzidos n_produtores n_consumidores \n", argv[0]);
        return 0;
    }

    tamanho_buffer = atoi(argv[1]);
    int itens = atoi(argv[2]);
    int n_produtores = atoi(argv[3]);
    int n_consumidores = atoi(argv[4]);
    printf("itens=%d, n_produtores=%d, n_consumidores=%d\n",
        itens, n_produtores, n_consumidores);

    //Iniciando buffer
    indice_produtor = 0;
    indice_consumidor = 0;
    buffer = malloc(sizeof(int) * tamanho_buffer);

    // Crie threads e o que mais for necessário para que n_produtores
    // threads criem cada uma n_itens produtos e o n_consumidores os
    // consumam.
    sem_init(&spaces, 0, tamanho_buffer); // inicia semaforo de espacos
    sem_init(&products, 0, 0); // inicia semaforo de produtos
    sem_init(&access_buffer, 0, 1); // inicia semaforo de controle de acesso ao buffer

    finished = 0; // flag para threads produtoras não foram finalizadas

    pthread_t threads_producers[n_produtores]; // lista de threads produtoras
    pthread_t threads_consumers[n_consumidores]; // lista de threads consumidoras
    
    for (int i = 0; i < n_produtores; i++)
        pthread_create(&threads_producers[i], NULL, produtor_func, &itens);

    for (int i = 0; i < n_consumidores; i++)
        pthread_create(&threads_consumers[i], NULL, consumidor_func, NULL);

    for (int i = 0; i < n_produtores; i++)
        pthread_join(threads_producers[i], NULL);

    finished = 1; // flag para threads produtoras foram finalizadas

    for (int i = 0; i < n_consumidores; i++)
        pthread_join(threads_consumers[i], NULL);

    sem_destroy(&spaces); // destroi semaforo de espacos
    sem_destroy(&products); // destroi semaforo de produtos
    sem_destroy(&access_buffer); // destroi semaforo de acesso

    //Libera memória do buffer
    free(buffer);

    return 0;
}
