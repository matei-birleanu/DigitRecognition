## Copyright (C) 2021 Andrei
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} visualise_image (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2021-09-10

function im = visualise_image(train_mat, number)
  % Inițializare matrice finală.
  im = zeros(28, 28);
  
  % Citeste din matricea de antrenament linia cu numărul `number`.
  image_row = train_mat(number, :);
  
  % Transformă linia citită într-o matrice 28x28 care trebuie apoi transpusă.
  im = reshape(image_row, [28, 28])';
  
  % Transformă matricea în uint8 pentru a fi o imagine validă.
  im = uint8(im);
  
  % imshow(im)
endfunction
