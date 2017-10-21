var mysql = require('mysql');
var inquirer = require('inquirer');
var Table = require('cli-table');

// create the connection information for the sql database

var connection = mysql.createConnection({
	host: 'localhost',
	port: 3306,
	user: 'root',
	password: 'root',
	database: 'bamazon'
})

// connect to the mysql server and sql database

connection.connect(function(err) {
	if (err) throw err;
    console.log('Connected as id' + connection.threadId);

    // run the startBuying function after the connection is made to prompt the user
	startBuying();
})

function printStuff(res) {
	var table = new Table({
		head: ['Item ID', 'Product Name', 'Department', 'Cost', 'Stock']
		, colWidths: [10, 45, 40, 8, 8]
	});
	for (var i = 0; i < res.length; i++) {
		table.push([res[i].itemID, res[i].product_name, res[i].department_name, res[i].item_cost, res[i].stock_quantity]);
	}
	console.log(table.toString());
}

// function which prompt user for purchase options

var startBuying = function() {
	connection.query('SELECT * FROM products', function(err, res) {
		printStuff(res);
		var choiceArray = [];
		for (var i = 0; i < res.length; i++) {
			choiceArray.push(res[i].product_name);
		}
		inquirer.prompt([{
			name: 'item',
			type: 'input',
			message: 'Which item would you like to purchase? (Enter the Item ID)'
		},
		{
			name: 'quantity',
			type: 'input',
            message: 'How many would you like to purchase?'
            
		}]).then(function(answer) {
			var itemID = answer.item;
			var chosenItem = res[itemID-1];

			console.log(chosenItem);
			var newQuantity = chosenItem.stock_quantity - answer.quantity;
			if (newQuantity >= 0) {
				connection.query('UPDATE products SET ? WHERE itemID = ?', [{ stock_quantity: newQuantity }, itemID]);
				startBuying();
			} else {
				console.log('Insufficient quantity!');
				startBuying();
			}
		})
	})
}