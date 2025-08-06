-- BookStack to WikiJS Migration Script
BEGIN;

-- Create backup table
CREATE TABLE IF NOT EXISTS pages_backup_migration AS SELECT * FROM pages;
INSERT INTO pages_backup_migration SELECT * FROM pages;

-- Insert Books as Parent Pages
INSERT INTO pages (path, hash, title, description, "isPrivate", "isPublished", content, render, "contentType", "createdAt", "updatedAt", "editorKey", "localeCode", "authorId", "creatorId", toc, extra, "publishStartDate", "publishEndDate") VALUES 

('la-incubadora-20', 'hash_book_1', 'La incubadora 2.0', 'Programa de incubación para startups UX/UI', false, true, 
'<h1>La incubadora 2.0</h1><p>Programa de incubación para startups UX/UI enfocado en el desarrollo de productos digitales innovadores.</p><h2>Contenido del Programa</h2><ul><li>Metodologías de diseño UX/UI</li><li>Desarrollo de productos digitales</li><li>Estrategias de mercado</li><li>Financiamiento y escalabilidad</li></ul>', 
'<h1>La incubadora 2.0</h1><p>Programa de incubación para startups UX/UI enfocado en el desarrollo de productos digitales innovadores.</p><h2>Contenido del Programa</h2><ul><li>Metodologías de diseño UX/UI</li><li>Desarrollo de productos digitales</li><li>Estrategias de mercado</li><li>Financiamiento y escalabilidad</li></ul>', 
'markdown', NOW(), NOW(), 'markdown', 'en', 1, 1, '[]', '{"js":"","css":""}', NOW(), '2099-12-31 23:59:59+00'),

('accounting-policies', 'hash_book_2', 'Accounting Policies', 'Políticas y procedimientos contables', false, true,
'<h1>Accounting Policies</h1><p>Políticas y procedimientos contables de la organización para garantizar la transparencia y cumplimiento normativo.</p><h2>Áreas Cubiertas</h2><ul><li>Políticas de facturación</li><li>Procedimientos de gastos</li><li>Reportes financieros</li><li>Auditorías internas</li></ul>',
'<h1>Accounting Policies</h1><p>Políticas y procedimientos contables de la organización para garantizar la transparencia y cumplimiento normativo.</p><h2>Áreas Cubiertas</h2><ul><li>Políticas de facturación</li><li>Procedimientos de gastos</li><li>Reportes financieros</li><li>Auditorías internas</li></ul>',
'markdown', NOW(), NOW(), 'markdown', 'en', 1, 1, '[]', '{"js":"","css":""}', NOW(), '2099-12-31 23:59:59+00'),

('people-and-culture', 'hash_book_3', 'People and Culture', 'Políticas de recursos humanos', false, true,
'<h1>People and Culture</h1><p>Políticas de recursos humanos y cultura organizacional para crear un ambiente de trabajo positivo y productivo.</p><h2>Temas Principales</h2><ul><li>Políticas de contratación</li><li>Desarrollo profesional</li><li>Cultura organizacional</li><li>Beneficios y compensaciones</li></ul>',
'<h1>People and Culture</h1><p>Políticas de recursos humanos y cultura organizacional para crear un ambiente de trabajo positivo y productivo.</p><h2>Temas Principales</h2><ul><li>Políticas de contratación</li><li>Desarrollo profesional</li><li>Cultura organizacional</li><li>Beneficios y compensaciones</li></ul>',
'markdown', NOW(), NOW(), 'markdown', 'en', 1, 1, '[]', '{"js":"","css":""}', NOW(), '2099-12-31 23:59:59+00'),

('tech', 'hash_book_4', 'TECH', 'Documentación técnica', false, true,
'<h1>TECH</h1><p>Documentación técnica y procedimientos de desarrollo para el equipo de tecnología.</p><h2>Contenido Técnico</h2><ul><li>Estándares de desarrollo</li><li>Arquitectura de sistemas</li><li>Procedimientos de deployment</li><li>Documentación de APIs</li></ul>',
'<h1>TECH@/h1><p>Documentación técnica y procedimientos de desarrollo para el equipo de tecnología.</p><h2>Contenido Técnico</h2><ul><li>Estándares de desarrollo</li><li>Arquitectura de sistemas</li><li>Procedimientos de deployment</li><li>Documentación  de APIs</li></ul>',
'markdown', NOW(), NOW(), 'markdown', 'en', 1, 1, '[]', '{"js":"","css":""}', NOW(), '2099-12-31 23:59:59+00'),

