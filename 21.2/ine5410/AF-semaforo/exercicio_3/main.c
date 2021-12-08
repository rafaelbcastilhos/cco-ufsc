#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>
#include <time.h>
#include <stdlib.h>

FILE* out;
sem_t a, b; // semaforos para controlar a diferenca entre 'a' e 'b'

void *thread_a(void *args) {
    for (int i = 0; i < *(int*)args; ++i) {
	//      +---> arquivo (FILE*) destino
	//      |    +---> string a ser impressa
	//      v    v
        sem_wait(&a); // decrementa a
        fprintf(out, "A");
        // Importante para que vocês vejam o progresso do programa
        // mesmo que o programa trave em um sem_wait().
        fflush(stdout);
        sem_post(&b); // incrementa b
    }
    return NULL;
}

void *thread_b(void *args) {
    for (int i = 0; i < *(int*)args; ++i) {
        sem_wait(&b); // decrementa b
        fprintf(out, "B");
        fflush(stdout);
        sem_post(&a); // incrementa a
    }
    return NULL;
}

int main(int argc, char** argv) {
    if (argc < 2) {
        printf("Uso: %s iterações\n", argv[0]);
        return 1;
    }

    int iters = atoi(argv[1]);
    srand(time(NULL));
    out = fopen("result.txt", "w");

    sem_init(&a, 0, 1); // inicia semaforo a
    sem_init(&b, 0, 1); // inicia semaforo b

    pthread_t ta, tb;

    // Cria threads
    pthread_create(&ta, NULL, thread_a, &iters);
    pthread_create(&tb, NULL, thread_b, &iters);

    // Espera pelas threads
    pthread_join(ta, NULL);
    pthread_join(tb, NULL);

    //Imprime quebra de linha e fecha arquivo
    fprintf(out, "\n");
    fclose(out);

    return 0;
}
