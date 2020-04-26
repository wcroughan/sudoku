N = 9;
n = sqrt(N);
assert(sqrt(N) == floor(sqrt(N)));

board = true(N,N*N);

init_entries = [1, 3, 5;
                4, 5, 9;
                9, 5, 1;
                2, 2, 2];

for ie = init_entries'
    board(:,ie(1) + (ie(2) - 1) * N) = false;
    board(ie(3),ie(1) + (ie(2) - 1) * N) = true;
end

print_board(board);

solved = all(sum(board) == 1);

while ~solved
    for depth = 1:8
        
    end

end