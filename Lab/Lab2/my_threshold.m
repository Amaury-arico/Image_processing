function Result= my_threshold (I, T1, T2)

Matrix_size = size(I);
Column_size = Matrix_size(1,2);
Image = reshape(I,[],1);
L = length(Image);
Result_im = zeros(L,1);

    for i=1:L
        if Image(i) >T1 && Image(i)<T2
           Result_im(i) = Image(i);
        else
        end
    end
Result = reshape(Result_im,[],Column_size);
end 
