function flip_rows(data, flip=2)
    for (i, row) in enumerate(eachrow(data))
        if i % flip == 0
            data[i, :] = reverse(row)
        end
    end
    return data
end