from flask import Flask, request, jsonify
from sqlalchemy import create_engine, text
from flask_cors import CORS


app = Flask(__name__)
CORS(app)
# using credentials create engine object
engine = create_engine("mysql+mysqlconnector://root:@127.0.0.1:3308/st26_pos")

connection = engine.connect()
@app.get('/')
@app.get('/getProduct')
def getProduct():
    result = connection.execute(text("SELECT * from tblProduct"))
    data = result.fetchall()
    connection.commit()
    product_list = [
    ]
    for item in data:
        product_list.append(
            {
                'id': item[0],
                'title': item[1],
                'category': item[2],
                'price': item[3],
                'description': item[4],
                'image': f"https://picsum.photos/id/2{item[0]}/300/300",
            },
        )
    return product_list

@app.get('/getProductbyID/<int:id>')
def getProductbyID(id):
    result = connection.execute(text("SELECT * FROM tblProduct WHERE id = :id"), {"id": id})
    data = result.fetchone()
    connection.commit()

    if data:
        product = {
            'id': data[0],
            'title': data[1],
            'category': data[2],
            'price': data[3],
            'description': data[4],
            'image': f"https://picsum.photos/id/2{data[0]}/300/300",
        }
        return product
    else:
        return {"error": "Product not found"}, 404

@app.post('/createProduct')
def createProducts():
    request_data = request.get_json()

    # Ensure the input is a list with at least one product
    if not isinstance(request_data, list) or len(request_data) == 0:
        return jsonify({"error": "You must provide at least one product"}), 400

    try:
        for product in request_data:
            title = product.get('title')
            category = product.get('category')
            price = product.get('price')
            description = product.get('description')
            image = product.get('image')

            # Check if all required fields are provided
            if not all([title, category, price, description, image]):
                return jsonify({"error": "All fields (title, category, price, description, image) are required for each product"}), 400

            # Insert product into the database
            connection.execute(
                text("INSERT INTO tblProduct (title, category, price, description, image) VALUES (:title, :category, :price, :description, :image)"),
                {"title": title, "category": category, "price": price, "description": description, "image": image}
            )

        # Commit transaction
        connection.commit()
        return jsonify({"message": "Products created successfully!"}), 201

    except Exception as e:
        # Rollback transaction in case of error
        connection.rollback()
        return jsonify({"error": str(e)}), 500


@app.put('/editProduct/<int:id>')
def editProduct(id):
    request_data = request.get_json()
    name = request_data.get('name')
    category = request_data.get('category')
    cost = request_data.get('cost')
    price = request_data.get('price')

    result = connection.execute(text(f"update tblProduct "
                                     f"SET name = '{name}', category = '{category}', cost='{cost}',price='{price}'"
                                     f"where id = {id}"))
    connection.commit()
    return 'Product Updated Successfully'

@app.delete('/deleteProduct')
def deleteProduct():
    try:
        pid = request.args.get('id')
        result = connection.execute(text(f"DELETE FROM tblProduct "
                                         f"WHERE id = {pid}"))
        connection.commit()
        return 'Product deleted Successfully'

    except Exception as e:
        connection.rollback()
        return jsonify({"error": str(e)}), 500

@app.route('/')
def homepage():
    return "Hello"

@app.errorhandler(404)
def error404(e):
    return "Page not found"

if __name__ == '__main__':
    app.run()
