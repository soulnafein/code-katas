module Game exposing (score)


score rolls =
    case rolls of
        [ _, _, _ ] ->
            List.sum rolls

        a :: b :: c :: other ->
            if a == 10 then
                a + b + c + (score (b :: c :: other))
            else if a + b == 10 then
                a + b + c + (score (c :: other))
            else
                a + b + (score (c :: other))

        other ->
            List.sum other
