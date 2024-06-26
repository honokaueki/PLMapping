function flip_rows(data)
    for (i, row) in enumerate(eachrow(data))
        if i % 2 == 0
            data[i, :] = reverse(row)
        end
    end
    return data
end