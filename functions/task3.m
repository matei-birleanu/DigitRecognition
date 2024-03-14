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
## @deftypefn {} {@var{retval} =} pca_cov (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2021-09-06

function new_X = task3(photo, pcs)
  [m, n] = size(photo);
  
  % Inițializare matrice finală.
  new_X = zeros(m, n);
  
  % Convertirea matricei photo la tipul double.
  photo = double(photo);
  
  % Calculează media fiecărui rând al matricei.
  mean_row = mean(photo, 2);
  
  % Normalizează matricea inițială prin scăderea mediei fiecărui rând.
  normalized_photo = photo - mean_row;
  
  % Calculează matricea de covarianță.
  covariance_matrix = (normalized_photo * normalized_photo') / (n - 1);
  
  % Calculează valorile și vectorii proprii ai matricei de covarianță.
  [V, D] = eig(covariance_matrix);
  
  % Ordonează descrescător valorile proprii și păstrează doar primele pcs coloane din matricea V.
  [eigenvalues, indices] = sort(diag(D), 'descend');
  V = V(:, indices);
  V = V(:, 1:pcs);
  
  % Calculează matricea Y (proiecția lui A în spațiul componentelor principale).
  Y = V' * normalized_photo;
  
  % Aproximează matricea inițială utilizând matricele W și Y, adăugând media rândului inițial.
  new_X = V * Y + mean_row;
  
  % Transformă matricea în uint8 pentru a obține o imagine validă.
  new_X = uint8(new_X);
endfunction
