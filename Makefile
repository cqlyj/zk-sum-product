compile-circuit:
	@circom circuits/sum_product.circom --r1cs --wasm --sym -o outputs