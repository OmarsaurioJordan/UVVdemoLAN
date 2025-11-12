// arg0: estructura array
// arg1: true min, false max
// ret: valor minimo o maximo

var list = ds_list_create();
for (var i = 0; i < array_length_1d(argument0); i++) {
    ds_list_add(list, argument0[i]);
}
ds_list_sort(list, argument1);
var res = ds_list_find_value(list, 0);
ds_list_destroy(list);
return res;

