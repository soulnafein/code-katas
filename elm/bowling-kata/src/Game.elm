module Game exposing (score, splitInFrames)

import Frame exposing (Frame)


score : List Int -> Int
score rolls =
    splitInFrames rolls Frame.create 1
        |> calculateTotalScore 0


splitInFrames : List Int -> Frame -> Int -> List Frame
splitInFrames rolls frame index =
    case rolls of
        roll :: otherRolls ->
            processSplit roll otherRolls frame index

        [] ->
            []


processSplit : Int -> List Int -> Frame -> Int -> List Frame
processSplit roll otherRolls frame index =
    let
        updatedFrame =
            Frame.addRoll roll frame

        newIndex =
            index + 1

        newFrame =
            if newIndex == 10 then
                Frame.createTenth
            else
                Frame.create
    in
        if Frame.complete updatedFrame then
            updatedFrame :: (splitInFrames otherRolls newFrame newIndex)
        else
            splitInFrames otherRolls updatedFrame index


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
