function print_board(board)
    N = size(board,1);

    locked_in = sum(board) == 1;
    entries = max(double(board) .* (1:N)');
    entry_str = repelem([" "], 1, N*N);
    for li = find(locked_in)
        entry_str(li) = " " + num2str(entries(li)) + " ";
    end
    for nli = find(~locked_in)
        entry_str(nli) = "[" + num2str(sum(board(:,nli))) + "]";
    end

    es = reshape(entry_str, [N N]);
    for ni=1:N
        disp(es(ni,:));
    end
end