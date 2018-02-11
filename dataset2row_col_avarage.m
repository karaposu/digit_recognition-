function [dataset_row_avarage_array, dataset_col_avarage_array] = dataset2row_col_avarage(Picture_Set, image_count)

for i=1:image_count 
 I =cell2mat(Picture_Set(i))  ;
 
[ r , n ]=row_and_col_avarage_of_img(I,50,50);
dataset_row_avarage_array{i}=r;
dataset_col_avarage_array{i}=n;


end