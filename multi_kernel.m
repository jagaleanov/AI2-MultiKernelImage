% colorImage = imread('D:\oneDrive - U\OneDrive - Universidad Distrital Francisco José de Caldas\IA2 - Primer corte\08 - visión artificial\test.jpg');
% colorImage = imread('D:\oneDrive - U\OneDrive - Universidad Distrital Francisco José de Caldas\IA2 - Primer corte\08 - visión artificial\test2.jpg');
% colorImage = imread('D:\oneDrive - U\OneDrive - Universidad Distrital Francisco José de Caldas\IA2 - Primer corte\08 - visión artificial\test3.jpg');
colorImage = imread('D:\oneDrive - U\OneDrive - Universidad Distrital Francisco José de Caldas\IA2 - Primer corte\08 - visión artificial\plano.png');
%imshow(colorImage);
greyScaleImage = rgb2gray(colorImage);
imshow(greyScaleImage);

%%%% SELECCIONAR KERNEL (matriz de 3x3) %%%%
% kernel = [0 0 0; 0 1 0; 0 0 0];          % identidad
% kernel = [0 -1 0; -1 4 -1; 0 -1 0];      % deteccion de bordes
% kernel = [-1 -1 -1; -1 8 -1; -1 -1 -1];  % deteccion de bordes
% kernel = [0 -1 0; -1 5 -1; 0 -1 0];      % sharppen edges
% kernel = (1/9)*[1 1 1; 1 1 1; 1 1 1];    % box blur
% kernel = (1/13)*[1 2 1; 2 4 2; 1 2 1];   % gaussian blur

kernel = (1/70)*[1 1 1; 1 1 1; 1 1 1];   % sketch
tic
for i = 1 : size(greyScaleImage, 1)
    for j = 1 : size(greyScaleImage, 2)
        if i == 1
            % saltar la primera fila del kernel
            kFrom = 2;
            kTo = 3;
        elseif i == size(greyScaleImage, 1)
            % saltar la ultima fila del kernel
            kFrom = 1;
            kTo = 2;
        else
            % usar todas las filas del kernel
            kFrom = 1;
            kTo = 3;
        end


        if j == 1
            % saltar la primera columna del kernel
            lFrom = 2;
            lTo = 3;
        elseif j == size(greyScaleImage, 2)
            % saltar la ultima columna del kernel
            lFrom = 1;
            lTo = 2;
        else
            % usar todas las columnas del kernel
            lFrom = 1;
            lTo = 3;
        end

        val = 0;
        for k = kFrom : kTo 
            for l = lFrom : lTo
                if k == 1
                    iAdd = - 1;
                elseif k == 2
                    iAdd = 0;
                elseif k == 3
                    iAdd = 1;
                end

                if l == 1
                    jAdd = - 1;
                elseif l == 2
                    jAdd = 0;
                elseif l == 3
                    jAdd = 1;
                end

                val = val + kernel(k, l) * greyScaleImage(i + iAdd, j + jAdd);
            end
        end
        % disp(val);
        finalMatrix(i, j) = val;
    end
end
toc
% imshow(finalMatrix, []);