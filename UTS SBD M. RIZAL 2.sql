CREATE TABLE Guest (
    guestNo VARCHAR(10) NOT NULL,
    guestName VARCHAR(100) NOT NULL,
    guestAddress VARCHAR(255) NOT NULL,
    CONSTRAINT pk_guest PRIMARY KEY (guestNo)
);