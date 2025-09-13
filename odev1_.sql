CREATE TABLE books(
book_id INT PRIMARY KEY IDENTITY ,
title NVARCHAR(255) NOT NULL,
author NVARCHAR(255) NOT NULL,
genre nvarchar(50),
price DECIMAL(10,2) CHECK(price >0),
stock INT CHECK(stock >= 0),
published_year INT CHECK(published_year BETWEEN 1900 AND 2025),
added_at DATE
);
DROP TABLE books;
INSERT INTO books(title,author,genre,price,stock,published_year,added_at)
VALUES
('Kayýp Zamanýn Ýzinde','M.Proust','roman',129.90,25,1913,'2025-08-20'),
('Simyacý','Paulo Coelho','roman',89.50,40,1988,'2025-08-20'),
('Sapiens','Harari','tarih',159.90,18,2011,'2025-08-20'),
('Ýnce Memed','Y.Kemal','roman',99.90,12,1955,'2025-08-22'),
('Körlük','J.Saramago','roman',119.00,7,1995,'2025-08-20'),
('Dune','F. Herbert','bilim	',149.00,30,1965,'2025-09-01'),
('Hayvan Çiftliði','G. Orwell','roman',79.90,55,1945,'2025-08-23'),
('1984','G. Orwell','roman',99.00,35,1949,'2025-08-24'),
('Nutuk','M. K. Atatürk','tarih',139.00,20,1927,'2025-08-27'),
('Küçük Prens','A. de Saint-Exupéry','çocuk',69.90,80,1943,'2025-08-26'),
('Baþlangýç','D. Brown','roman',109.00,22,2017,'2025-09-02'),
('Atomik Alýþkanlýklar','J. Clear','kiþisel geliþim',129.00,28,2018,'2025-09-03'),
('Zamanýn Kýsa Tarihi','S. Hawking','bilim',119.50,16,1988,'2025-08-29'),
('Þeker Portakalý','J. M. de Vasconcelos','roman',84.90,45,1968,'2025-08-30'),
('Bir Ýdam Mahkûmunun Son Günü','V. Hugo','roman',74.90,26,1900,'2025-08-31')

TRUNCATE TABLE books;




--GÖREVLER-- 


--  Görev 1 :

select title, price,author from books ORDER BY price asc;

-- Görev 2 

SELECT * FROM books WHERE genre = N'roman' ORDER BY title asc;

-- Görev 3 

select * from books where  price BETWEEN 80 AND 120 ;

-- Görev 4 

select * from books where stock <20 ;

-- Görev 5

select *  from books where title LIKE '%zaman%';

--Görev 6 

select * from books where genre IN ('roman','bilim');

--Görev 7 

select * from books where published_year >= 2000 ORDER BY published_year DESC;

--Görev 8 

select * from books where added_at >= DATEADD(DAY,-10,GETDATE());

-- Görev 9 

SELECT TOP 5 *FROM books ORDER BY price DESC;

--Görev 10 

select title,price from books where stock BETWEEN 30 AND 60 ORDER BY price ASC; 



