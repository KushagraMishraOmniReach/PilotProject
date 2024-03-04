<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products Information</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.1/css/dataTables.dataTables.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/2.0.1/js/dataTables.js"></script>
</head>
<style>
    html,
    body {
        height: 100%;
        margin: 0px;
        padding: 0px;
        background-color: #bde0fe;
        ;
    }

    .navBar {
        background-color: rgb(66, 164, 239);
        height: 80px;
        display: flex;
    }

    .navBar button {
        flex: 1;
        font-size: 2rem;
        background: transparent;
        border: none;
    }

    .navBar button:hover {
        background-color: black;
        color: white;
        cursor: pointer;
    }

    .WelcomeMessage {
        text-align: center;
        padding: 3%;
        font-style: oblique;
    }

.displayTables{
text-align:center;
margin:30px;
}
    #ProductInfoTable {
        width: 800px;
        border: 3px solid black;
        padding: 5%;
        margin: 5px;
        ;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th,
    td {
        border: 1px solid black;
        padding: 8px;
        text-align: center !important;
    }

    th {
        background-color: #f2f2f2 !important;
        cursor: pointer;
    }

    tr:hover {
        background-color: #f5f5f5 !important;
    }

    .generalPagination {

        display: flex;
        justify-content: center;
        margin-top: 20px;
        margin:30px;

    }

    .generalPagination button {
        background-color: #ddd;
        padding: 10px;
        border: none;
        cursor: pointer;
    }

    .generalPagination button:hover {
        background-color: black;
        color: white;
    }

    .generalPagination button:active {
        background-color: black;
        color: white;

    }

    .pageSizeInputs {
        margin-bottom: 10px;
    }

    .pageSizeInputs input {
        border: none;
    }


    .confirmationDiv {
     padding:2%;
        display: flex;
        align-items:center;
        justify-content:center;
    }

    .confirmationDiv button {

        max-width:25%;
        margin:5px;
        flex: 1;
    }
    .confirmationDiv button:hover{
     cursor:pointer;
        background-color:black;
        color:white;
    }

    .AddRowButton {

        margin-top: 20px;
        margin-bottom: 50px;
        width: 20%;
        text-align: center;
    }
    .AddRowButton:hover {
    cursor:pointer;
    background-color:black;
    color:white;

        }
</style>

<body>
    <div class="navBar">
        <button onclick="loadProductsTable()">Products</button>
        <button onclick="defaultCallForStocksTable()">Stocks</button>
        <button onclick="loadDefaultPriceTable()">Prices</button>
        <button onclick="defaultCallForCategoriesTable()">Categories</button>
        <button onclick="defaultCallforMasterTable()">Master</button>
    </div>
    <div class="WelcomeMessage">
        <h1> Welcome to the pilot Project!</h1>
        <p>You may use the Navigation Bar on top to view the required data.</p>
    </div>