('basics', 'hash_book_5', 'Basics', 'Información básica', false, true,
'<h1>Basics</h1><p>Información básica y fundamentos organizacionales para nuevos miembros del equipo.</p><h2>Fundamentos</h2><ul><li>Misión y visión</li><li>Valores organizacionales</li><li>Estructura organizacional</li><li>Procedimientos básicos</li></ul>',
'<h1>Basics</h1><p>Información básica y fundamentos organizacionales para nuevos miembros del equipo.</p><h2>Fundamentos</h2><ul><li>Misión y visión</li><li>Valores organizacionales</li><li>Estructura organizacional</li><li>Procedimientos básicos</li></ul>',
'markdown', NOW(), NOW(), 'markdown', 'en', 1, 1, '[]', '{"js":"","css":""}', NOW(), '2099-12-31 23:59:59+00'),

('operations', 'hash_book_6', 'Operations', 'Procedimientos operacionales', false, true,
'<h1>Operations</h1><p>Procedimientos operacionales y gestión diaria para mantener la eficiencia organizacional.</p><h2>Operaciones</h2><ul><li>Procedimientos diarios</li><li>Gestión de proyectos</li><li>Control de calidad</li><li>Métricas y KPIs</li></ul>',
['<h1>Operations</h1><p>Procedimientos operacionales y gestión diaria para mantener la eficiencia organizacional.</p><h2>Operaciones</h2><ul><li>Procedimientos diarios</li><li>Gestión de proyectos</li><li>Control de calidad</li><li>Métricas y KPIs</li></ul>',
'markdown', NOW(), NOW(), 'markdown', 'en', 1, 1, '[]', '{"js":"","css":""}', NOW(), '2099-12-31 23:59:59+00');

-- Insert Chapters as Sub-Pages
INSERT INTO pages (path, hash, title, description, "isPrivate", "isPublished", content, render, "contentType", "createdAt", "updatedAt", "editorKey", "localeCode", "authorId", "creatorId", toc, extra, "publishStartDate", "publishEndDate") VALUES 

('la-incubadora-20/temas-sugeridos', 'hash_chapter_1', 'Temas sugeridos', 'Temas sugeridos por la comunidad', false, true,
'<h1>Temas sugeridos</h1><p>Temas sugeridos por la comunidad para el programa de incubación UX/UI.</p><h2>Categorías de Temas</h2><ul><li>Diseño de experiencia de usuario</li><li>Interfaces de usuario modernas</li><li>Metodologías ágiles</li><li>Herramientas de prototipado</li></ul>',
'<h1>Temas sugeridos</h1><p>Temas sugeridos por la comunidad para el programa de incubación UX/UI.</p><h2>Categorías de Temas</h2><ul><li>Diseño de experiencia de usuario</li><li>Interfaces de usuario modernas</li><li>Metodologías ágiles</li><li>Herramientas de prototipado</li></ul>',
'markdown', NOW(), NOW(), 'markdown', 'en', 1, 1, '[]', '{"js":"","css":""}', NOW(), '2099-12-31 23:59:59+00'),

('people-and-culture/work-schedule', 'hash_chapter_2', 'Work Schedule', 'Políticas de horarios de trabajo', false, true,
'<h1>Work Schedule</h1><p>Políticas y procedimientos de horarios de trabajo para mantener un balance vida-trabajo saludable.</p><h2>Horarios</h2><ul><li>Horarios flexibles</li><li>Trabajo remoto</li><li>Días de descanso</li><li>Vacaciones y permisos</li></ul>',
'<h1>Work Schedule</h1><p>Políticas y procedimientos de horarios de trabajo para mantener un balance vida-trabajo saludable.</p><h2>Horarios</h2><ul><li>Horarios flexibles</li><li>Trabajo remoto</li><li>Días de descanso</li><li>Vacaciones y permisos</li></ul>',
'markdown', NOW(), NOW(), 'markdown', 'en', 1, 1, '[]', '{"js":"","css":""}', NOW(), '2099-12-31 23:59:59+00');

-- Insert Content Pages
INSERT INTO pages (path, hash, title, description, "isPrivate", "isPublished", content, render, "contentType", "createdAt", "updatedAt", "editorKey", "localeCode", "authorId", "creatorId", toc, extra, "publishStartDate", "publishEndDate") VALUES 

('la-incubadora-20/introduccion', 'hash_page_1', 'Introduccion', 'Introducción al programa', false, true,
'<h1>Introducción</h1><p>Bienvenido al programa de incubación UX/UI 2.0. Este programa está diseñado para acelerar el desarrollo de startups enfocadas en experiencia de usuario y diseño de interfaces.</p><h2>Objetivos del Programa</h2><ul><li>Desarrollar habilidades en UX/UI</li><li>Crear productos digitales innovadores</li><li>Establecer conexiones en la industria</li><li>Acceder a financiamiento</li></ul><h2>Metodología</h2><p>Utilizamos metodologías ágiles y design thinking para guiar el proceso de desarrollo de productos.</p>',
'<h1>Introducción</h1><p>Bienvenido al programa de incubación UX/UI 2.0. Este programa está diseñado para acelerar el desarrollo de startups enfocadas en experiencia de usuario y diseño de interfaces.</p><h2>Objetivos del Programa</h2><ul><li>Desarrollar habilidades en UX/UI</li><li>Crear productos digitales innovadores</li><li>Establecer conexiones en la industria</li><li>Acceder a financiamiento</li></ul><h2>Metodología</h2><p>Utilizamos metodologías ágiles y design thinking para guiar el proceso de desarrollo de productos.</p>',
'markdown', NOW(), NOW(), 'markdown', 'en', 1, 1, '[]', '{"js":"","css":""}', NOW(), '2099-12-31 23:59:59+00'),

('la-incubadora-20/guia-para-la-implementacion-del-programa-de-incubadora-uxui', 'hash_page_2', 'Guía para la implementación del programa de incubadora UX/UI', 'Guía completa de implementación', false, true,
'<h1>Guía para la implementación del programa de incubadora UX/UI</h1><p>Esta guía proporciona un marco completo para implementar exitosamente el programa de incubación UX/UI.</p><h2>Fases de Implementación</h2><h3>Fase 1: Preparación</h3><ul><li>Definición de objetivos</li><li>Selección de mentores</li><li>Preparación de recursos</li></ul><h3>Fase 2: Ejecución</h3><ul><li>Proceso de selección</li><li>Desarrollo del programa</li><li>Seguimiento y evaluación</li></ul><h3>Fase 3: Graduación</h3><ul><li>Presentación de proyectos</li><li>Conexión con inversores</li><li>Seguimiento post-programa</li></ul>',
'<h1>Guía para la implementación del programa de incubadora UX/UH�1><p>Esta guía proporciona un marco completo para implementar exitosamente el programa de incubación UX/UI.</p><h2>Fases de Implementación</h2><h3>Fase 1: Preparación</h3><ul><li>Definición de objetivos</li><li>Selección de mentores</li><li>Preparación de recursos</li></ul><h3>Fase 2: Ejecución</h3><ul><li>Proceso de selección</li><li>Desarrollo del programa</li><li>Seguimiento y evaluación</li></ul><h3>Fase 3: Graduación</h3><ul><li>Presentación de proyectos</li><li>Conexión con inversores</li><li>Seguimiento post-programa</li></ul>',
['markdown', NOW(), NOW(), 'markdown', 'en', 1, 1, '[]', '{"js":"","css":""}', NOW(), '2099-12-31 23:59:59+00'),

('la-incubadora-20/temas-sugeridos/temas-sugeridos-por-la-comunidad', 'hash_page_3', 'Temas sugeridos por la comunidad', 'Lista de temas de la comunidad', false, true,
'<h1>Temas sugeridos por la comunidad</h1><p>La comunidad UX/UI ha sugerido los siguientes temas para incluir en el programa de incubación.</p><h2>Temas Técnicos</h2><ul><li>Design Systems y componentes reutilizables</li><li>Accesibilidad en diseño digital</li><li>Micro-interacciones y animaciones</li><li>Diseño responsive y mobile-first</li></ul><h2>Temas de Negocio</h2><ul><li>Investigación de usuarios y mercado</li><li>Métricas de UX y analytics</li><li>Estrategias de monetización</li><li>Pitch y presentación de proyectos</li></ul><h2>Herramientas</h2><ul><li>Figma avanzado</li><li>Prototipado con Framer</li><li>Testing de usabilidad</li><li>Colaboración en equipos remotos</li></ul>',
'<h1>Temas sugeridos por la comunidad</h1><p>La comunidad UX/UI ha sugerido los siguientes temas para incluir en el programa de incubación.</p><h2>Temas Técnicos</h2><ul><li>Design Systems y componentes reutilizables</li><li>Accesibilidad en diseño digital</li><li>Micro-interacciones y animaciones</li><li>Diseño responsive y mobile-first</li></ul><h2>Temas de Negocio</h2><ul><li>Investigación de usuarios y mercado</li><li>Métricas de UX y analytics</li><li>Estrategias de monetización</li><li>Pitch y presentación de proyectos</li></ul><h2>Herramientas</h2><ul><li>Figma avanzado</li><li>Prototipado con Framer</li><li>Testing de usabilidad</li><li>Colaboración en equipos remotos</li></ul>',
'markdown', NOW(), NOW(), 'markdown', 'en', 1, 1, '[]', '{"js":"","css":""}', NOW(), '2099-12-31 23:59:59+00');

-- Verification
SELECT 'Migration completed' as status, COUNT(*) as total_pages FROM pages;
SELECT 'Migrated pages' as status, COUNT(*) as migrated_pages FROM pages WHERE hash LIKE 'hash_%';

COMMIT;
