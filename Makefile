PROJECT_DIR := code/NNLA.jl

clean up:
	@bash cleanup.sh
compile_pdflatex: 
	@bash compile_pdflatex.sh
	@bash cleanup.sh

test:
	@echo "Running tests..."
	@julia --project=$(PROJECT_DIR) -e 'using Pkg; Pkg.activate("$(PROJECT_DIR)"); Pkg.precompile(); Pkg.test()'

.PHONY: cleanup compile_pdflatex test