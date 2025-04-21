compile-circuit:
	@circom circuits/sum_product.circom --r1cs --wasm --sym -o outputs

setup-key:
	@wget https://storage.googleapis.com/zkevm/ptau/powersOfTau28_hez_final_10.ptau -O outputs/pot10.ptau