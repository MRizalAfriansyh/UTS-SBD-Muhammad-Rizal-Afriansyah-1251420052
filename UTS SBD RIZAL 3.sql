CREATE TABLE Room (
    roomNo INT NOT NULL,
    hotelNo VARCHAR(10) NOT NULL,
    type VARCHAR(10) NOT NULL,
    price DECIMAL(7, 2) NOT NULL,
    
    -- Composite Primary Key
    CONSTRAINT pk_room PRIMARY KEY (roomNo, hotelNo),
    
    -- Foreign Key ke Hotel
    CONSTRAINT fk_room_hotel FOREIGN KEY (hotelNo) 
        REFERENCES Hotel(hotelNo) 
        ON DELETE CASCADE ON UPDATE CASCADE,
        
    -- Constraint (a): type harus Single, Double, atau Family
    CONSTRAINT chk_room_type CHECK (type IN ('Single', 'Double', 'Family')),
    
    -- Constraint (b): price antara £10 dan £100
    CONSTRAINT chk_room_price CHECK (price BETWEEN 10.00 AND 100.00),
    
    -- Constraint (c): roomNo antara 1 dan 100
    CONSTRAINT chk_room_no CHECK (roomNo BETWEEN 1 AND 100)
);
