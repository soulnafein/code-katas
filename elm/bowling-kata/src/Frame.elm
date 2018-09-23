module Frame exposing (Frame, score, complete, addRoll)


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
    nextRolls (bonusRolls frame) otherFrames


bonusRolls : Frame -> Int
bonusRolls frame =
    case scoreType frame of
        Strike ->
            2

        Spare ->
            1

        Normal ->
            0


nextRolls : Int -> List Frame -> Int
nextRolls num frames =
    frames
        |> List.concat
        |> List.take num
        |> List.sum


complete : Frame -> Int -> Bool
complete frame index =
    List.length frame == (frameLength frame index)


frameLength : Frame -> Int -> Int
frameLength frame index =
    case index of
        10 ->
            lastFrameLength frame

        _ ->
            normalFrameLength frame


normalFrameLength : Frame -> Int
normalFrameLength frame =
    case scoreType frame of
        Strike ->
            1

        _ ->
            2


lastFrameLength : Frame -> Int
lastFrameLength frame =
    case scoreType frame of
        Strike ->
            3

        Spare ->
            3

        Normal ->
            2


scoreType : Frame -> ScoreType
scoreType frame =
    case frame of
        10 :: _ ->
            Strike

        _ ->
            if (sumOfRolls frame) >= 10 then
                Spare
            else
                Normal


addRoll : Int -> Frame -> Frame
addRoll roll frame =
    frame ++ [ roll ]


type ScoreType
    = Normal
    | Spare
    | Strike
