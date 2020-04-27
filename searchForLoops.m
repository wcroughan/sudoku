function new_board = searchForLoops(board, loop_sz, varargin)
    if isempty(varargin)
        stop_cell = 0;
        interactive = false;
    else
        interactive = true;
        stop_cell = varargin{1};
        if size(stop_cell, 2) > 1
            stop_cell = stop_cell';
        end
    end

    N = size(board,1);
    subsets = nchoosek(1:N, loop_sz);
    new_board = board;

    %columns
    for col=1:N
        r_idxs = (col-1)*N + (1:N);
        r = board(:,r_idxs);
        for ssi = 1:size(subsets,1)
            ss = false(1,N);
            ss(subsets(ssi,:)) = true;
            col_union = any(r(:,ss), 2);
            if sum(col_union) < loop_sz
                new_board = [];
                return;
            elseif sum(col_union) == loop_sz
                %found a loop!
                complement = ~ss;
                making_changes = any(new_board(col_union,r_idxs(complement)), 'all');
                new_board(col_union,r_idxs(complement)) = false;
                if any(r_idxs(complement) == stop_cell, 'all') && interactive && making_changes
                    keyboard
                end
            end

            row_union = any(r(ss,:),1);
            if sum(row_union) < loop_sz
                new_board = [];
                return;
            elseif sum(row_union) == loop_sz
                %found a loop!
                complement = ~ss;
                making_changes = any(new_board(complement,r_idxs(row_union)), 'all');
                new_board(complement,r_idxs(row_union)) = false;
                if any(r_idxs(complement) == stop_cell, 'all') && interactive && making_changes
                    keyboard
                end
            end
        end
    end

    %row
    for row=1:N
        r_idxs = row:N:N*N;
        r = board(:,r_idxs);
        for ssi = 1:size(subsets,1)
            ss = false(1,N);
            ss(subsets(ssi,:)) = true;
            col_union = any(r(:,ss), 2);
            if sum(col_union) < loop_sz
                new_board = [];
                return;
            elseif sum(col_union) == loop_sz
                %found a loop!
                complement = ~ss;
                making_changes = any(new_board(col_union,r_idxs(complement)), 'all');
                new_board(col_union,r_idxs(complement)) = false;
                if any(r_idxs(complement) == stop_cell, 'all') && interactive && making_changes
                    keyboard
                end
            end

            row_union = any(r(ss,:),1);
            if sum(row_union) < loop_sz
                new_board = [];
                return;
            elseif sum(row_union) == loop_sz
                %found a loop!
                complement = ~ss;
                making_changes = any(new_board(complement,r_idxs(row_union)), 'all');
                new_board(complement,r_idxs(row_union)) = false;
                if any(r_idxs(complement) == stop_cell, 'all') && interactive && making_changes
                    keyboard
                end
            end
        end
    end

    %grids
    n = sqrt(N);
    for col = 1:n
        for row = 1:n
            top_left = (row-1)*n + (col-1)*N*n + 1;
            r_idxs = (top_left + N*(0:n-1)) + (1:n)' - 1;
            r_idxs = r_idxs(:);
            r = board(:,r_idxs);
            for ssi = 1:size(subsets,1)
                ss = false(1,N);
                ss(subsets(ssi,:)) = true;
                col_union = any(r(:,ss), 2);
                if sum(col_union) < loop_sz
                    new_board = [];
                return;
                elseif sum(col_union) == loop_sz
                    %found a loop!
                    complement = ~ss;
                making_changes = any(new_board(col_union,r_idxs(complement)), 'all');
                    new_board(col_union,r_idxs(complement)) = false;
                if any(r_idxs(complement) == stop_cell, 'all') && interactive && making_changes
                    keyboard
                end
                end

                row_union = any(r(ss,:),1);
                if sum(row_union) < loop_sz
                    new_board = [];
                return;
                elseif sum(row_union) == loop_sz
                    %found a loop!
                    complement = ~ss;
                making_changes = any(new_board(complement,r_idxs(row_union)), 'all');
                    new_board(complement,r_idxs(row_union)) = false;
                if any(r_idxs(complement) == stop_cell, 'all') && interactive && making_changes
                    keyboard
                end
                end
            end
        end
    end

end



