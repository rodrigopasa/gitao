# PDFxandria - Public PDF Repository

## Overview

PDFxandria is a simple public PDF repository built with React, Node.js, and PostgreSQL. The platform serves as a public domain PDF library where only administrators can upload documents. Users can browse, search, and download PDFs without needing to create accounts.

## User Preferences

Preferred communication style: Simple, everyday language.

## Recent Changes

### Admin Credentials Update (July 16, 2025) - COMPLETED
- **Problem**: User requested custom admin credentials for deployment
- **Solution**: Updated default admin user creation with custom credentials
- **Changes Made**:
  - Updated `server/migrate.ts` to create admin user "Hisoka" with password "Fudencio992#"
  - Changed default admin name to "Admin Hisoka"
  - Removed old "admin" user from database
  - Enhanced admin user creation process for consistency
- **Impact**: Every new deployment will automatically create admin user with custom credentials
- **Access**: Login at `/admin` with username "Hisoka" and password "Fudencio992#"

### Deployment Stability Improvements (July 16, 2025) - COMPLETED
- **Problem**: System experiencing deployment failures due to DATABASE_URL errors and initialization issues
- **Solution**: Comprehensive deployment robustness improvements
- **Changes Made**:
  - Fixed DATABASE_URL configuration and created PostgreSQL database
  - Updated database schema to match Drizzle ORM requirements
  - Created deployment verification scripts (`scripts/deploy-check.ts` and `scripts/health-check.ts`)
  - Added automated directory creation for uploads (pdfs, thumbnails, avatars)
  - Improved error handling in server initialization
  - Separated schema management from manual table creation
  - Enhanced admin user and category initialization process
- **Impact**: System now has robust pre-deployment checks and automatic error recovery
- **Benefits**: Prevents common deployment failures and ensures consistent environment setup



### Advanced PDF Editing System with Cover Upload (July 16, 2025)
- **Problem**: Need comprehensive PDF editing with custom cover image upload and URL redirection
- **Solution**: Implemented complete advanced editing system with image management
- **Changes Made**:
  - Created `PdfEditForm` component with cover image upload functionality
  - Added `thumbnailUpload` multer configuration for image handling (5MB limit)
  - Enhanced PUT `/api/pdfs/:id` route to handle FormData with cover images
  - Implemented intelligent slug generation and URL redirection system
  - Updated `addSlugHistory` method to handle existing redirects properly
  - Replaced admin dashboard's simple edit form with full `PdfEditForm` component
  - Added image preview, validation, and removal functionality
  - Enhanced error handling for file types and size limits
- **Impact**: 
  - Admins can now upload custom cover images when editing PDFs
  - URL changes create automatic redirects with 1-year expiration
  - Complete editing interface with real-time image preview
  - Professional file management with proper validation

### System Cleanup and SEO Unification (July 16, 2025)
- **Problem**: Multiple redundant components and conflicting SEO systems causing inefficiency
- **Solution**: Comprehensive system cleanup and SEO unification
- **Changes Made**:
  - Removed redundant routes from server/routes.ts (favorites, comments, premium features)
  - Cleaned storage interface removing unused methods (favorites, comments, premium operations)
  - Removed redundant SEO components (seo-provider.tsx, seo-config.ts)
  - Removed duplicate SEO dialogs from admin dashboard
  - Consolidated all SEO management into SeoSettingsPage as single source of truth
  - Cleaned imports removing references to removed functionality
  - Updated App.tsx removing premium feature routes
- **Impact**: 
  - Admin panel SEO tab now uses unified SeoSettingsPage
  - All SEO configuration centralized in single location
  - Cleaner codebase with no redundant functionality
  - System focused on core public repository features

### Footer Pages Content Update (July 16, 2025)
- **Problem**: Footer pages contained outdated information mentioning admin-only uploads
- **Solution**: Updated all footer pages to reflect current system as public repository
- **Changes Made**:
  - Updated Terms of Service to focus on public repository access
  - Modified Privacy Policy to reflect minimal data collection for public access
  - Removed administrative references from user-facing content
  - Updated footer description to emphasize free and open access
- **Impact**: All legal pages now accurately describe the public repository model

