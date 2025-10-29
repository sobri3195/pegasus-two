#!/bin/sh
# Test script for Pegasus Two v0.2 new features

echo "Testing Pegasus Two v0.2 New Features"
echo "======================================"
echo ""

# Test 1: Help displays new features
echo "Test 1: Checking help command..."
./pegasus-two help | grep -q "info \[tool\]" && echo "✓ Help includes info command" || echo "✗ Help missing info command"

# Test 2: Version check
echo "Test 2: Checking version..."
./pegasus-two help | grep -q "v0.2" && echo "✓ Version updated to 0.2" || echo "✗ Version not updated"

# Test 3: Syntax check
echo "Test 3: Checking syntax..."
sh -n ./pegasus-two && echo "✓ No syntax errors" || echo "✗ Syntax errors found"

# Test 4: Check new commands in help
echo "Test 4: Checking new commands presence..."
commands="stats history installed verify export import favorite dry-run backup config"
for cmd in $commands; do
  ./pegasus-two help | grep -q "$cmd" && echo "  ✓ $cmd command documented" || echo "  ✗ $cmd missing"
done

# Test 5: Check wget fix
echo "Test 5: Checking wget flag fix..."
grep -q "wget.*-O ~" ./pegasus-two && echo "✓ wget uses correct -O flag" || echo "✗ wget flag not fixed"
grep -q "wget.*-o ~" ./pegasus-two && echo "✗ wget still has incorrect -o flag" || echo "✓ No incorrect wget -o flags"

# Test 6: Check for typo fix
echo "Test 6: Checking typo fix..."
grep -q "hakcing" ./pegasus-two && echo "✗ Typo 'hakcing' still present" || echo "✓ Typo fixed"

# Test 7: Check while loop fix
echo "Test 7: Checking while loop syntax..."
grep -q "while \[ true \]" ./pegasus-two && echo "✗ while [ true ] still present" || echo "✓ while loop fixed"

# Test 8: Documentation check
echo "Test 8: Checking documentation..."
[ -f CHANGELOG.md ] && echo "✓ CHANGELOG.md created" || echo "✗ CHANGELOG.md missing"
[ -f FEATURES_SUMMARY.md ] && echo "✓ FEATURES_SUMMARY.md created" || echo "✗ FEATURES_SUMMARY.md missing"

echo ""
echo "======================================"
echo "Test suite completed!"
