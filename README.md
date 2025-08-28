# Projeto ETL - Uber Dataset

Este é um projeto simples de **ETL (Extract, Transform, Load)** que desenvolvi para treinar a manipulação de dados com **Python (pandas)** e integração com banco de dados **MySQL**.

---

## 🎯 Objetivo

O objetivo foi pegar um dataset bruto de corridas da Uber, limpar os dados, transformar alguns campos e depois carregar em um banco MySQL para consultas futuras.  
Além da prática com SQLAlchemy e PyMySQL, também aproveitei para organizar o fluxo em um script de ETL básico.

---

## 📂 Estrutura do Projeto

- `data/Uber_Dataset.csv` → dataset bruto
- `etl.py` → script com o pipeline de ETL
- `uber_dataset.sql` → script de criação do banco/tabela no MySQL
- `requirements.txt` → dependências do projeto (pandas, sqlalchemy, pymysql)

---

## 🔄 Fluxo do ETL

1. **Extract**  
   - Leitura do arquivo CSV com pandas.

2. **Transform**  
   - Conversão de `Date` e `Time` em um campo único `DateTime`.  
   - Normalização dos nomes das colunas (sem espaços).  
   - Remoção de duplicados pelo `Booking_ID`.  
   - Limpeza de colunas booleanas (`Cancelled_Rides_by_Customer`, `Cancelled_Rides_by_Driver`, `Incomplete_Rides`).  
   - Ajuste dos identificadores (`Booking_ID`, `Customer_ID`) para remover aspas extras.

3. **Load**  
   - Conexão ao banco MySQL com SQLAlchemy.  
   - Inserção dos dados na tabela `uberRides`.  
   - Suporte para `if_exists="append"` (inserir novos dados sem apagar os existentes).

---

## 🚀 Como Executar

1. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/projeto-etl-uber.git
   ```

2. Instale as dependências:
   ```bash
   pip install -r requirements.txt
   ```

3. Crie o banco de dados MySQL:
   - Execute o script `uber_dataset.sql` no seu servidor MySQL para criar o schema e a tabela:
     ```bash
     mysql -u seu_usuario -p < uber_dataset.sql
     ```

4. Execute o script ETL:
   ```bash
   python etl.py
   ```

5. Acesse o MySQL e execute as consultas do arquivo `queries_ex.sql` para analisar os dados.

---

## 🛠 Tecnologias Utilizadas

- **Python**: Pandas, SQLAlchemy, PyMySQL
- **MySQL**: Banco de dados relacional
- **Git**: Controle de versão