<div class="MasterTableClass displayTables">
            <h1 style="text-align:center;"> Master Table</h1>
            <label for="MasterTablePageSize">Entries per page :</label>
            <input class="pageSizeInputs" type="number" id="MasterTablePageSize" min="1" value="5"
                placeholder="Page Size">
            <table id="MasterTable" style="width: 100%;">
                <thead>
                    <tr>
                        <th>Product Code <span onclick="sortMasterTable('product_code','ASC')">&#x25B2;</span>
                                                                     <span onclick="sortMasterTable('product_code','DESC')">&#x25BC;</span></th>
                        <th>Product Description <span onclick="sortMasterTable('product_description','ASC')">&#x25B2;</span>
                                                                            <span onclick="sortMasterTable('product_description','DESC')">&#x25BC;</span></th>
                        <th>Category code <span onclick="sortMasterTable('product_category','ASC')">&#x25B2;</span>
                                                                                              <span onclick="sortMasterTable('product_category','DESC')">&#x25BC;</span></th>

                        <th>Category Name <span onclick="sortMasterTable('category_name','ASC')">&#x25B2;</span>
                                                                      <span onclick="sortMasterTable('category_name','DESC')">&#x25BC;</span></th>

                        <th>Price <span onclick="sortMasterTable('price','ASC')">&#x25B2;</span>
                                                              <span onclick="sortMasterTable('price','DESC')">&#x25BC;</span></th>
                        <th>Currency <span onclick="sortMasterTable('currency','ASC')">&#x25B2;</span>
                                                                 <span onclick="sortMasterTable('currency','DESC')">&#x25BC;</span></th>
                        <th>Stock / Inventory  <span onclick="sortMasterTable('inventory_available','ASC')">&#x25B2;</span>
                                                                           <span onclick="sortMasterTable('inventory_available','DESC')">&#x25BC;</span></th>
                        <th>Location / City <span onclick="sortMasterTable('location','ASC')">&#x25B2;</span>
                                                                        <span onclick="sortMasterTable('location','DESC')">&#x25BC;</span></th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            <div class="MasterTablePagination generalPagination">

            </div>
            <div class="confirmationDiv">
                <button  id="insertNewMasterData">
                    Submit
                </button>
                <button class="cancelNewRow">
                    Cancel
                </button>
            </div>
            <button class='AddRowButton'> Add row</button>
        </div>
        </div>
        <div class="ProductsTableClass displayTables">
            <h1 style="text-align:center;">Products Table</h1>
            <table id="ProductInfoTable" style="width: 100%;">
                <thead>
                    <tr>
                        <th>Product Code</th>
                        <th>Product Description</th>
                        <th>Category</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
        <div class="CategoriesTableClass displayTables">
            <h1 style="text-align:center;"> Categories Table</h1>
            <label for="pageSizeInputs">Entries per page :</label>
            <input class="pageSizeInputs" type="number" id="CategoriesPageSize" min="1" value="5"
                placeholder="Page Size">
            <table id="CategoriesInfoTable">
                <thead>
                    <tr>
                        <th>Category Code<span onclick="sortCategories('categoryCode','ASC')">&#x25B2;</span>
                            <span onclick="sortCategories('categoryCode','DESC')">&#x25BC;</span>
                        </th>
                        <th>Category Name <span onclick="sortCategories('categoryName','ASC')">&#x25B2;</span>
                            <span onclick="sortCategories('categoryName','DESC')">&#x25BC;</span>
                        </th>
                    </tr>
                </thead>
                <tbody>

                </tbody>


            </table>
            <div class="CategoriesPagination generalPagination">

            </div>
            <div class="confirmationDiv">
                <button id="insertNewCategories">
                    Submit
                </button>
                <button class="cancelNewRow">
                    Cancel
                </button>
            </div>
            <button class='AddRowButton'> Add row</button>
        </div>
        <div class="StocksTableClass displayTables">
            <h1 style="text-align:center;"> Stocks Table </h1>

            <label for="pageSizeInputs">Entries per page :</label>
            <input class="pageSizeInputs" type="number" id="StockspageSize" min="1" value="5" placeholder="Page Size">
            <table id="StockInfoTable">
                <thead>
                    <tr>
                        <th>Product Code<span onclick="sortStocks('productCode','ASC')">&#x25B2;</span>
                            <span onclick="sortStocks('productCode','DESC')">&#x25BC;</span>
                        </th>
                        <th>Location <span onclick="sortStocks('location','ASC')">&#x25B2;</span>
                            <span onclick="sortStocks('location','DESC')">&#x25BC;</span>
                        </th>
                        <th>Inventory Available<span onclick="sortStocks('inventoryAvailable','ASC')">&#x25B2;</span>
                            <span onclick="sortStocks('inventoryAvailable','DESC')">&#x25BC;</span>
                        </th>
                    </tr>
                </thead>
                <tbody>

                </tbody>


            </table>
            <div class="StocksTablePagination generalPagination">

            </div>
            <div class="confirmationDiv">
                <button id="insertNewStocks">
                    Submit
                </button>
                <button class="cancelNewRow">
                    Cancel
                </button>
            </div>
            <button class='AddRowButton'> Add row</button>

        </div>
        <div class="PricesTableClass displayTables">
            <h1 style="text-align:center;"> Prices Information </h1>

            <label for="pageSizeInputs">Entries per page :</label>
            <input class="pageSizeInputs" type="number" name="pageSize" min="1" value="5" id="PricesInfoPageSize"
                placeholder="Page Size">


            <table id="PricesInfoTable" style="width:100%;">
                <thead>

                </thead>
                <tbody>
                </tbody>
            </table>

            <div class="PricesTablePagination generalPagination">

            </div>
            <div class="confirmationDiv">
                <button id="insertNewPrices">
                    Submit
                </button>
                <button class="cancelNewRow">
                    Cancel
                </button>
            </div>
            <button class='AddRowButton'> Add row</button>

        </div>

