function print_board(board, varargin)
    if isempty(varargin)
        verbose = false;
    else
        verbose = varargin{1};
    end

    N = size(board,1);

    locked_in = sum(board) == 1;
    entries = max(double(board) .* (1:N)');
    entry_str = repelem([" "], 1, N*N);
    for li = find(locked_in)
        if verbose
            entry_str(li) = "    " + num2str(entries(li)) + "    ";
        else
            entry_str(li) = " " + num2str(entries(li)) + " ";
        end
    end
    for nli = find(~locked_in)
        if verbose
            str = '123456789';
            str(~board(:,nli)) = ' ';
            entry_str(nli) = str;
            % entry_str(nli) = num2str(find(board(:,nli)))';
        else
            entry_str(nli) = "[" + num2str(sum(board(:,nli))) + "]";
        end
    end

    es = reshape(entry_str, [N N]);
    for ni=1:N
        disp(es(ni,:));
    end
end