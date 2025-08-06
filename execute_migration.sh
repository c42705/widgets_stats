#!/bin/bash

# BookStack to WikiJS Migration Execution Script
# This script downloads and executes the migration from GitHub

echo "🚀 BookStack to WikiJS Migration Execution"
echo "=========================================="

# Set PostgreSQL password
export PGPASSWORD="xwyv1dFm9i0yL"

echo "📥 Downloading migration script from GitHub..."

# Download migration script from GitHub
curl -s -L https://raw.githubusercontent.com/c42705/widgets_stats/master/migration.sql -o /tmp/migration.sql

if [ $? -eq 0 ]; then
    echo "✅ Migration script downloaded successfully"
else
    echo "❌ Failed to download migration script"
    exit 1
fi

echo "🔍 Testing database connection..."

# Test database connection
psql -h localhost -U wikijs_user -d wiki -c "SELECT COUNT(*) FROM pages;" > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "✅ Database connection successful"
else
    echo "❌ Database connection failed"
    echo "Please check:"
    echo "  - PostgreSQL is running"
    echo "  - Database credentials are correct"
    echo "  - Database 'wiki' exists"
    exit 1
fi

echo "📊 Current pages count:"
psql -h localhost -U wikijs_user -d wiki -c "SELECT COUNT(*) as current_pages FROM pages;"

echo ""
echo "🚀 Executing migration..."

# Execute migration
psql -h localhost -U wikijs_user -d wiki -f /tmp/migration.sql

if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 Migration completed successfully!"
    
    echo ""
    echo "📊 Verification Results:"
    
    # Verify migration
    echo "Total pages after migration:"
    psql -h localhost -U wikijs_user -d wiki -c "SELECT COUNT(*) as total_pages FROM pages;"
    
    echo ""
    echo "Migrated pages (should be 11):"
    psql -h localhost -U wikijs_user -d wiki -c "SELECT COUNT(*) as migrated_pages FROM pages WHERE hash LIKE 'hash_%';"
    
    echo ""
    echo "📋 Migrated pages list:"
    psql -h localhost -U wikijs_user -d wiki -c "SELECT path, title FROM pages WHERE hash LIKE 'hash_%' ORDER BY path;"
    
    echo ""
    echo "🌐 Test these URLs in your browser:"
    echo "  - http://prox.stargety.in/la-incubadora-20"
    echo "  - http://prox.stargety.in/accounting-policies"
    echo "  - http://prox.stargety.in/people-and-culture"
    echo "  - http://prox.stargety.in/tech"
    echo "  - http://prox.stargety.in/basics"
    echo "  - http://prox.stargety.in/operations"
    
    echo ""
    echo "✅ Migration completed successfully!"
    echo "🎯 11 BookStack pages have been migrated to WikiJS"
    
else
    echo ""
    echo "❌ Migration failed"
    echo "Please check the error messages above"
    exit 1
fi

# Clean up
rm -f /tmp/migration.sql

echo ""
echo "🧹 Cleanup completed"
echo "🎉 BookStack to WikiJS migration finished!"