</body>
<script>


    //Global Variables  start

    var PrevSortOrder = '';
    var PrevSortColumn = '';
    var PrevPage = '';
    var sortButtonsHtml = '<span class="PricesASCSortButtons" >&#x25B2;</span><span class="PricesDESCSortButtons">&#x25BC;</span>';
    var dataToBeInserted = [];
    //Global Variables  end



    $(document).ready(function () {
        $('.confirmationDiv').hide();
        $('.AddRowButton').click(function () {
            var tBody = $(this).parent().find('tbody');
            console.log(tBody.html());
            var cellNumber = tBody.children('tr').last().children('td').length;
            var rowHtml = '<tr>';
            for (let i = 0; i < cellNumber; i++) {
                rowHtml += '<td><input></td>';
            }

            tBody.append(rowHtml);

            $('.confirmationDiv').show();



        })
        $('.cancelNewRow').click(function () {
            $(this).parent().parent().find('table tr:last').remove();
            $('.confirmationDiv').hide();
        })


        $('.confirmationDivCategories').hide();
        $('#insertNewCategories').click(insertNewCategoriesRow);
        $('#insertNewStocks').click(insertNewStocks);
        $('#insertNewPrices').click(insertNewPrices);
        $('#insertNewMasterData').click(insertMasterData);


        PrevSortOrder = '';
        PrevSortColumn = '';
        $('.PricesTableClass').hide();
        $('.MasterTableClass').hide();
        $('.ProductsTableClass').hide();
        $('.StocksTableClass').hide();
        $('.CategoriesTableClass').hide();




        //PricesTable sorting caller start

        $(document).on('click', '.PricesASCSortButtons', function () {
            let name = $(this).parent().text();
            var sortColumn = name.substring(0, name.length - 2);
            sortColumn = sortColumn.replace(' ', '');
            sortColumn = sortColumn.toLowerCase() == ('productcode') ? 'product_code' : sortColumn
            PrevSortColumn = sortColumn;
            PrevSortOrder = 'ASC'
            sortPricesData(sortColumn, 'ASC');
            PrevSortColumn = sortColumn;
            PrevSortOrder = 'ASC';
        });


        $(document).on('click', '.PricesDESCSortButtons', function () {
            let name = $(this).parent().text();
            var sortColumn = name.substring(0, name.length - 2);
            sortColumn = sortColumn.replace(' ', '');
            sortColumn = sortColumn.toLowerCase() == ('productcode') ? 'product_code' : sortColumn
            sortPricesData(sortColumn, 'DESC');
            PrevSortColumn = sortColumn;
            PrevSortOrder = 'DESC';
        });


        // PricesTable sorting caller end


        //EventHandlers for change in page size start
        $('#StockspageSize').change(changeStocksPageSize);
        $('#CategoriesPageSize').change(changeCategoriesPageSize);
        $('#PricesInfoPageSize').change(changePricesPageSize);
        $('#MasterTablePageSize').change(changeMasterTablePageSize);
        //EventHandlers for change in page size end

        //Pagination button event handlers start
        $('.StocksTablePagination').on('click', 'button', function () {
            var pageNumber = $(this).text();
            var data = {
                sortColumn: PrevSortColumn,
                sortOrder: PrevSortOrder,
                pageSize: $('#StockspageSize').val() > 0 ? $('#StockspageSize').val() : 5,
                pageNumber: pageNumber - 1
            };
            loadStocksTable(data);
            PrevPage = pageNumber - 1;
        });

        $('.CategoriesPagination').on('click', 'button', function () {
            var pageNumber = $(this).text();
            var data = {
                sortColumn: PrevSortColumn,
                sortOrder: PrevSortOrder,
                pageSize: $('#CategoriesPageSize').val() > 0 ? $('#CategoriesPageSize').val() : 5,
                pageNumber: pageNumber - 1
            };
            loadCategoriesTable(data);
            PrevPage = pageNumber - 1;
        });

        $('.PricesTablePagination').on('click', 'button', function () {
            var pageNumber = $(this).text();
            var data = {
                sortColumn: PrevSortColumn,
                sortOrder: PrevSortOrder,
                pageSize: $('#PricesInfoPageSize').val() > 0 ? $('#PricesInfoPageSize').val() : 5,
                pageNumber: pageNumber - 1
            };
            renderPricesTable(data);
            PrevPage = pageNumber - 1;
        });
        $('.MasterTablePagination').on('click', 'button', function () {
                    var pageNumber = $(this).text();
                    var data = {
                        sortColumn: PrevSortColumn,
                        sortOrder: PrevSortOrder,
                        pageSize: $('#MasterTablePageSize').val() > 0 ? $('#MasterTablePageSize').val() : 5,
                        pageNumber: pageNumber - 1
                    };
                    loadMasterTableData(data);
                    PrevPage = pageNumber - 1;
                });

        //Pagination button event handlers start

    });

    // Default Calls Start

    function loadDefaultPriceTable() {
        var defaultData = {
            pageNumber: 0,
            pageSize: 5,
            sortColumn: 'product_code',
            sortOrder: 'ASC'
        }
        renderPricesTable(defaultData);
        PrevSortColumn = defaultData.sortColumn;
        PrevSortOrder = defaultData.sortOrder;
        PrevPage = defaultData.pageNumber;
        $('.confirmationDiv').hide();

    }


