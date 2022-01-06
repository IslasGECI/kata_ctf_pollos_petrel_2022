submissions: \
    pollos_petrel/evaro_01_submission.csv \
	pollos_petrel/datacheros_del_noroeste_submission.csv

pollos_petrel/evaro_01_submission.csv: pollos_petrel/example_submission.csv
	@echo "Creating evaro_01 submission..."
	cp pollos_petrel/example_submission.csv $@

pollos_petrel/datacheros_del_noroeste_submission.csv:
	@echo "Creating datacheros submission..."

.PHONY: \
    clean \
    submissions \
	tests

check:
	R -e "library(styler)" \
	  -e "resumen <- style_dir('R')" \
	  -e "resumen <- rbind(resumen, style_dir('tests'))" \
	  -e "any(resumen[[2]])" \
	  | grep FALSE

clean:
	rm --force pollos_petrel/evaro_01_submission.csv

tests:
	R -e "devtools::test()"
