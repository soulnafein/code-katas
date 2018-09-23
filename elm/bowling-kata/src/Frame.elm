module Frame exposing (Frame, score, complete, addRoll, create, createTenth)


type alias Frame =
    { rolls : List Int
    , frameType : FrameType
    }


type FrameType
    = Standard
    | Tenth


create : Frame
create =
    { rolls = []
    , frameType = Standard
    }


createTenth : Frame
createTenth =
    { create | frameType = Tenth }


score : Frame -> List Frame -> Int
score frame otherFrames =
    (sumOfRolls frame) + (bonus frame otherFrames)


sumOfRolls : Frame -> Int
sumOfRolls frame =
    List.sum frame.rolls


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
        |> List.map .rolls
        |> List.concat
        |> List.take num
        |> List.sum


complete : Frame -> Bool
complete frame =
    List.length frame.rolls == (frameLength frame)


frameLength : Frame -> Int
frameLength frame =
    case frame.frameType of
        Tenth ->
            tenthFrameLength frame

        _ ->
            normalFrameLength frame


normalFrameLength : Frame -> Int
normalFrameLength frame =
    case scoreType frame of
        Strike ->
            1

        _ ->
            2


tenthFrameLength : Frame -> Int
tenthFrameLength frame =
    case scoreType frame of
        Strike ->
            3

        Spare ->
            3

        Normal ->
            2


scoreType : Frame -> ScoreType
scoreType frame =
    if (firstRoll frame) == Just 10 then
        Strike
    else if (sumOfRolls frame) >= 10 then
        Spare
    else
        Normal


addRoll : Int -> Frame -> Frame
addRoll roll frame =
    { frame | rolls = frame.rolls ++ [ roll ] }


firstRoll : Frame -> Maybe Int
firstRoll frame =
    List.head frame.rolls


type ScoreType
    = Normal
    | Spare
    | Strike
