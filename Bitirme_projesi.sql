



CREATE TABLE Musteri (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ad NVARCHAR(50),
    soyad NVARCHAR(50),
    email NVARCHAR(100),
    sehir NVARCHAR(50),
    kayit_tarihi DATE
);

CREATE TABLE Kategori (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ad NVARCHAR(50)
);


CREATE TABLE Satici (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ad NVARCHAR(100),
    adres NVARCHAR(100)
);


CREATE TABLE Urun (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ad NVARCHAR(100),
    fiyat DECIMAL(10,2),
    stok INT,
    kategori_id INT FOREIGN KEY REFERENCES Kategori(id),
    satici_id INT FOREIGN KEY REFERENCES Satici(id)
);


CREATE TABLE Siparis (
    id INT IDENTITY(1,1) PRIMARY KEY,
    musteri_id INT FOREIGN KEY REFERENCES Musteri(id),
    tarih DATE,
    toplam_tutar DECIMAL(10,2),
    odeme_turu NVARCHAR(50)
);


CREATE TABLE Siparis_Detay (
    id INT IDENTITY(1,1) PRIMARY KEY,
    siparis_id INT FOREIGN KEY REFERENCES Siparis(id),
    urun_id INT FOREIGN KEY REFERENCES Urun(id),
    adet INT,
    fiyat DECIMAL(10,2)
);




INSERT INTO Musteri (ad, soyad, email, sehir, kayit_tarihi) VALUES
('Ali', 'Kaya', 'ali.kaya@mail.com', '�stanbul', '2025-01-10'),
('Ay�e', 'Demir', 'ayse.demir@mail.com', 'Ankara', '2025-02-05'),
('Mehmet', 'Y�lmaz', 'mehmet.yilmaz@mail.com', '�zmir', '2025-03-12'),
('Elif', 'Arslan', 'elif.arslan@mail.com', 'Bursa', '2025-04-01'),
('Can', 'Polat', 'can.polat@mail.com', 'Antalya', '2025-05-20'),
('Zeynep', 'Kurt', 'zeynep.kurt@mail.com', 'Eski�ehir', '2025-06-02'),
('Murat', '�zt�rk', 'murat.ozturk@mail.com', 'Konya', '2025-06-18'),
('Selin', 'Aksoy', 'selin.aksoy@mail.com', '�zmir', '2025-07-05'),
('Emre', 'Ta�', 'emre.tas@mail.com', '�stanbul', '2025-07-18'),
('Derya', '�elik', 'derya.celik@mail.com', 'Adana', '2025-08-01');



INSERT INTO Kategori (ad) VALUES
('Elektronik'),('Giyim'),('Ev & Ya�am'),('Spor'),('Kozmetik'),
('Kitap'),('Ofis Malzemeleri'),('Oyuncak'),('Bah�e'),('Petshop');



INSERT INTO Satici (ad, adres) VALUES
('Tekno Market','�stanbul'),('Moda D�nyas�','Ankara'),('EvTrend','�zmir'),
('FitLife','Bursa'),('G�zellik Merkezi','Antalya'),('KitapEv','Eski�ehir'),
('OfisPro','Konya'),('OyunPark','�stanbul'),('Bah�eBurada','Trabzon'),
('PetStore','Adana');



INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES
('Laptop', 25000, 50, 1, 1),
('Ti��rt', 250, 100, 2, 2),
('Kanepe', 8500, 40, 3, 3),
('Ko�u Band�', 12000, 25, 4, 4),
('Parf�m', 950, 70, 5, 5),
('Roman Kitab�', 150, 120, 6, 6),
('Ofis Sandalyesi', 1800, 50, 7, 7),
('Oyuncak Araba', 450, 90, 8, 8),
('Bah�e Makas�', 600, 60, 9, 9),
('Kedi Mamas�', 350, 100, 10, 10);




INSERT INTO Siparis (musteri_id, tarih, toplam_tutar, odeme_turu) VALUES
(1, '2025-07-20', 50000, 'Kredi Kart�'),
(2, '2025-07-22', 36000, 'Nakit'),
(3, '2025-07-25', 1800, 'Kredi Kart�'),
(4, '2025-08-01', 1250, 'Banka Kart�'),
(5, '2025-08-05', 2850, 'Kredi Kart�'),
(6, '2025-08-07', 3600, 'Nakit'),
(7, '2025-08-09', 17000, 'Kredi Kart�'),
(8, '2025-08-11', 1800, 'Banka Kart�'),
(9, '2025-08-13', 1400, 'Nakit'),
(10,'2025-08-15', 750, 'Kredi Kart�');




INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES
(1, 1, 2, 50000),
(2, 4, 3, 36000),
(3, 8, 4, 1800),
(4, 2, 5, 1250),
(5, 5, 3, 2850),
(6, 7, 2, 3600),
(7, 3, 2, 17000),
(8, 9, 3, 1800),
(9, 10, 4, 1400),
(10,6, 5, 750);



