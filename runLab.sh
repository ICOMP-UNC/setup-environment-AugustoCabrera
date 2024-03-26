!/bin/bash -e

echo "🔨🔨🔨🔨🔨🔨🔨🔨🔨🔨🔨🔨🔨🔨🔨🔨🔨🔨"

if [ -d "./build" ]; then
    echo "-> 🚮 Removing old build directory..."
    rm -rf ./build/*
else
    echo "-> 👷 Creating build directory..."
    mkdir build
fi

echo "🔧🔧🔧🔧🔧🔧🔧🔧🔧🔧🔧🔧🔧🔧🔧🔧🔧🔧"
echo "-> 💻 Compiling project and 📝 building..."
cd build && cmake -GNinja .. && ninja

echo ""
echo "-> 🏃 Running project..."
echo ""
./FirstProjectInCMake

