module Frame exposing (Frame, score, complete)


type alias Frame =
    List Int


score : Frame -> List Frame -> Int
score frame otherFrames =
    (sumOfRolls frame) + (bonus frame otherFrames)


sumOfRolls : Frame -> Int
sumOfRolls frame =
    List.sum frame


bonus : Frame -> List Frame -> Int
bonus frame otherFrames =
    if isStrike frame then
        nextRolls 2 otherFrames
    else if isSpare frame then
        nextRolls 1 otherFrames
    else
        0


nextRolls : Int -> List Frame -> Int
nextRolls num frames =
    frames
        |> List.concat
        |> List.take num
        |> List.sum


complete : Frame -> Int -> Bool
complete frame index =
    case index of
        10 ->
            lastFrameComplete frame

        _ ->
            normalFrameComplete frame


normalFrameComplete : Frame -> Bool
normalFrameComplete frame =
    let
        frameLength =
            if isStrike frame then
                1
            else
                2
    in
        List.length frame == frameLength


lastFrameComplete : Frame -> Bool
lastFrameComplete frame =
    let
        frameLength =
            if (isStrike frame) || (isSpare frame) then
                3
            else
                2
    in
        List.length frame == frameLength


isStrike : Frame -> Bool
isStrike frame =
    case frame of
        10 :: _ ->
            True

        _ ->
            False


isSpare : Frame -> Bool
isSpare frame =
    (sumOfRolls frame) >= 10
