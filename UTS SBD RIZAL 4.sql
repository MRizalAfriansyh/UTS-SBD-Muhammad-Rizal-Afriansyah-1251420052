CREATE TABLE Booking (
    hotelNo VARCHAR(10) NOT NULL,
    guestNo VARCHAR(10) NOT NULL,
    dateFrom DATE NOT NULL,
    dateTo DATE NOT NULL,
    roomNo INT NOT NULL,
    
    -- Composite Primary Key
    CONSTRAINT pk_booking PRIMARY KEY (hotelNo, guestNo, dateFrom),
    
    -- Foreign Key ke Guest
    CONSTRAINT fk_booking_guest FOREIGN KEY (guestNo) 
        REFERENCES Guest(guestNo) 
        ON DELETE CASCADE ON UPDATE CASCADE,
        
    -- Foreign Key Composite ke Room
    CONSTRAINT fk_booking_room FOREIGN KEY (roomNo, hotelNo) 
        REFERENCES Room(roomNo, hotelNo) 
        ON DELETE CASCADE ON UPDATE CASCADE,
        
    -- Constraint (d): dateFrom & dateTo harus lebih besar dari hari ini (CURRENT_DATE)
    CONSTRAINT chk_booking_dates CHECK (
        dateFrom > CURRENT_DATE AND 
        dateTo > CURRENT_DATE AND 
        dateTo >= dateFrom
    ),
    
    -- Constraint (e): Mencegah Kamar yang sama di-booking ganda (Overlap)
    CONSTRAINT no_room_double_booking EXCLUDE USING gist (
        hotelNo WITH =,
        roomNo WITH =,
        daterange(dateFrom, dateTo, '[]') WITH &&
    ),
    
    -- Constraint (f): Mencegah Tamu yang sama memiliki booking beririsan (Overlap)
    CONSTRAINT no_guest_overlapping_booking EXCLUDE USING gist (
        guestNo WITH =,
        daterange(dateFrom, dateTo, '[]') WITH &&
    )
);