function defaultCallforMasterTable(){
let defaultData={
pageNumber:0,
pageSize:5,
sortColumn:'product_code',
sortOrder:'ASC'
}
loadMasterTableData(defaultData);
 PrevSortColumn = defaultData.sortColumn;
        PrevSortOrder = defaultData.sortOrder;
        PrevPage = defaultData.pageNumber;
}
    function defaultCallForCategoriesTable() {

        let defaultData = {
            pageNumber: 0,
            pageSize: 5,
            sortColumn: 'categoryName',
            sortOrder: 'ASC'
        }

        loadCategoriesTable(defaultData);
        PrevSortColumn = defaultData.sortColumn;
        PrevSortOrder = defaultData.sortOrder;
        PrevPage = defaultData.pageNumber;
        $('.confirmationDiv').hide();

    }


    function defaultCallForStocksTable() {
        let defaultData = {
            pageNumber: 0,
            pageSize: 5,
            sortColumn: 'productCode',
            sortOrder: 'ASC'
        }
        loadStocksTable(defaultData);
        PrevSortColumn = defaultData.sortColumn;
        PrevSortOrder = defaultData.sortOrder;
        PrevPage = defaultData.pageNumber;
        $('.confirmationDiv').hide();
    }

    //Default Calls End


    //main loading functions start

    function loadProductsTable() {
        $('.PricesTableClass').hide();
        $('.ProductsTableClass').hide();
        $('.StocksTableClass').hide();
        $('.CategoriesTableClass').hide();
        $('.MasterTableClass').hide();
        $.ajax({
            url: '/getProductsInfo',
            type: 'GET',
            success: function (data) {
                data = data.entityList;
                $('#ProductInfoTable tbody').html('');
                let finalHtml = '';
                data.forEach(element => {
                    finalHtml += '<tr><td>' + element.productCode + '</td>' + '<td>' +
                        element.productDescription + '</td>' + '<td>' + element.category
                        + '</td></tr>';
                });
                $('#ProductInfoTable tbody').html(finalHtml);
                $('#ProductInfoTable').dataTable();
                $('.ProductsTableClass').show();
            }
        })
    }



    function renderPricesTable(data) {
        $('.ProductsTableClass').hide();
        $('.StocksTableClass').hide();
        $('.CategoriesTableClass').hide();
        $('.MasterTableClass').hide();


        $.ajax({
            url: '/newPricesMethod',
            data: data,
            type: 'GET',

            success: function (data) {
                data = JSON.stringify(data);
                data = JSON.parse(data);
                var KeySet = data.keySet;
                $('#PricesInfoTable thead').html('');
                let headHtml = '<tr><th rowspan="2">' + 'Product Code' +

                    sortButtonsHtml

                    + "</th><th colspan="
                    + KeySet.length
                    + '>' + 'Prices' + '</th></tr><tr>';
                KeySet.forEach(element => {
                    headHtml += '<th>' + element + sortButtonsHtml + '</th>'
                });
                headHtml += '</tr>'
                $('#PricesInfoTable thead').html(headHtml);
                let bodyHtml = '';
                $('#PricesInfoTable tbody').html('');
                for (let i = 0; i < data.rowData.length; i++) {
                    bodyHtml += '<tr><td>' + data.rowData[i].product_code + "</td>"
                    data.keySet.forEach(element => {
                        bodyHtml += "<td>" + data.rowData[i][element.toLowerCase()] +
                            "</td>"
                    })
                    bodyHtml += '</tr>'
                }
                $('#PricesInfoTable tbody').html(bodyHtml);
                var numberOfPages = (data.totalRecords % $('#PricesInfoPageSize').val()) === 0 ? (data.totalRecords / $('#PricesInfoPageSize').val()) : (data.totalRecords / $('#PricesInfoPageSize').val()) + 1;
                let paginationData = {
                    totalPages: numberOfPages
                }
                loadPagination('.PricesTablePagination', paginationData);
                $('.PricesTableClass').show();

            }
        })
    }



    function loadCategoriesTable(data) {
        $('.PricesTableClass').hide();
        $('.ProductsTableClass').hide();
        $('.StocksTableClass').hide();
        $('.MasterTableClass').hide();


        $.ajax({
            url: '/getCategoriesInfo',
            data: data,
            type: 'GET',
            success: function (data) {
                $('#CategoriesInfoTable tbody').html('');
                let finalHtml = '';
                data.content.forEach(element => {
                    finalHtml += '<tr><td>' + element.categoryCode + '</td>'
                        + '<td>' + element.categoryName + '</td></tr>'
                });
                console.log(finalHtml);
                $('#CategoriesInfoTable tbody').html(finalHtml);
                loadPagination('.CategoriesPagination', data);
                $('.CategoriesTableClass').show();
            },
            error: function () {
                console.log('error occured');
            }
        })
    }


    function loadStocksTable(data) {
        $('.PricesTableClass').hide();
        $('.ProductsTableClass').hide();
        $('.CategoriesTableClass').hide();
        $('.MasterTableClass').hide();


        $.ajax({
            url: '/getStocksInfo',
            type: 'GET',
            data: data,
            success: function (data) {
                $('#StockInfoTable tbody').html('');
                let finalHtml = ''
                data.content.forEach(element => {
                    finalHtml += '<tr><td>' + element.productCode + '</td>' + '<td>' + element.location + '</td>'
                        + '<td>' + element.inventoryAvailable + '</td></tr>'
                });
                console.log(finalHtml);
                $('#StockInfoTable tbody').html(finalHtml);
                loadPagination('.StocksTablePagination', data);
                $('.StocksTableClass').show();
            }
        })
    }

    // main loading function ends


    //common pagination loading function start

    function loadPagination(tablePaginationId, paginationData) {

        var paginationHtml = '';
        for (var i = 1; i <= paginationData.totalPages; i++) {
            paginationHtml += '<button>' + i + '</button>';
        }
        $(tablePaginationId).html(paginationHtml);
    }

    //common pagination loading function ends



    //Sorting Methods Start

    function sortStocks(sortColumn, sortOrder) {
        let data = {
            sortColumn: sortColumn,
            sortOrder: sortOrder,
            pageSize: $('#StockspageSize').val() > 0 ? $('#StockspageSize').val() : 5,
            pageNumber: PrevPage
        }
        loadStocksTable(data);
        PrevSortColumn = sortColumn;
        PrevSortOrder = sortOrder;
    }


    function sortCategories(sortColumn, sortOrder) {
        let data = {
            sortColumn: sortColumn,
            sortOrder: sortOrder,
            pageSize: $('#CategoriesPageSize').val() > 0 ? $('#CategoriesPageSize').val() : 5,
            pageNumber: PrevPage
        }
        loadCategoriesTable(data);
        PrevSortColumn = sortColumn;
        PrevSortOrder = sortOrder;
    }


    function sortPricesData(sortColumn, sortOrder) {
        let data = {

            sortColumn: sortColumn,
            sortOrder: sortOrder,
            pageSize: $('#PricesInfoPageSize').val() > 0 ? $('#PricesInfoPageSize').val() : 5,
            pageNumber: PrevPage

        }
        renderPricesTable(data);
        PrevSortOrder = sortOrder;
        PrevSortColumn = sortColumn;
    }

    //Sorting methods end



    //Page size change handlers start

    function changeStocksPageSize() {
        let data = {
            sortColumn: PrevSortColumn,
            sortOrder: PrevSortColumn,
            pageSize: $('#StockspageSize').val() > 0 ? $('#StockspageSize').val() : 5,
            pageNumber: 0
        }
        loadStocksTable(data);
         $('.confirmationDiv').hide();
    }


    function changeCategoriesPageSize() {
        let data = {
            sortColumn: PrevSortColumn,
            sortOrder: PrevSortOrder,
            pageSize: $('#CategoriesPageSize').val() > 0 ? $('#CategoriesPageSize').val() : 5,
            pageNumber: 0
        }
        loadCategoriesTable(data);
         $('.confirmationDiv').hide();
    }


    function changePricesPageSize() {
        let data = {
            sortColumn: PrevSortColumn.toLowerCase() == ('productcode') ? 'product_code' : PrevSortColumn,
            sortOrder: PrevSortOrder,
            pageSize: $('#PricesInfoPageSize').val() > 0 ? $('#PricesInfoPageSize').val() : 5,
            pageNumber: 0
        }
        renderPricesTable(data);
         $('.confirmationDiv').hide();
    }


    //Page size change handlers end




    function insertNewCategoriesRow() {

        var inputs = $('#CategoriesInfoTable tbody').children('tr').last().find('td');
        var data = {
            categoryCode: inputs.eq(0).children('input').val(),
            categoryName: inputs.eq(1).children('input').val()
        }
        console.log(data);

        $.ajax({
            url: '/insertNewCategories',
            type: 'POST',
            data: data,
            success: function (data) {
                if (data == 'SUCCESS') {
                    defaultCallForCategoriesTable();
                    $('.confirmationDiv').hide();
                }
            }
        });



    }


    function insertNewStocks(){

     var inputs = $('#StockInfoTable tbody').children('tr').last().find('td');
     var data = {
                 productCode: inputs.eq(0).children('input').val(),
                 location: inputs.eq(1).children('input').val(),
                 inventoryAvailable:inputs.eq(2).children('input').val()
             }

           $.ajax({
                      url: '/insertNewStocks',
                      type: 'POST',
                      data: data,
                      success: function (data) {
                          if (data == 'SUCCESS') {
                              defaultCallForStocksTable();
                              $('.confirmationDiv').hide();
                          }
                      }
                  });

    }

