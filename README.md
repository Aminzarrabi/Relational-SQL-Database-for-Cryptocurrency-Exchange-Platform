# 💰 Cryptocurrency Exchange Database (SQL)

This project implements a **relational SQL database** for a cryptocurrency exchange.  
It includes **7 normalized tables** to manage clients, wallets, transactions, and crypto trading operations, supporting realistic trading workflows.

---

## 🗄️ Database Structure

### Tables
1. **Tb_client** – Stores client information:
   - `client_id`, `fname`, `lname`, `card_number`, `phone_number`, `national_number`, `national_code`
2. **Tb_crypto** – Stores cryptocurrencies:
   - `crypto_id`, `crypto_name`, `crypto_sign`, `crypto_net`, `crypto_buy_price`, `crypto_sell_price`
3. **Tb_variz_bardasht** – Deposit & Withdraw transactions:
   - `transaction_id`, `amount`, `transaction_type`, `resid_number`, `tarikh`
4. **Tb_kifpol** – Client wallets:
   - `kifpol_id`, `client_id`, `transaction_id`, `mojodi_toman`, `mojodi_crypto`
5. **Tb_buy_crypto** – Records buying crypto transactions:
   - `buy_id`, `kifpol_id`, `crypto_id`, `tether_buy_price`, `buy_time`
6. **Tb_sell_crypto** – Records selling crypto transactions:
   - `sell_id`, `kifpol_id`, `crypto_id`, `tether_sell_price`, `sell_time`
7. **Tb_transfer_crypto** – Crypto transfers between wallets:
   - `transfer_id`, `kifpol_id`, `transfer_type`, `crypto_id`, `maximum_amount`, `destination_wallet`, `source_wallet`, `comment_memo`

### Relationships
- **Foreign keys** link wallets to clients and transactions.
- Cryptos are linked to buy, sell, and transfer tables.
- Supports **JOIN operations** for reporting and querying.

---

## 🛠️ Technologies Used
- MySQL / MariaDB / PostgreSQL (any SQL RDBMS)
- SQL DDL & DML (CREATE, INSERT, SELECT)
- Foreign key constraints for relational integrity

---

## 📦 Sample Queries
- View all clients:
```sql
SELECT * FROM Tb_client;