UPDATE Urun
SET stok = stok - CASE id
    WHEN 1 THEN 2
    WHEN 2 THEN 5
    WHEN 3 THEN 2
    WHEN 4 THEN 3
    WHEN 5 THEN 3
    WHEN 6 THEN 5
    WHEN 7 THEN 2
    WHEN 8 THEN 4
    WHEN 9 THEN 3
    WHEN 10 THEN 4
END
WHERE id IN (1,2,3,4,5,6,7,8,9,10);




DELETE FROM Musteri WHERE id = 10;


TRUNCATE TABLE Siparis_Detay;
TRUNCATE TABLE Siparis;
TRUNCATE TABLE Urun;
TRUNCATE TABLE Satici;
TRUNCATE TABLE Kategori;
TRUNCATE TABLE Musteri;


SELECT 
    s.id AS SiparisID,
    m.ad + ' ' + m.soyad AS [M��teri],
    u.ad AS [�r�n],
    sa.ad AS [Sat�c�],
    sa.adres AS [Sat�c� Adresi],   
    sd.adet AS [Adet],
    sd.fiyat AS [Toplam Fiyat],
    s.odeme_turu AS [�deme T�r�],
    s.tarih AS [Tarih]
FROM Siparis s
JOIN Musteri m ON s.musteri_id = m.id
JOIN Siparis_Detay sd ON s.id = sd.siparis_id
JOIN Urun u ON sd.urun_id = u.id
JOIN Satici sa ON u.satici_id = sa.id;


SELECT TOP 5
    m.id AS [M��teriID], 
    m.ad + ' ' + m.soyad AS [M��teri Ad�],
    SUM(sd.adet) AS [Toplam Adet]
FROM Musteri m
JOIN Siparis s ON m.id = s.musteri_id
JOIN Siparis_Detay sd ON s.id = sd.siparis_id
GROUP BY m.id, m.ad, m.soyad
ORDER BY SUM(sd.adet) DESC;


SELECT TOP 1 
u.id AS [�r�nID],
u.ad AS [�r�n],
SUM(sd.adet) AS [Toplam Satilan Adet],
SUM(sd.fiyat) AS [Toplam Gelir]
FROM Urun u
JOIN Siparis_Detay sd ON u.id = sd.urun_id
GROUP BY u.id, u.ad
ORDER BY SUM(sd.adet) DESC;


SELECT
    sa.id AS SaticiID,
    sa.ad AS Satici_Adi,
    SUM(sd.fiyat) AS [Toplam Ciro],
    SUM(sd.adet) AS [Toplam Adet]
FROM Satici sa
JOIN Urun u ON sa.id = u.satici_id
JOIN Siparis_Detay sd ON u.id = sd.urun_id
GROUP BY sa.id, sa.ad
ORDER BY SUM(sd.fiyat) DESC;


SELECT 
    sehir,
    COUNT(*) AS [M��teri Say�s�]
FROM Musteri
GROUP BY sehir
ORDER BY [M��teri Say�s�];



SELECT 
    k.id AS KategoriID,
    k.ad AS Kategori_Ad�,
        SUM(sd.adet) AS [Toplam Adet],
    SUM(sd.fiyat) AS [Toplam Gelir]
FROM Kategori k
JOIN Urun u ON k.id = u.kategori_id
JOIN Siparis_Detay sd ON u.id = sd.urun_id
GROUP BY k.id, k.ad
ORDER BY SUM(sd.fiyat);




SELECT 
    s.id AS SiparisID,
    m.ad + ' ' + m.soyad AS [M��teri Ad�],
    m.email AS [M��teri Email],
    m.sehir AS [M��teri �ehir],
    u.ad AS [�r�n Ad�],
    u.fiyat AS [�r�n Fiyat�],
    sa.ad AS [Sat�c� Ad�],
    sa.adres AS [Sat�c� Adresi],
    sd.adet AS [Sipari� Adedi],
    sd.fiyat AS [Toplam Fiyat],
    s.odeme_turu AS [�deme T�r�],
    s.tarih AS [Sipari� Tarihi]
FROM Siparis s
JOIN Musteri m ON s.musteri_id = m.id
JOIN Siparis_Detay sd ON s.id = sd.siparis_id
JOIN Urun u ON sd.urun_id = u.id
JOIN Satici sa ON u.satici_id = sa.id
ORDER BY s.tarih ASC;  



SELECT TOP 3 
k.id AS [KategoriID],
k.ad AS [Kategori Ad�],
    SUM(sd.fiyat) AS [Toplam Ciro],
    SUM(sd.adet) AS [Toplam Adet]
FROM Kategori k
JOIN Urun u ON k.id = u.kategori_id
JOIN Siparis_Detay sd ON u.id = sd.urun_id
GROUP BY k.id, k.ad
ORDER BY SUM(sd.fiyat) DESC;