function insertNewPrices(){
var headers=$('#PricesInfoTable thead').children('tr').last().children('th');

var data={};
var inputs = $('#PricesInfoTable tbody').children('tr').last().find('td');
var Value='';
var Header='';
headers.each(function(index,element){

var Header=headers.eq(index).text();
Header=Header.substring(0, Header.length - 2);
Value=inputs.eq(index).val();
data[Header]=Value;
console.log(data);

});


var finalData={
productCode:inputs.eq(0).children('input').val(),
details:data
};

var testData={};
testData[inputs.eq(0).children('input').val()]=data;

$.ajax({
url:'/insertNewPrices',
contentType:'application/json',
data:JSON.stringify(finalData),
type:'POST',
success:function(data){
if(data=='SUCCESS'){
loadDefaultPriceTable();
$('.confirmationDiv').hide();
}

}
});

}






function loadMasterTableData(data){
 $('.PricesTableClass').hide();
        $('.MasterTableClass').hide();
        $('.ProductsTableClass').hide();
        $('.StocksTableClass').hide();
        $('.CategoriesTableClass').hide();
console.log(data);
$.ajax({
url:'/fetchMasterTable',
type:'GET',
data:data,
success:function(data){
$('#MasterTable tbody').html('');
 let finalHtml = '';
                data.forEach(element => {
                    finalHtml += '<tr><td>' + element.productCode + '</td>'
                        + '<td>' + element.productDescription + '</td>'+
                        '<td>' + element.categoryCode + '</td>'+
                        '<td>' + element.categoryName + '</td>'+
                        '<td>' + element.price + '</td>'+
                        '<td>' + element.currency + '</td>'+
                        '<td>' + element.inventoryAvailable + '</td>'+
                        '<td>' + element.location + '</td>'+
                        '</tr>'
                });

                $('#MasterTable tbody').html(finalHtml);
                var totalRecords=data[0]?data[0].totalRecords:0;
                var pageSize=$('#MasterTablePageSize').val();
                var remainder=totalRecords%pageSize;
console.log(totalRecords,pageSize);
                var numberOfPages =remainder==0?totalRecords/pageSize:(totalRecords-remainder)/pageSize+1;
                console.log(numberOfPages);
                 console.log(numberOfPages);
                                let paginationData = {
                                    totalPages: numberOfPages
                                }
                                loadPagination('.MasterTablePagination', paginationData);
                $('.MasterTableClass').show();

}

})
}






