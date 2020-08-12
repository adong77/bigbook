# Counting DNA Nucleotide: http://rosalind.info/problems/dna 
# Computing GC Content: http://rosalind.info/problems/gc

# read the DNA sequence
dna = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"

# count the nucleotide
A = dna.count("A")
C = dna.count("C")
G = dna.count("G")
T = dna.count("T")

# calculate the percent of GC count
GC_percent = float(C + G) / len(dna) * 100

# print the results
print(str(A) + " " + str(C)+ " " + str(G) + " " + str(T) )
print("GC content: " + "%0.3f" % GC_percent + "%")