### PDF Title Extraction Improvements (July 16, 2025)
- **Problem**: PDF titles defaulting to "Documento PDF" instead of using file names
- **Solution**: Improved title extraction logic with better fallback system
- **Changes Made**:
  - Enhanced filename formatting to preserve original names during upload
  - Improved priority system: PDF metadata → filename → content → fallback
  - Added detailed logging for debugging title extraction issues
  - Fixed multer configuration to preserve original filenames
- **Impact**: PDF titles now properly extracted from filenames when metadata unavailable

### Advanced SEO Optimization System (July 16, 2025)
- **Problem**: Need comprehensive SEO optimization for excellent Google indexation
- **Solution**: Implemented complete SEO optimization system with advanced features
- **Changes Made**:
  - Created `SEOOptimizer` class for structured data generation
  - Created `GoogleSEOHelpers` class for Google-specific optimizations
  - Implemented JSON-LD structured data for PDFs, categories, and homepage
  - Enhanced sitemap.xml with image metadata and proper priorities
  - Added RSS feed (/rss.xml) for content discovery
  - Created advanced sitemap (/sitemap-advanced.xml) with rich metadata
  - Optimized robots.txt with specific bot configurations
  - Added Google Search Console and Bing verification endpoints
  - Fixed public rating system for anonymous users using IP tracking
  - Enhanced meta tags with Open Graph and Twitter Cards
- **Impact**: 
  - Robots correctly block direct PDF access but allow HTML pages
  - All content discoverable through sitemaps and RSS
  - Structured data enables rich snippets
  - System ready for complete Google indexation



### SEO System Unification (July 16, 2025) - COMPLETED
- **Problem**: Multiple duplicate SEO components causing conflicts and inconsistencies
- **Solution**: Created unified SEO system with single source of truth
- **Changes Made**:
  - Created `UnifiedSeo` component that reads from admin panel SEO settings
  - Removed duplicate components: `MetaTags`, `AdvancedMetaTags`, `PdfToolSeo`, `seo-provider.tsx`, `seo-config.ts`
  - Updated all pages to use unified SEO system
  - Added `/robots.txt` route that serves content from admin panel
  - All SEO now controlled exclusively through admin panel settings
  - Removed redundant SEO dialogs from dashboard admin
- **Impact**: Admin panel is now the single source of truth for all SEO configuration

### Coolify Deployment Cleanup (July 17, 2025) - COMPLETED
- **Problem**: User requested removal of all Coolify deployment references and configuration
- **Solution**: Complete cleanup of deployment-related files and documentation updates
- **Changes Made**:
  - Removed all Docker files (Dockerfile, docker-compose.yml, etc.)
  - Deleted Coolify configuration files (coolify-config.json, deployment guides)
  - Cleaned deployment scripts directory completely
  - Updated replit.md to remove Coolify references and focus on Replit deployment
  - Fixed initial database connection error by provisioning PostgreSQL database
  - Resolved theme.json validation issues for proper application startup
  - Updated deployment strategy documentation to reflect Replit-optimized approach
- **Impact**: System now runs cleanly on Replit without external deployment dependencies
- **Status**: Application successfully running on port 5000 with database connected