function sortMasterTable(sortColumn,sortOrder){

var data={
sortColumn:sortColumn,
sortOrder:sortOrder,
pageSize:$('#MasterTablePageSize').val()>0?$('#MasterTablePageSize').val():5,
pageNumber:PrevPage>=0?PrevPage:0
}
loadMasterTableData(data);
PrevSortOrder=sortOrder
PrevSortColumn=sortColumn
}

function insertMasterData(){
 var inputs = $('#MasterTable tbody').children('tr').last().find('td');
 var data={
                  productCode: inputs.eq(0).children('input').val(),
                  productDescription: inputs.eq(1).children('input').val(),
                  categoryCode: inputs.eq(2).children('input').val(),
                  categoryName: inputs.eq(3).children('input').val(),
                  price: inputs.eq(4).children('input').val(),
                  currency: inputs.eq(5).children('input').val(),
                   inventoryAvailable: inputs.eq(6).children('input').val(),
                    location: inputs.eq(7).children('input').val()


 }

 $.ajax({
 url:'/insertMasterData',
 type:'POST',
 data:JSON.stringify(data),
 contentType:'application/json',
 success:function(data){
 console.log(data);
 defaultCallforMasterTable();
 $('.confirmationDiv').hide();
 }
 })
}


function changeMasterTablePageSize(){
 let data = {
            sortColumn: PrevSortColumn,
            sortOrder: PrevSortOrder,
            pageSize: $('#MasterTablePageSize').val() > 0 ? $('#MasterTablePageSize').val() : 5,
            pageNumber: 0
        }
        loadMasterTableData(data);
         $('.confirmationDiv').hide();
}




</script>

</html>