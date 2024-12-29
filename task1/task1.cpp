#include <iostream>
#include <chrono>
#include <cstdlib>
using namespace std;

#define ARRAY_SIZE 200000
#define ITERATION 2000000

void staticArrayFunc() {
    static int static_array[ARRAY_SIZE];
}

void stackArrayFunc() {
    int stack_array[ARRAY_SIZE];
}

void heapArrayFunc() {
    int* heap_array = (int*)malloc(ARRAY_SIZE * sizeof(int));
    free(heap_array);
}

int main() {
    // Measure exec_time for each function
    auto start = chrono::high_resolution_clock::now();
    for (int i = 0; i < ITERATION; ++i) staticArrayFunc();
    auto end = chrono::high_resolution_clock::now();
    cout << "Static Array Time: " << chrono::duration_cast<chrono::microseconds>(end - start).count() << " micro-seconds" << endl;

    start = chrono::high_resolution_clock::now();
    for (int i = 0; i < ITERATION; ++i) stackArrayFunc();
    end = chrono::high_resolution_clock::now();
    cout << "Stack Array Time: " << chrono::duration_cast<chrono::microseconds>(end - start).count() << " micro-seconds" << endl;

    start = chrono::high_resolution_clock::now();
    for (int i = 0; i < ITERATION; ++i) heapArrayFunc();
    end = chrono::high_resolution_clock::now();
    cout << "Heap Array Time: " << chrono::duration_cast<chrono::microseconds>(end - start).count() << " micro-seconds" << endl;

    return 0;
}

//// Reference for C/C++:

//// chrono-in-c
// https://www.geeksforgeeks.org/chrono-in-c/

//// from <cstdlib> library malloc
// https://cplusplus.com/reference/cstdlib/malloc/