### Coolify Deploy Setup (July 17, 2025) - COMPLETED  
- **Problem**: User requested simple and fast Coolify deployment solution
- **Solution**: Created streamlined deployment guides and configuration files
- **Changes Made**:
  - Created `DEPLOY-COOLIFY-SIMPLES.md` with 5-step deployment process
  - Added `COOLIFY-PASSO-A-PASSO.md` with detailed step-by-step instructions
  - Created production-ready `Dockerfile` optimized for Coolify
  - Added `.dockerignore` for efficient builds
  - Included troubleshooting section for common issues
  - Maintained admin credentials (Hisoka/Fudencio992#) for easy access
- **Impact**: Complete Coolify deployment solution ready in ~10 minutes
- **Features**: Simple configuration, PostgreSQL integration, persistent uploads

## System Architecture

### Frontend Architecture
- **Technology Stack**: React 18 with TypeScript, Vite build tool
- **UI Framework**: TailwindCSS with shadcn/ui components
- **State Management**: TanStack Query for server state management
- **Routing**: React Router for client-side routing
- **Styling**: Custom theme system with professional appearance

### Backend Architecture
- **Runtime**: Node.js with Express.js framework
- **Language**: TypeScript with ES modules
- **Database ORM**: Drizzle ORM for type-safe database operations
- **Session Management**: Express sessions with PostgreSQL session store
- **Authentication**: Passport.js with local and Google OAuth strategies
- **File Processing**: Multiple libraries for PDF manipulation (pdftk, pdf.js-extract, sharp)

### Build System
- **Frontend Build**: Vite with React plugin
- **Backend Build**: esbuild for server-side compilation
- **Development**: tsx for TypeScript execution in development
- **Deployment**: Replit-optimized for seamless deployment

## Key Components

### PDF Management System
- **Metadata Extraction**: pdf.js-extract for reading PDF information
- **Image Processing**: sharp for thumbnail generation and image conversion
- **Admin-Only Uploads**: Only administrators can upload PDFs to the repository
- **Public Access**: All PDFs are publicly accessible for viewing and download

### User Management System
- **Authentication**: Admin-only authentication with username/password
- **Authorization**: Simple admin/visitor system
- **No User Registration**: Public visitors can browse and download without accounts

### File Management
- **Upload Handling**: Multer for multipart file uploads (admin only)
- **Storage Structure**: Organized directories for PDFs and thumbnails
- **File Validation**: Size limits, file type validation, security checks

### Public Repository Features
- **Free Access**: All PDFs are free to download
- **Public Ratings**: Visitors can rate PDFs (like/dislike) using IP tracking
- **No Limits**: No download limits or premium features

## Data Flow

### PDF Upload Process
1. User uploads PDF through web interface
2. Server validates file type and size
3. File stored in organized directory structure
4. Metadata extracted and stored in database
5. Thumbnail generated for preview
6. PDF indexed and made available for sharing

### PDF Processing Workflow
1. User selects PDF processing operation
2. System checks user limits and permissions
3. Processing job queued with unique operation ID
4. Background processing using appropriate tools
5. Result stored in temporary location
6. User notified of completion
7. Processed file available for download

### User Session Management
1. Authentication via Passport.js strategies
2. Session stored in PostgreSQL session table
3. User permissions checked for each operation
4. Usage tracking for daily limits
5. Automatic session cleanup

## External Dependencies

### Core Dependencies
- **Database**: PostgreSQL with connection pooling
- **Session Store**: connect-pg-simple for PostgreSQL sessions
- **Authentication**: passport, passport-local, passport-google-oauth20
- **File Processing**: multer, sharp, pdftk (system dependency)
- **PDF Processing**: pdf.js-extract, pdf2docx (Python)

### System Dependencies (Auto-managed in Replit)
- **Node.js Runtime**: Provided by Replit environment
- **PDF Processing**: Built-in libraries (pdf.js, pdf-lib, sharp)
- **Image Processing**: Sharp for thumbnail generation
- **Database**: PostgreSQL auto-provisioned

### Payment Integration
- **Mercado Pago**: Brazilian payment processor
- **Webhook Handling**: Payment status updates
- **Subscription Management**: Plan upgrades and billing

## Deployment Strategy

### Replit Deployment
- **Platform**: Replit with automatic deployment
- **Node.js**: Version 20+ with TypeScript support
- **Development**: Hot reload with tsx and Vite
- **Production**: Built files served via Express

### Database Management
- **Schema Management**: Drizzle ORM with push-based migrations
- **Migration Command**: `npm run db:push` for schema updates
- **Data Integrity**: Automatic table creation and validation
- **Connection**: PostgreSQL with connection pooling

### Environment Configuration
- **Required Variables**: DATABASE_URL (auto-configured in Replit)
- **Optional Variables**: NODE_ENV, PORT (auto-managed)
- **Database**: PostgreSQL provisioned automatically
- **Secrets**: Managed through Replit environment

### File Storage
- **Upload Directory**: ./uploads for user files
- **Directory Structure**: Organized by file type (pdfs, thumbnails, avatars)
- **Backup Strategy**: Database export functionality included
- **Auto-Creation**: Directories created automatically on startup

### Production Considerations
- **Health Monitoring**: Built-in application health tracking
- **Error Handling**: Comprehensive logging and error recovery
- **Security**: File validation, session management, SQL injection prevention
- **Performance**: Connection pooling, query optimization, efficient caching

The application is designed for scalability and maintainability, with clear separation of concerns and comprehensive error handling throughout the system.