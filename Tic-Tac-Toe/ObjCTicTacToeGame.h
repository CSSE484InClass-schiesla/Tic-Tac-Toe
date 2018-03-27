//
//  ObjCTicTacToeGame.h
//  Tic-Tac-Toe
//
//  Created by CSSE Department on 3/26/18.
//  Copyright © 2018 Rose-Hulman. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, GameState) {
    GameStateXTurn,
    GameStateOTurn,
    GameStateXWon,
    GameStateOWon,
    GameStateTie
};

typedef NS_ENUM(NSInteger, MarkType) {
    MarkTypeNone,
    MarkTypeX,
    MarkTypeO
};

@interface ObjCTicTacToeGame : NSObject {
    MarkType gameBoard[9];
}

- (NSString*) getGameStateString;
- (NSString*) getMarkTypeString:(MarkType) mark;
- (void) pressedSquare:(NSInteger) index;
- (MarkType) getGameBoardMarkAtIndex:(NSInteger) index;

@property (nonatomic) GameState gameState;

@end
