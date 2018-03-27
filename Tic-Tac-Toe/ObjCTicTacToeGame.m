//
//  ObjCTicTacToeGame.m
//  Tic-Tac-Toe
//
//  Created by CSSE Department on 3/26/18.
//  Copyright © 2018 Rose-Hulman. All rights reserved.
//

#import "ObjCTicTacToeGame.h"

@implementation ObjCTicTacToeGame

- (id) init {
    self = [super init];
    if (self) {
        self.gameState = GameStateXTurn;
        for (int i = 0; i <9; ++i) {
            gameBoard[i] = MarkTypeNone;
        }
    }
    return self;
}

- (NSString*) getGameStateString {
    switch (self.gameState) {
        case GameStateXTurn:
            return @"X's Turn";
        case GameStateOTurn:
            return @"O's Turn";
        case GameStateXWon:
            return @"X Won!";
        case GameStateOWon:
            return @"O Won!";
        case GameStateTie:
            return @"Tie Game";
            
    }
}

- (NSString*) getMarkTypeString:(MarkType) mark {
    switch  (mark) {
        case MarkTypeNone:
            return @"-";
        case MarkTypeO:
            return @"O";
        case MarkTypeX:
            return @"X";
    }
}

- (MarkType) getGameBoardMarkAtIndex:(NSInteger) index {
    return gameBoard[index];
}

- (void) pressedSquare:(NSInteger) index {
    if (gameBoard[index] != MarkTypeNone) {
        return;
    }
    if (self.gameState == GameStateXTurn) {
        gameBoard[index] = MarkTypeX;
        self.gameState = GameStateOTurn;
        [self checkForGameOver];
    } else if (self.gameState == GameStateOTurn) {
        gameBoard[index] = MarkTypeO;
        self.gameState = GameStateXTurn;
        [self checkForGameOver];
    }
}

- (NSString*) getGameString {
    NSMutableString* gameBoardString = [[NSMutableString alloc] init];
    for (int i = 0; i < 9; ++i) {
        [gameBoardString appendString:[self getMarkTypeString:gameBoard[i]]];
    }
    return gameBoardString;
}

- (NSString*) getStringForLocation1: (int) index1
                          location2: (int) index2
                          location3: (int) index3 {
    return [NSString stringWithFormat:@"%@%@%@",
            [self getMarkTypeString:gameBoard[index1]],
            [self getMarkTypeString:gameBoard[index2]],
            [self getMarkTypeString:gameBoard[index3]]];
}

- (NSString*) description {
    return [NSString stringWithFormat:@"%@ Board:%@", [self getGameStateString], [self getGameString]];
}

- (void) checkForGameOver {
    if (![[self getGameString] containsString:@"-"]) {
        self.gameState = GameStateTie;
    }
    NSMutableArray* linesof3 = [[NSMutableArray alloc] initWithCapacity:8];
    [linesof3 addObject:[self getStringForLocation1:0 location2:1 location3:2]];
    [linesof3 addObject:[self getStringForLocation1:3 location2:4 location3:5]];
    [linesof3 addObject:[self getStringForLocation1:6 location2:7 location3:8]];
    
    [linesof3 addObject:[self getStringForLocation1:0 location2:3 location3:6]];
    [linesof3 addObject:[self getStringForLocation1:1 location2:4 location3:7]];
    [linesof3 addObject:[self getStringForLocation1:2 location2:5 location3:8]];
    
    [linesof3 addObject:[self getStringForLocation1:0 location2:4 location3:8]];
    [linesof3 addObject:[self getStringForLocation1:2 location2:4 location3:6]];
    
    for (NSString* lineof3 in linesof3) {
        if ([lineof3 isEqualToString:@"XXX"]) {
            self.gameState = GameStateXWon;
        } else if ([lineof3 isEqualToString: @"OOO"]) {
            self.gameState = GameStateOWon;
        }
    }
}

@end
