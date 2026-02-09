CREATE DATABASE logistica;
USE logistica;

CREATE TABLE produtos(
id INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE fornecedores(
id INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE estoque(
EstoqueID INT AUTO_INCREMENT PRIMARY KEY,
ProdutoID INT NOT NULL, 
Quantidade INT NOT NULL,
DataEntrada DATETIME NOT NULL,
FOREIGN KEY (ProdutoID) REFERENCES produtos(id),
FornecedorID INT,
FOREIGN KEY (FornecedorID) REFERENCES fornecedores(id)
);

SELECT p.id, e.Quantidade
FROM produtos p
LEFT JOIN estoque e ON p.id = e.ProdutoID

UNION

SELECT p.id, e.Quantidade
FROM produtos p
RIGHT JOIN estoque e ON p.id = e.ProdutoID;

SELECT ProdutoID, SUM(Quantidade) AS TotalEmEstoque
FROM estoque
GROUP BY ProdutoID;

ALTER TABLE estoque
MODIFY Quantidade INT UNSIGNED;
