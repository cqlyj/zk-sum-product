compile-circuit:
	@circom circuits/sum_product.circom --r1cs --wasm --sym -o outputs

setup-key:
	@wget https://storage.googleapis.com/zkevm/ptau/powersOfTau28_hez_final_10.ptau -O outputs/pot10.ptau

generate-key:
	@snarkjs groth16 setup outputs/sum_product.r1cs outputs/pot10.ptau outputs/sum_product_final.zkey && \
	snarkjs zkey export verificationkey outputs/sum_product_final.zkey outputs/verification_key.json

generate-witness:
	@node outputs/sum_product_js/generate_witness.js outputs/sum_product_js/sum_product.wasm inputs/input.json outputs/witness.wtns

generate-proof:
	@snarkjs groth16 prove outputs/sum_product_final.zkey outputs/witness.wtns outputs/proof.json outputs/public.json