//Source comes from: http://jsfiddle.net/Zhd2X/21/

//Sort all tables by header row
$('.sortable th').click(function(){


    var $table = $(this).parents('table').eq(0);
    var rows = $table.find("tr:not(:has('th'))").toArray();
    rows.sort(comparer($(this).index()));
    this.asc = !this.asc;

    if (!this.asc){
        rows = rows.reverse();
    }

    for (var i = 0; i < rows.length; i++){
        $table.append(rows[i]);
    }
})

function comparer(index) {
    return function(a, b) {
        var valA = getCellValue(a, index), valB = getCellValue(b, index);
        var areNumeric = $.isNumeric(valA) && $.isNumeric(valB);
        return areNumeric ? valA - valB : valA.localeCompare(valB);
    }
}

function getCellValue(row, index){
    return $(row).children('td').eq(index).html();
}
