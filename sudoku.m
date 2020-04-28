N = 9;
n = sqrt(N);
assert(sqrt(N) == floor(sqrt(N)));

board = true(N,N*N);

% this board should have 9 ruled out in second row, right 3 cells. Looping strategy doesnt find that though
% board_start = [0 0 0 9 0 0 0 0 0;
%                0 0 0 0 0 0 0 0 0;
%                0 1 2 0 0 0 0 0 0;
%                0 0 0 0 0 0 0 0 0;
%                9 0 0 0 0 0 0 0 0;
%                0 0 0 0 0 0 0 0 0;
%                0 0 0 0 0 0 0 0 0;
%                0 0 0 0 0 0 0 0 0;
%                0 0 0 0 0 0 0 0 0];

% board_start = [5 0 0 6 0 0 7 0 0;
%                0 8 0 7 4 0 9 0 0;
%                0 0 0 0 0 0 0 0 8;
%                0 0 0 0 0 8 3 0 1;
%                3 2 0 0 0 0 0 4 5;
%                1 0 6 4 0 0 0 0 0;
%                7 0 0 0 0 0 0 0 0;
%                0 0 9 0 2 6 0 8 0;
%                0 0 2 0 0 1 0 0 6];

% can be solved at depth 1
% board_start = [8 0 0 0 0 0 2 0 5;
%                4 7 5 2 6 9 1 0 0;
%                0 0 6 0 0 0 0 0 0;
%                0 8 0 0 0 2 0 7 9;
%                9 0 1 0 7 0 5 0 6;
%                7 5 0 6 0 0 0 1 0;
%                0 0 0 0 0 0 3 0 0;
%                0 0 7 1 2 8 6 5 4;
%                5 0 4 0 0 0 0 0 2];

% same
% board_start = [9 0 0 0 3 8 6 0 0;
%                0 3 2 0 6 0 0 0 5;
%                0 0 0 0 0 0 2 0 0;
%                0 0 0 6 8 3 7 0 9;
%                0 0 0 0 0 0 0 0 0;
%                4 0 7 1 5 9 0 0 0;
%                0 0 6 0 0 0 0 0 0;
%                7 0 0 0 4 0 5 8 0;
%                0 0 4 8 2 0 0 0 6];

% may have to use list of possible board for this one
% board_start = [5 0 0 0 2 9 0 0 1;
%                0 8 0 0 0 0 0 4 0;
%                0 0 0 0 0 0 0 0 0;
%                7 3 0 6 0 0 0 0 0;
%                0 4 0 0 0 0 0 3 0;
%                0 0 0 0 1 0 9 0 0;
%                1 0 0 0 0 0 5 0 0;
%                0 0 0 8 0 0 0 0 0;
%                0 0 0 4 0 0 0 0 0];

% board_start = [1 0 0 0 6 0 7 0 5;
%                0 0 0 0 0 0 8 0 1;
%                0 6 0 9 0 7 0 0 0;
%                0 2 0 0 0 3 0 0 0;
%                9 7 0 0 0 0 0 3 4;
%                0 0 0 1 0 0 0 5 0;
%                0 0 0 4 0 6 0 1 0;
%                2 0 6 0 0 0 0 0 0;
%                4 0 3 0 5 0 0 0 7];


% board_start = [5 6 3 4 7 2 1 0 0;
%                1 0 4 8 5 9 3 6 0;
%                0 0 0 0 1 0 5 4 0;
%                2 0 0 0 9 4 6 0 5;
%                4 0 0 1 6 0 0 2 3;
%                6 0 0 0 0 0 4 0 1;
%                0 0 0 0 3 0 0 1 4;
%                8 4 0 0 0 0 0 3 6;
%                3 0 6 0 4 0 0 5 0];

% board_start = [0 0 0 1 0 0 6 0 7;
%                1 0 0 0 0 0 0 0 0;
%                0 0 0 0 0 0 2 0 0;
%                0 3 2 5 0 0 0 0 0;
%                0 5 0 0 0 3 0 8 0;
%                0 0 0 0 0 0 4 0 0;
%                0 0 0 7 2 0 0 0 0;
%                4 0 0 0 0 0 0 3 0;
%                0 0 0 6 0 0 0 0 0];

