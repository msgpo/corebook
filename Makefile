NAME = corebook.txt
PDF = corebook.pdf

all: $(PDF)

$(PDF): $(NAME)
	a2x -f pdf --fop $(NAME)
	mv $(PDF) $(PDF).1
	gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite \
	-dCompatibilityLevel=1.3 \
	-dPDFSETTINGS=/prepress \
	-sOutputFile=$(PDF) $(PDF).1
	rm $(PDF).1

$(NAME): heading $(wildcard part*/ch*/*) ending
	cat heading part*/ch*/text ending > $(NAME)

clean:
	rm -f $(NAME) $(PDF) *.xml *.fo
