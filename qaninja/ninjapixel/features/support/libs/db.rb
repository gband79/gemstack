
require "pg"

class DataBase
    
    def conn
        conn_hash = { host: "pgdb", dbname: "ninjapixel", user: "postgres", password: "qaninja" }
        conn = PG.connect(conn_hash)
    end
    
    def delete_product(name)
        conn.exec("DELETE FROM public.products where title = '#{name}';")
    end

    def insert_product(product)
        query = "INSERT INTO public.products (title, description, category, price, created_at, updated_at) 
        values ('Alex Kid', 'Outro Clássico muito legal', 'Master Ssystem', 29.99, current_timestamp, current_timestamp);"

        conn.exec(query)
    end
    

end