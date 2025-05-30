pragma circom  2.2.2;

template SumProduct() {

    // Declaration of signals.
    signal input a;
    signal input b;

    signal output sum;
    signal output product;

    // Constraints.
    sum <== a + b;
    product <== a * b;
}


component main = SumProduct();