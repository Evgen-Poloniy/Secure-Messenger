CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,                
    username VARCHAR(100) NOT NULL UNIQUE,      
    name VARCHAR(100),              
    surname VARCHAR(100),              
    password_hash VARCHAR(255) NOT NULL,             
    coins FLOAT8 NOT NULL DEFAULT 0.0           
);

-- CREATE TABLE Chats (
--     chat_id SERIAL PRIMARY KEY,               
--     users_id BIGINT[] NOT NULL                 
-- );

-- CREATE TABLE Messages (
--     message_id SERIAL PRIMARY KEY,            
--     text TEXT NOT NULL,                         
--     sending_time TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
--     message_status INT NOT NULL,               
--     chat_id INT NOT NULL,                     
--     FOREIGN KEY (chat_id) REFERENCES Chats(chat_id) 
-- );

CREATE TABLE Transactions (
    transaction_id SERIAL PRIMARY KEY,                  
    sender_id INT NOT NULL,                 
    recipient_id INT NOT NULL, 
    amount FLOAT8 NOT NULL, 
    transaction_time TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,             
    FOREIGN KEY (sender_id) REFERENCES Users(user_id),      
    FOREIGN KEY (recipient_id) REFERENCES Users(user_id) 
);