% board_start = [0 0 12 6 0 0 7 0 18 0 5 24 0 10 1 0 0 4 0 0 0 0 0 0 0 
% 2 0 19 0 13 0 0 0 10 0 0 0 0 0 0 0 0 18 5 0 0 0 0 0 1 
% 0 0 0 0 0 0 0 22 0 0 0 0 3 0 2 0 0 14 12 0 16 8 25 0 0 
% 0 16 0 0 0 2 23 0 0 13 12 22 0 0 0 21 15 19 3 0 0 0 0 14 0 
% 23 0 24 0 0 0 0 0 25 8 4 0 16 19 21 0 0 7 0 0 0 3 12 0 9 
% 0 4 0 2 0 0 0 0 0 0 0 10 0 24 12 17 16 0 0 0 5 0 0 0 0 
% 0 0 9 0 0 6 25 0 0 0 8 0 5 3 0 0 0 0 0 0 20 0 0 18 19 
% 15 0 10 11 0 0 0 18 12 19 0 0 0 0 0 0 0 23 0 0 7 0 0 4 0 
% 0 0 0 0 0 0 0 14 0 22 0 0 18 16 20 0 6 11 13 0 0 0 0 0 0 
% 0 22 0 25 0 0 1 17 5 4 7 0 0 14 0 8 3 21 0 0 11 0 0 0 6 
% 0 20 13 15 0 0 0 0 0 0 9 0 0 2 0 25 0 1 8 0 0 5 0 21 0 
% 0 1 0 0 0 0 16 10 0 7 0 0 4 20 0 0 9 0 0 14 0 24 0 17 0 
% 25 2 5 0 0 0 0 0 13 0 0 0 0 0 22 0 0 0 0 0 19 1 8 0 0 
% 0 0 7 21 0 0 12 0 2 17 0 0 0 18 6 16 0 0 15 0 0 13 0 10 0 
% 8 10 18 12 16 9 0 0 0 5 0 0 0 0 19 0 0 17 0 21 0 15 0 0 22 
% 0 8 0 0 15 0 3 0 6 0 21 0 0 7 0 18 14 5 0 1 0 0 0 0 0 
% 0 0 0 19 0 1 0 16 11 0 0 0 10 22 25 15 0 0 0 0 0 0 21 0 0 
% 0 3 1 0 21 0 0 4 0 0 0 0 2 0 13 0 24 25 0 0 14 0 0 6 0 
% 0 0 0 0 0 0 0 15 0 12 14 0 6 17 24 0 0 0 0 0 0 0 13 0 0 
% 0 5 23 16 4 0 13 24 7 2 0 9 0 0 15 3 0 22 0 0 0 0 0 0 8 
% 0 0 25 20 2 0 19 0 0 0 0 1 0 0 0 0 21 3 0 0 12 0 0 0 0 
% 16 12 0 5 0 11 21 0 23 0 0 15 0 0 0 0 19 9 0 0 0 0 0 25 10 
% 0 0 0 0 9 20 22 7 4 0 3 0 14 25 18 0 11 0 0 0 0 0 1 0 15 
% 24 0 6 0 22 8 0 25 14 0 10 11 0 9 0 20 1 16 0 7 0 23 0 0 13 
% 14 13 21 1 0 0 5 0 0 0 6 0 22 0 23 10 0 0 0 2 0 0 18 7 11];

bs = board_start(:);
board(:,bs' > 0) = false;
board(sub2ind(size(board), bs(bs>0), find(bs>0))) = true;
print_board(board);

loop_search_size = 1;
solved = all(sum(board) == 1);
iter = 1;

all_possible_boards = {board};
next_round_boards = {};

tic
while true
    disp(['iter ' num2str(iter) ', ' num2str(length(all_possible_boards)) ' boards, loop size ' num2str(loop_search_size)]);
    no_diff = true;
    % max_search_size = max(1, sqrt(N) - length(all_possible_boards) + 1);
    max_search_size = max(1, N - length(all_possible_boards) + 1);
    for bi = 1:length(all_possible_boards)
        b = all_possible_boards{bi};
        new_board = b;
        invalid_board = false;
        for lsz = loop_search_size:-1:1
            % new_board = searchForLoops(new_board, lsz, (1:N*N)');
            new_board = searchForLoops(new_board, lsz);
            if isempty(new_board)
                % found an invalid board
                invalid_board = true;
                break;
            end
            disp(lsz);
            print_board(new_board, true);
        end
        if invalid_board
            disp(['Eliminated board ' num2str(bi)])
            continue
        end
        solved = all(sum(new_board) == 1);
        if solved
            b = new_board;
            disp("Solved!")
            board = b;
            break;
        end
        if all(new_board(:) == b(:))
            if loop_search_size == max_search_size
                if false
                    numopts = sum(b);
                    numopts(numopts == 1) = N+1;
                    [nopts, celli] = min(numopts);
                    new_board(:,celli) = false;
                    for opti = find(b(:,celli)')
                        new_board(opti,celli) = true;
                        next_round_boards{end+1} = new_board;
                        new_board(opti,celli) = false;
                    end
                    disp(['adding ' num2str(nopts) ' possible boards in cell ' num2str(celli)]);
                    % print_board(b)
                    loop_search_size = 1;
                    no_diff = false;
                else
                    disp("no more changes");
                    disp(sum(sum(board) > 1));
                    break;
                end
            else
                next_round_boards{end+1} = new_board;
            end
        else
            next_round_boards{end+1} = new_board;
            no_diff = false;
        end
    end

    if solved
        break;
    end

    if no_diff
        loop_search_size = loop_search_size + 1;
    end

    if isempty(next_round_boards)
        disp("Couldn't solve");
        break;
    end
    all_possible_boards = next_round_boards;
    next_round_boards = {};
    iter = iter + 1;
end
elt = toc;

disp(['Finished in ' num2str(elt) ' sec']);
disp(['difficulty: ' num2str(loop_search_size)])
print_board(board);

% board = searchForLoops(board, 2);
% print_board(board);