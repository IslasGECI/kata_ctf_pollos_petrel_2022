submissions: \
    pollos_petrel/evaro_01_submission.csv \
	pollos_petrel/datletas_encobijados_submission_00.csv \
	pollos_petrel/datletas_encobijados_first_submission.csv \
	pollos_petrel/datletas_encobijados_submission_reloaded.csv

pollos_petrel/evaro_01_submission.csv: pollos_petrel/example_submission.csv
	@echo "Creating evaro_01 submission..."
	cp pollos_petrel/example_submission.csv $@

pollos_petrel/datletas_encobijados_first_submission.csv:
	@echo "Creating datletas encobijados 🛌 submission..."
	python pollos_petrel/modelo_datletas_encobijados.py

pollos_petrel/datletas_encobijados_submission_reloaded.csv:
	@echo "Creating datletas encobijados 🛌 submission reloaded..."
	python pollos_petrel/modelo_datletas_encobijados_reloaded.py

format:
	black --line-length 100 pollos_petrel

.PHONY: \
    clean \
    submissions

clean:
	rm --force pollos_petrel/evaro_01_submission.csv
	rm --force pollos_petrel/datletas_*.csv

