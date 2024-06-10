```markdown
# ERC Token Manager

## Overview
This project is an ASP.NET Web Forms application for managing ERC tokens. It allows users to add, edit, and view ERC tokens. It also includes a pie chart visualization of the total supply of tokens.

## Prerequisites
- Visual Studio 2022 or higher
- MySQL

## Instructions

### 1. Open the Project in Visual Studio 2022 or Higher
1. Clone the repository to your local machine.
2. Open Visual Studio 2022.
3. Select **File > Open > Project/Solution**.
4. Navigate to the folder where you cloned the repository and select the solution file (.sln).

### 2. Create a Database in MySQL
1. Open MySQL Workbench or your preferred MySQL client.
2. Connect to your MySQL server with root access.
3. Execute the following SQL command to create a database called `ethscan` and grant all root privilege:
    ```sql
    CREATE DATABASE ethscan;
    ```

### 3. Seed the Database
1. Ensure you are connected to the `ethscan` database.
2. Execute the following SQL commands to create the `token` table and insert sample data:

    ```sql
    CREATE TABLE `tokens` (
        `id` INT(11) NOT NULL AUTO_INCREMENT,
        `symbol` VARCHAR(5) NOT NULL COLLATE 'utf8_general_ci',
        `name` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
        `total_supply` BIGINT(20) NOT NULL,
        `contract_address` VARCHAR(66) NOT NULL COLLATE 'utf8_general_ci',
        `total_holders` INT(11) NOT NULL,
        `price` DECIMAL(65,2) NULL DEFAULT '0.00',
        PRIMARY KEY (`id`) USING BTREE
    )
    COLLATE='utf8_general_ci'
    ENGINE=InnoDB
    ROW_FORMAT=DYNAMIC
    AUTO_INCREMENT=8;
    ```

    ```sql
    INSERT INTO `tokens` (`symbol`, `name`, `total_supply`, `contract_address`, `total_holders`, `price`) 
    VALUES 
    ('VEN', 'Vechain', 35987133, '0xd850942ef8811f2a866692a623011bde52a462c1', 65, 0.00),
    ('ZIR', 'Zilliqa', 53272942, '0x05f4a42e251f2d52b8ed15e9fedaacfcef1fad27', 54, 0.00),
    ('MKR', 'Maker', 45987133, '0x9f8f72aa9304c8b593d555f12ef6589cc3a579a2', 567, 0.00),
    ('BNB', 'Binance', 16579517, '0xB8c77482e45F1F44dE1745F52C74426C631bDD52', 4234234, 0.00);
    ```

### 4. Run/Debug the Solution in Visual Studio 2022
1. In Visual Studio, set the startup project to the web application project (if it's not already set).
2. Configure the `web.config` file to connect to the `ethscan` database with the correct connection string.
3. Press `F5` to run/debug the application.
4. The application should launch in your default web browser, and you can begin managing ERC tokens.

## Additional Information
- The pie chart visualizes the total supply of tokens and updates dynamically when tokens are added, edited, or deleted.
- You can click on the symbol in the token list to view detailed information about each token on a separate details page.
```