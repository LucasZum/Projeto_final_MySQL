CREATE DATABASE YOUTUBE;
USE YOUTUBE;

CREATE TABLE Usuario (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Senha VARCHAR(100) NOT NULL,
    Data_Cadastro DATE NOT NULL
);

CREATE TABLE Canal (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT,
    Data_Criacao DATE NOT NULL,
    Usuario_ID INT NOT NULL,
    FOREIGN KEY (Usuario_ID) REFERENCES Usuario(ID)
);

CREATE TABLE Video (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(100) NOT NULL,
    Descricao TEXT,
    Data_Upload DATE NOT NULL,
    Visualizacoes INT DEFAULT 0,
    Duracao TIME,
    Canal_ID INT NOT NULL,
    FOREIGN KEY (Canal_ID) REFERENCES Canal(ID)
);

CREATE TABLE Comentario (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Texto TEXT NOT NULL,
    Data_Postagem DATE NOT NULL,
    Usuario_ID INT NOT NULL,
    Video_ID INT NOT NULL,
    FOREIGN KEY (Usuario_ID) REFERENCES Usuario(ID),
    FOREIGN KEY (Video_ID) REFERENCES Video(ID)
);

CREATE TABLE Assinante (
    ID_Usuario INT,
    ID_Canal INT,
    Data_Inscricao DATE,
    PRIMARY KEY (ID_Usuario, ID_Canal),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID),
    FOREIGN KEY (ID_Canal) REFERENCES Canal(ID)
);

INSERT INTO Usuario (Nome, Email, Senha, Data_Cadastro)
VALUES
	('João Silva', 'joao.silva@example.com', '123456', '2023-07-01'),
	('Maria Santos', 'maria.santos@example.com', 'abcdef', '2023-07-02'),
	('Pedro Oliveira', 'pedro.oliveira@example.com', 'qwerty', '2023-07-03'),
	('Ana Rodrigues', 'ana.rodrigues@example.com', 'abc123', '2023-07-04'),
	('Lucas Souza', 'lucas.souza@example.com', 'password', '2023-07-05'),
	('Carla Lima', 'carla.lima@example.com', 'senha123', '2023-07-06'),
	('Gustavo Alves', 'gustavo.alves@example.com', '123abc', '2023-07-07'),
	('Fernanda Pereira', 'fernanda.pereira@example.com', 'qweasd', '2023-07-08'),
	('Ricardo Santos', 'ricardo.santos@example.com', 'ilovecoding', '2023-07-09'),
	('Isabela Martins', 'isabela.martins@example.com', 'martinisabela', '2023-07-10');
    
INSERT INTO Canal (Nome, Descricao, Data_Criacao, Usuario_ID)
VALUES
	('Canal do João', 'Vídeos variados sobre tecnologia e games.', '2023-07-05', 1),
	('Canal da Maria', 'Receitas e dicas culinárias.', '2023-07-06', 2),
	('Canal do Pedro', 'Aprendendo programação e desenvolvimento web.', '2023-07-07', 3),
	('Canal da Ana', 'Viagens e aventuras pelo mundo.', '2023-07-08', 4),
	('Canal do Lucas', 'Vídeos de entretenimento e comédia.', '2023-07-09', 5),
	('Canal da Carla', 'Moda e estilo de vida.', '2023-07-10', 6),
	('Canal do Gustavo', 'Exercícios físicos e saúde.', '2023-07-11', 7),
	('Canal da Fernanda', 'Artes e desenhos.', '2023-07-12', 8),
	('Canal do Ricardo', 'Desafios e jogos divertidos.', '2023-07-13', 9),
	('Canal da Isabela', 'Livros e leituras recomendadas.', '2023-07-14', 10);

