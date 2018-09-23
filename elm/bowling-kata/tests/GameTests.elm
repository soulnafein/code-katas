module GameTests exposing (suite, allTests)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)
import Game exposing (score)
import List exposing (repeat)


examples =
    [ ( "Sum all pins"
      , List.repeat 20 1
      , 20
      )
    , ( "Adds the next roll to a spare frame score"
      , [ 6, 4, 3 ] ++ (repeat 17 0)
      , 16
      )
    , ( "Adds the next two rolls to a strike frame score"
      , [ 10, 4, 1 ] ++ (repeat 17 0)
      , 20
      )
    , ( "Spare followed by a strike"
      , [ 4, 6, 10, 4, 3 ] ++ (repeat 14 0)
      , 44
      )
    , ( "Strike followed by a strike"
      , [ 10, 10, 4, 3 ] ++ (repeat 16 0)
      , 48
      )
    , ( "Lots of spares"
      , (repeat 21 5)
      , 150
      )
    , ( "Spare in last frame"
      , (repeat 18 0) ++ [ 2, 8, 10 ]
      , 20
      )
    , ( "Perfect game"
      , (repeat 12 10)
      , 300
      )
    ]


suite : Test
suite =
    describe "Game.score" allTests


allTests : List Test
allTests =
    (List.map testExample examples)
        ++ [ test "correct split"
                (\_ ->
                    let
                        input =
                            (List.repeat 18 0) ++ [ 2, 8, 10 ]

                        expectedResult =
                            [ [ 0, 0 ], [ 0, 0 ], [ 0, 0 ], [ 0, 0 ], [ 0, 0 ], [ 0, 0 ], [ 0, 0 ], [ 0, 0 ], [ 0, 0 ], [ 2, 8, 10 ] ]
                    in
                        Expect.equal expectedResult (Game.splitInFrames input [] 1)
                )
           ]


testExample ( testDescription, input, expectedOutput ) =
    test testDescription (\_ -> Expect.equal expectedOutput (score input))
