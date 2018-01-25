function makePage(param) {
    var last = Math.ceil(param.page / 10.0) * 10;
    var first = last - 9;
    var prev = false, next = true;
    
    if (param.total <= last * param.size ) {
        last = Math.ceil(param.total / (param.size * 1.0));
        next = false;
    }
    prev = first != 1 ? true : false;
    
    return {first:first, last:last, next:next, prev:prev, page:param.page};
}

function changePage(param) {
    var last = Math.ceil(param.page / 5.0) * 10;
    var first = last - 4;
    var prev = false, next = true;
    
    if (param.total <= last * param.size ) {
        last = Math.ceil(param.total / (param.size * 1.0));
        next = false;
    }
    prev = first != 1 ? true : false;
    
    return {first:first, last:last, next:next, prev:prev, page:param.page};
}

