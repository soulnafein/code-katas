module Game exposing (score, splitInFrames)

import Frame exposing (Frame)


score : List Int -> Int
score rolls =
    splitInFrames rolls [] 1
        |> calculateTotalScore 0


splitInFrames : List Int -> Frame -> Int -> List Frame
splitInFrames rolls currentFrame index =
    case rolls of
        roll :: otherRolls ->
            let
                updatedFrame =
                    currentFrame ++ [ roll ]
            in
                if Frame.complete updatedFrame index then
                    [ updatedFrame ] ++ (splitInFrames otherRolls [] (index + 1))
                else
                    splitInFrames otherRolls updatedFrame index

        [] ->
            []


calculateTotalScore : Int -> List Frame -> Int
calculateTotalScore totalScore frames =
    case frames of
        currentFrame :: otherFrames ->
            let
                frameScore =
                    Frame.score currentFrame otherFrames
            in
                calculateTotalScore (totalScore + frameScore) otherFrames

        [] ->
            totalScore
