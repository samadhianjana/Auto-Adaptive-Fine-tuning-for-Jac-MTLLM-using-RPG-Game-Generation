# Auto-Adaptive-Fine-tuning-for-Jac-MTLLM-using-RPG-Game-Generation

## Setup Instructions

### Prerequisites
- Python 3.8 or higher
- Jac programming language
- pip (Python package installer)

### Installation

1. **Create a Virtual Environment**
   ```bash
   # Create a virtual environment
   python -m venv venv
   
   # Activate the virtual environment
   # On Windows
   venv\Scripts\activate
   
   # On macOS/Linux
   source venv/bin/activate
   ```

2. **Install Dependencies**
   ```bash
   pip install -r requirements.txt
   ```

3. **Environment Configuration**
   - Create a `.env` file in the root directory of the project
   - Add your Gemini API key to the `.env` file:
   ```
   GEMINI_API_KEY=your_gemini_api_key_here
   ```

### Running the Game

1. **Navigate to the Game Directory**
   ```bash
   cd rpg_game/jac_impl/jac_impl_6
   ```

2. **Execute the Game**
   ```bash
   jac run main.jac
   ```