INSERT INTO Video (Titulo, Descricao, Data_Upload, Visualizacoes, Duracao, Canal_ID)
VALUES
	('Review do Smartphone X', 'Confira a análise completa do Smartphone X.', '2023-07-01', 1500, '00:12:30', 1),
	('Bolo de Chocolate', 'Aprenda a fazer um delicioso bolo de chocolate.', '2023-07-02', 2800, '00:08:45', 2),
	('Introdução ao HTML', 'Primeiros passos na linguagem HTML.', '2023-07-03', 2200, '00:15:20', 3),
	('Viagem à Tailândia', 'Conheça as belezas naturais da Tailândia.', '2023-07-04', 3400, '00:20:15', 4),
	('Top 10 Piadas Engraçadas', 'As piadas mais engraçadas de todos os tempos.', '2023-07-05', 5000, '00:05:50', 5),
	('Tendências de Moda 2023', 'As principais tendências de moda para o ano.', '2023-07-06', 1800, '00:10:30', 6),
	('Treino de Musculação', 'Dicas e exercícios para treino de musculação.', '2023-07-07', 3100, '00:18:40', 7),
	('Speed Drawing - Retrato', 'Desenho em velocidade de um retrato realista.', '2023-07-08', 4200, '00:07:55', 8),
	('Desafio da Garrafa', 'Tentando acertar a garrafa nos lugares mais difíceis.', '2023-07-09', 6300, '00:04:25', 9),
	('Resenha de Livro X', 'Uma análise completa sobre o livro X.', '2023-07-10', 2900, '00:13:10', 10);

INSERT INTO Comentario (Texto, Data_Postagem, Usuario_ID, Video_ID)
VALUES
	('Ótimo vídeo, muito informativo!', '2023-07-01', 2, 1),
	('Parabéns pelo canal, Maria!', '2023-07-02', 1, 2),
	('Excelente explicação, obrigado!', '2023-07-03', 3, 3),
	('Que lugar incrível, fiquei com vontade de viajar!', '2023-07-04', 5, 4),
	('Ri muito com as piadas, continue assim!', '2023-07-05', 4, 5),
	('Amei as dicas de moda, Carla!', '2023-07-06', 6, 6),
	('Treino anotado, vou tentar fazer!', '2023-07-07', 8, 7),
	('Impressionante o seu talento, parabéns!', '2023-07-08', 7, 8),
	('Desafio aceito! Vou tentar também.', '2023-07-09', 10, 9),
	('Excelente análise, me ajudou muito!', '2023-07-10', 9, 10);
    
INSERT INTO Assinante (ID_Usuario, ID_Canal, Data_Inscricao)
VALUES
    (1, 2, '2023-07-15'),
    (3, 4, '2023-07-16'),
    (5, 6, '2023-07-17'),
    (7, 8, '2023-07-18');
    
    
UPDATE Usuario
SET Nome = 'Luciana Lima'
WHERE ID = 6;

DELETE FROM Video
WHERE ID = 2;

SELECT * FROM Video
WHERE Visualizacoes > 2000;

SELECT U.Nome AS Nome_Usuario, C.Nome AS Nome_Canal
FROM Usuario U
JOIN Assinante A ON U.ID = A.ID_Usuario
JOIN Canal C ON A.ID_Canal = C.ID;

SELECT SUM(Visualizacoes) AS Total_Visualizacoes
FROM Video;

SELECT AVG(Visualizacoes) AS Media_Visualizacoes
FROM Video;

SELECT Canal_ID, COUNT(*) AS Quantidade_Videos
FROM Video
GROUP BY Canal_ID;

SELECT Titulo, Visualizacoes
FROM Video
ORDER BY Visualizacoes DESC;

SELECT AVG(Visualizacoes) AS Media_Visualizacoes
FROM Video
WHERE Visualizacoes > 1000;

SELECT C.Nome AS Nome_Canal, COUNT(A.ID_Usuario) AS Quantidade_Inscritos
FROM Canal C
LEFT JOIN Assinante A ON C.ID = A.ID_Canal
GROUP BY C.Nome;














