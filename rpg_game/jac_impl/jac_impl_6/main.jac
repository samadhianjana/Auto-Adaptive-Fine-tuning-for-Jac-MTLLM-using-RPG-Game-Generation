"""This is the Object-Spatial Implementation of the RPG Game"""

# This game is built using the pygame module which is imported here
import pygame;
import random;
import time;
import os;
import from dotenv {load_dotenv}


# Importing Jac codebase
include sprites;
include game_obj;
include settings.config;
include settings.map;
include utils.level_manager;


'''The walker that initiates the game and runs an instance of the game'''
walker game {
    has g: Game = None , last_level_id: str = '1_1000' , current_level: int = 1 , fwd_dir: bool = True , manager: LevelManager = LevelManager();

    can start_game with `root entry;
}


edge play {
    has level_id: str = '1_1000';
}


'''Start screen node which operate as the virtual root node'''
node start_screen {
    has game_started: bool = False;

    can intro_screen with game entry;
    can exit_game with game exit;
}


'''Level node which (should) have unique (ai generated) attributes'''
node level {
    has game_level: int = 1 , level_id: str = '1_1000' , played: bool = False , level_config: Map = Map() , level_time: float = 500000;

    can run_game with game entry;
    can exit_game with game exit;
}

# node level_generator {
#     has max_levels: int = 2;
#     has generated_levels: list[Level] = [];
#     has generated_maps: list[Map_tiles] = [];
#     has prompts: list[str] = [];
#     has level_manager: LevelManager = LevelManager();

#     can generate_dataset() {
#         let difficulty = 1;
#         let last_levels = [];
#         let i = 0;

#         while i < max_levels {
#             let prompt = "Generate an RPG game level with difficulty " + difficulty.to_str();
#             prompts.append(prompt);

#             # Use the level_manager instance
#             let lvl = level_manager.create_next_level(last_levels, difficulty);
#             let mp = level_manager.create_next_map(lvl);

#             generated_levels.append(lvl);
#             generated_maps.append(mp);

#             last_levels = generated_levels;
#             difficulty += 1;

#             print("Generated level ", generated_levels.size());
#             i += 1;
#         }

#         print("Dataset generation complete! Total levels: ", generated_levels.size());
#     }
# }
#     can export_dataset() {
#         for i in range(0, generated_levels.size()) {
#             let level = generated_levels[i];
#             let map = generated_maps[i];
#             let prompt = prompts[i];

#             # Use the level_manager instance
#             let map_str = level_manager.get_map(map);

#             print("----- Level ", i+1, " -----");
#             print("Prompt: ", prompt);
#             print("Level metadata: ", level);
#             print("Map: ", map_str);
#         }
#     }
# }


'''Run the game'''
with entry {
    load_dotenv();
    root spawn game();
    # Automate the level generation and dataset creation
    # root spawn level_generator();
    # root generate_dataset();

    # root spawn level_generator() as lg;
    # lg.generate_dataset();
}
