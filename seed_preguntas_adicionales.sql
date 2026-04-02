-- ==============================================
-- DIPLOMATIC-U: BANCO DE PREGUNTAS ADICIONAL
-- +150 preguntas distribuidas en los 10 cursos
-- Ejecutar en el SQL Editor de Supabase
-- ==============================================

INSERT INTO preguntas (id_curso, leccion, planteamiento, pregunta, opciones, respuesta_correcta, explicacion, referencia)
VALUES

-- ================================================
-- CURSO 1: Historia Diplomática de México (id=1)
-- ================================================

-- Lección 1
(1, 1, 'Independencia y primeras relaciones', '¿Con qué país estableció México su primer reconocimiento diplomático formal en 1822?', '{"A": "Francia", "B": "España", "C": "Estados Unidos", "D": "Gran Bretaña"}', 'C', 'EE.UU. reconoció la independencia de México en 1822, siendo el primer país en hacerlo.', 'SRE Historia Diplomática.'),
(1, 1, 'Tratados del S. XIX', '¿Qué tratado firmado en 1853 implicó la venta del territorio de La Mesilla a Estados Unidos?', '{"A": "Tratado de Guadalupe Hidalgo", "B": "Tratado Gadsden", "C": "Tratado de Mon-Almonte", "D": "Tratado de Bucareli"}', 'B', 'El Tratado Gadsden (Tratado de La Mesilla) fue negociado por Santa Anna y significó la venta de 76,845 km² por 10 millones de dólares.', 'Historia de México.'),
(1, 1, 'Establecimiento diplomático', 'La Secretaría de Relaciones Exteriores de México fue fundada en el año:', '{"A": "1810", "B": "1821", "C": "1823", "D": "1835"}', 'C', 'La SRE fue creada en 1823 con la primera Constitución Federal mexicana.', 'SRE Historia Institucional.'),

-- Lección 2
(1, 2, 'Intervención francesa', '¿Quién fue el Presidente de México durante la República Restaurada (1867-1872)?', '{"A": "Sebastián Lerdo de Tejada", "B": "Porfirio Díaz", "C": "Benito Juárez", "D": "Ignacio Comonfort"}', 'C', 'Juárez venció al Imperio de Maximiliano y restauró la República Liberal.', 'Historia de México.'),
(1, 2, 'Porfiriato', 'La política exterior del Porfiriato (1876-1910) se caracterizó principalmente por:', '{"A": "El aislacionismo total", "B": "La atracción de inversión extranjera y modernización", "C": "El expansionismo territorial", "D": "La ruptura con EE.UU."}', 'B', 'Díaz buscó inversión de EE.UU., Europa y Gran Bretaña para modernizar ferrocarriles, minas y petróleo.', 'Historia Diplomática del Porfiriato.'),
(1, 2, 'Reconocimiento de límites', 'La Comisión Internacional de Límites y Aguas (CILA) fue creada para resolver disputas fronterizas entre México y:', '{"A": "Guatemala", "B": "Belice", "C": "Estados Unidos", "D": "Cuba"}', 'C', 'La CILA administra los tratados sobre límites y aguas internacionales entre México y EE.UU. desde 1889.', 'CILA.'),

-- Lección 3
(1, 3, 'Doctrina Estrada', 'La Doctrina Estrada fue pronunciada por el Canciller Genaro Estrada en el año:', '{"A": "1917", "B": "1923", "C": "1930", "D": "1938"}', 'C', 'Fue anunciada en 1930 durante el gobierno de Pascual Ortiz Rubio.', 'Política Exterior Mexicana.'),
(1, 3, 'Expropiación petrolera', 'El 18 de marzo de 1938, el presidente Lázaro Cárdenas expropió las compañías petroleras extranjeras. La respuesta diplomática más severa fue de:', '{"A": "Estados Unidos", "B": "México", "C": "Gran Bretaña", "D": "Francia"}', 'C', 'Gran Bretaña rompió relaciones diplomáticas con México; EE.UU. mantuvo un camino de negociación.', 'Historia de PEMEX y Política Exterior.'),
(1, 3, 'Relaciones con España', 'México fue uno de los pocos países que no reconoció al régimen franquista de España (1939-1977) y mantuvo relaciones con:', '{"A": "La Monarquía Borbónica en el exilio", "B": "El Gobierno de la República española en el exilio", "C": "Las Cortes de Cádiz", "D": "La Federación Española en México"}', 'B', 'México reconoció al Gobierno republicano español en el exilio como gesto de solidaridad con los refugiados y los principios democráticos.', 'Política Exterior Mexicana del S. XX.'),

-- Lección 4
(1, 4, 'Guerra Fría', 'México mantuvo relaciones con Cuba post-revolución (1959) siendo el único país de la OEA que lo hizo. ¿Qué principio de política exterior justificó esta postura?', '{"A": "Seguridad hemisférica", "B": "Doctrina Estrada y no intervención", "C": "Docrina Monroe", "D": "Solidaridad socialista"}', 'B', 'La Doctrina Estrada y el principio de no intervención permitieron a México mantener relaciones con todos los gobiernos sin juzgar su legitimidad.', 'Política Exterior de México.'),
(1, 4, 'Tlatelolco 1968', 'El movimiento estudiantil de 1968 tuvo implicaciones diplomáticas porque México era sede de:', '{"A": "La Cumbre Iberoamericana", "B": "Los Juegos Olímpicos", "C": "La Asamblea General de la ONU", "D": "El G20"}', 'B', 'La masacre de Tlatelolco ocurrió 10 días antes de la inauguración de los Juegos Olímpicos de México 1968.', 'Historia Contemporánea.'),

-- Lección 5
(1, 5, 'Política multilateral', 'México impulsó junto a otros países el "Grupo de Contadora" en 1983 para buscar la paz en:', '{"A": "El Caribe", "B": "Centroamérica", "C": "Sudamérica", "D": "El Cono Sur"}', 'B', 'El Grupo Contadora (México, Colombia, Venezuela y Panamá) buscó la paz en Nicaragua, El Salvador y Guatemala.', 'Diplomacia Mexicana.'),
(1, 5, 'TLCAN', 'El Tratado de Libre Comercio de América del Norte (TLCAN) entró en vigor el 1 de enero de:', '{"A": "1990", "B": "1992", "C": "1994", "D": "1996"}', 'C', 'El TLCAN fue negociado durante el gobierno de Salinas de Gortari y entró en vigor en 1994.', 'Política Económica Exterior de México.'),
(1, 5, 'Nobel de Paz Mexicano', '¿Qué diplomático mexicano recibió el Premio Nobel de la Paz en 1982 por el Tratado de Tlatelolco?', '{"A": "Jorge Castañeda", "B": "Alfonso García Robles", "C": "Genaro Estrada", "D": "Bernardo Sepúlveda"}', 'B', 'Alfonso García Robles fue coautor del Tratado de Tlatelolco (1967) y compartió el Nobel de la Paz con Alva Myrdal.', 'SRE / Nobel de la Paz.'),

-- ================================================
-- CURSO 2: Derecho Internacional Público (id=2)
-- ================================================

-- Lección 1
(2, 1, 'Costumbre Internacional', '¿Cuáles son los dos elementos constitutivos de la costumbre internacional?', '{"A": "Ley escrita y jurisprudencia", "B": "Práctica constante (elemento material) y opinio juris (elemento psicológico)", "C": "Tratado y resolución de la ONU", "D": "Consenso y voto mayoritario"}', 'B', 'Para que exista costumbre internacional se requiere práctica generalizada y constante, más la convicción de que es jurídicamente obligatoria (opinio juris).', 'Estatuto de la CIJ Art. 38.'),
(2, 1, 'Codificación del DIP', '¿Qué órgano de la ONU se encarga de la codificación y desarrollo progresivo del DIP?', '{"A": "Consejo de Seguridad", "B": "CIJ", "C": "Comisión de Derecho Internacional (CDI)", "D": "Asamblea General"}', 'C', 'La CDI fue creada en 1948 y ha producido instrumentos clave como las Convenciones de Viena.', 'Carta de la ONU.'),

-- Lección 2
(2, 2, 'Sujetos del DIP', 'El individuo como sujeto del DIP tiene personalidad:', '{"A": "Plena e igual a la del Estado", "B": "Limitada, en especial en materia de derechos humanos y DPI", "C": "Nula, nunca ha sido reconocido", "D": "Sólo en el ámbito comercial"}', 'B', 'El individuo tiene derechos y obligaciones directas en el DIP moderno, especialmente ante cortes de DDHH y el TPI.', 'DIP Contemporáneo.'),
(2, 2, 'Reconocimiento de Estados', '¿Cuáles son los elementos constitutivos del Estado según la Convención de Montevideo (1933)?', '{"A": "Territorio, ejército, constitución y banco central", "B": "Población permanente, territorio definido, gobierno y capacidad de entrar en relaciones internacionales", "C": "Idioma, moneda, himno y bandera", "D": "Soberanía, religión, raza e idioma"}', 'B', 'La Convención de Montevideo es el instrumento codificador más citado sobre los requisitos para ser Estado.', 'Convención de Montevideo 1933.'),

-- Lección 3
(2, 3, 'Inmunidades', '¿Qué protegen las inmunidades diplomáticas según la Convención de Viena de 1961?', '{"A": "Únicamente los bienes del embajador", "B": "La persona, residencia y comunicaciones del agente diplomático de jurisdicción del Estado receptor", "C": "Solo la inviolabilidad de la valija diplomática", "D": "El personal administrativo únicamente"}', 'B', 'La inmunidad abarca persona, domicilio, documentos y correspondencia del agente diplomático.', 'CVRD 1961.'),
(2, 3, 'Reservas a los Tratados', '¿Una reserva a un tratado multilateral puede hacerse en cualquier momento?', '{"A": "Sí, siempre que se quiera", "B": "No, el tratado puede prohibirlas o limitarlas y deben formularse al firmar, ratificar o adherirse", "C": "Sólo si todos los Estados partes aprueban la reserva", "D": "Sólo en tratados de DDHH"}', 'B', 'La Convención de Viena de 1969 regula las reservas en los artículos 19-23.', 'CVDT 1969.'),

-- Lección 4
(2, 4, 'Solución Pacífica de Controversias', 'El mecanismo de solución de controversias vinculante más importante en el DIP general es:', '{"A": "La mediación de la ONU", "B": "La Corte Internacional de Justicia", "C": "El Consejo de Seguridad", "D": "La Corte Penal Internacional"}', 'B', 'La CIJ es el principal órgano judicial de la ONU. Su jurisdicción contenciosa requiere el consentimiento de ambos Estados.', 'Estatuto CIJ.'),
(2, 4, 'Reconocimiento de Gobiernos', '¿La Doctrina Estrada de México es un ejemplo de cuál tipo de reconocimiento de gobiernos?', '{"A": "Reconocimiento de jure", "B": "Reconocimiento de facto", "C": "No reconocimiento / abstención de reconocimiento", "D": "Reconocimiento tácito"}', 'C', 'México optó por abstenerse de reconocer o no reconocer gobiernos, manteniendo sólo relaciones entre Estados.', 'Política Exterior de México.'),

-- Lección 5
(2, 5, 'Derecho del Mar', '¿Cuántas millas náuticas comprende la Zona Económica Exclusiva (ZEE)?', '{"A": "12 millas náuticas", "B": "24 millas náuticas", "C": "200 millas náuticas", "D": "350 millas náuticas"}', 'C', 'La CONVEMAR establece una ZEE de 200 millas náuticas desde las líneas de base.', 'CONVEMAR 1982.'),
(2, 5, 'Ius Cogens', '¿Cuál de las siguientes normas NO es generalmente reconocida como Jus Cogens?', '{"A": "Prohibición del genocidio", "B": "Prohibición de la tortura", "C": "El principio de libre comercio internacional", "D": "Prohibición de la esclavitud"}', 'C', 'El libre comercio es una norma dispositiva (ius dispositivum), no imperativa. Las partes pueden acordar lo contrario.', 'Derecho Internacional General.'),
(2, 5, 'Responsabilidad Internacional', 'La "reparación" en derecho de la responsabilidad internacional NO incluye:', '{"A": "Restitución", "B": "Indemnización", "C": "Satisfacción", "D": "Pena de prisión al Estado"}', 'D', 'El DIP no prevé sanciones penales a los Estados; la reparación busca restablecer la situación previa al hecho ilícito.', 'CDI Art. 34.'),

-- ================================================
-- CURSO 3: Política Exterior Multilateral (id=3)
-- ================================================

-- Lección 1
(3, 1, 'Carta de la ONU', '¿En qué año y ciudad fue firmada la Carta de la ONU?', '{"A": "1945, San Francisco", "B": "1944, Bretton Woods", "C": "1945, Nueva York", "D": "1946, París"}', 'A', 'La Conferencia de San Francisco (1945) redactó y firmó la Carta de la ONU.', 'Carta de la ONU.'),
(3, 1, 'Principios ONU', '¿Cuál de los siguientes NO es un propósito explícito de la ONU según su Carta?', '{"A": "Mantener la paz y seguridad internacionales", "B": "Desarrollar relaciones de amistad entre naciones", "C": "Establecer un gobierno mundial único", "D": "Promover el respeto a los DDHH"}', 'C', 'La ONU es una organización basada en la soberanía estatal; no busca crear un gobierno supranacional.', 'Carta de la ONU Art. 1.'),
(3, 1, 'Sistemas ONU', 'Los organismos especializados del sistema ONU se vinculan mediante acuerdos con:', '{"A": "El Consejo de Seguridad", "B": "El Secretario General", "C": "El Consejo Económico y Social (ECOSOC)", "D": "La Asamblea General exclusivamente"}', 'C', 'El ECOSOC coordina el trabajo de los organismos especializados como la OMS, OIT, FAO, UNESCO.', 'Sistema de la ONU.'),

-- Lección 2
(3, 2, 'Veto en el CS', '¿Cuántos votos afirmativos se requieren para aprobar una resolución del Consejo de Seguridad en cuestiones de fondo (no de procedimiento)?', '{"A": "9 votos de cualquier miembro", "B": "9 votos incluyendo los 5 permanentes sin ningún veto", "C": "Unanimidad de los 15 miembros", "D": "Simple mayoría de 8"}', 'B', 'Las resoluciones de fondo requieren 9 de 15 votos favorables y que ninguno de los P5 vote en contra.', 'Carta ONU Art. 27.'),
(3, 2, 'México en ONU', '¿México fue miembro fundador de la ONU?', '{"A": "No, ingresó hasta 1955", "B": "Sí, firmó la Carta en San Francisco en 1945", "C": "No, ingresó tras el fin de la Guerra Fría", "D": "Sí, pero como miembro observador inicialmente"}', 'B', 'México participó en la Conferencia de San Francisco y firmó la Carta original de 1945.', 'Historia de México en la ONU.'),
(3, 2, 'UNESCO', 'La UNESCO tiene su sede en:', '{"A": "Ginebra", "B": "Nueva York", "C": "Londres", "D": "París"}', 'D', 'La Organización de las Naciones Unidas para la Educación, la Ciencia y la Cultura (UNESCO) tiene sede en París.', 'Sistema ONU.'),

-- Lección 3
(3, 3, 'OEA', '¿En qué año y ciudad fue fundada la Organización de los Estados Americanos?', '{"A": "1945, San Francisco", "B": "1948, Bogotá", "C": "1947, Río de Janeiro", "D": "1950, Washington"}', 'B', 'La OEA fue creada en la IX Conferencia Internacional Americana de 1948 en Bogotá.', 'OEA Historia.'),
(3, 3, 'Sistema Interamericano', '¿Cuál es el órgano máximo de la OEA?', '{"A": "La Comisión Interamericana de DDHH", "B": "El Secretario General", "C": "La Asamblea General de la OEA", "D": "El Consejo Permanente"}', 'C', 'La Asamblea General es el órgano supremo de la OEA y se reúne en sesiones ordinarias anuales.', 'Carta de la OEA.'),
(3, 3, 'Principios Carta OEA', '¿Cuál de estos es un principio fundamental de la Carta de la OEA?', '{"A": "La intervención colectiva humanitaria es obligatoria", "B": "No intervención en asuntos internos de los Estados", "C": "Los países poderosos tienen derechos preferentes", "D": "La soberanía puede ser suspendida por el CS"}', 'B', 'La no intervención es piedra angular del sistema interamericano, reforzada por la doctrina Estrada de México.', 'Carta de la OEA Art. 3.'),

-- Lección 4
(3, 4, 'Derecho Humanitario', 'Las cuatro Convenciones de Ginebra de 1949 regulan:', '{"A": "El uso de armas nucleares", "B": "La protección de víctimas de conflictos armados", "C": "El derecho al asilo diplomático", "D": "Los límites marítimos en zonas de guerra"}', 'B', 'Las Convenciones de Ginebra protegen heridos, náufragos, prisioneros de guerra y civiles en conflictos armados.', 'DIH / CICR.'),
(3, 4, 'Refugiados', '¿Qué instrumento define la condición jurídica de los refugiados a nivel internacional?', '{"A": "Convención de Viena 1961", "B": "Convención sobre el Estatuto de los Refugiados de 1951", "C": "Declaración Universal de DDHH", "D": "Pacto Internacional de Derechos Civiles"}', 'B', 'La Convención de 1951 (y su Protocolo de 1967) es la base del derecho internacional de los refugiados.', 'ACNUR.'),

-- Lección 5
(3, 5, 'CELAC', '¿Cuándo fue creada la CELAC?', '{"A": "1990 en México D.F.", "B": "2010 en Cancún y proclamada en 2011 en Caracas", "C": "2005 en Buenos Aires", "D": "2015 en La Habana"}', 'B', 'La CELAC fue fundada en la Cumbre de Cancún 2010 y proclamada en Caracas en diciembre de 2011.', 'CELAC.'),
(3, 5, 'Alianza del Pacífico', '¿Cuáles son los cuatro países miembros fundadores de la Alianza del Pacífico?', '{"A": "México, Cuba, Colombia y Perú", "B": "México, Colombia, Perú y Chile", "C": "México, Brasil, Argentina y Chile", "D": "México, Colombia, Ecuador y Perú"}', 'B', 'La Alianza del Pacífico fue creada en 2011 por México, Colombia, Perú y Chile para promover la integración económica.', 'Alianza del Pacífico.'),

-- ================================================
-- CURSO 4: Protocolo y Etiqueta Diplomática (id=4)
-- ================================================

-- Lección 1
(4, 1, 'Conceptos básicos', 'El "ceremonial diplomático" puede definirse como:', '{"A": "Las reglas de etiqueta social informal", "B": "El conjunto de normas que regula los actos y solemnidades en las relaciones internacionales oficiales", "C": "El protocolo solo aplicable a la familia real", "D": "Las instrucciones del Ministerio de Relaciones para el servicio exterior"}', 'B', 'El ceremonial diplomático incluye recepción de visitas, actos protocolarios, orden de precedencia y comunicaciones formales.', 'Manual de Protocolo Diplomático.'),
(4, 1, 'Tipos de vestimenta', '¿Qué código de vestimenta implica frac y corbata blanca?', '{"A": "Business Casual", "B": "Black Tie", "C": "White Tie", "D": "Smart Formal"}', 'C', 'White Tie (corbata blanca) es el máximo nivel de formalidad: frac para hombres y vestido de gala largo para mujeres.', 'Protocolo Internacional.'),

-- Lección 2
(4, 2, 'Convención de Viena 1961', 'La Convención de Viena sobre Relaciones Diplomáticas (1961) fue adoptada durante la administración del Secretario General de la ONU:', '{"A": "Dag Hammarskjöld", "B": "U Thant", "C": "Kurt Waldheim", "D": "Boutros-Ghali"}', 'A', 'La Convención fue adoptada el 18 de abril de 1961, durante el mandato de Dag Hammarskjöld.', 'CVRD 1961.'),
(4, 2, 'Plácet', 'El plácet es:', '{"A": "La aprobación del Estado receptor al nombramiento de un Jefe de Misión propuesto", "B": "El documento de viaje del diplomático", "C": "El acto de presentación de cartas credenciales", "D": "La nota de protesta formal"}', 'A', 'Antes de nombrar a un embajador, el Estado acreditante solicita el plácet (acuerdo) al Estado receptor.', 'CVRD Art. 4.'),
(4, 2, 'Inviolabilidad', '¿Las autoridades del Estado receptor pueden entrar a la sede de la misión diplomática sin permiso?', '{"A": "Sí, con orden judicial", "B": "Sí, en caso de emergencia (incendio, etc.)", "C": "No, la sede es inviolable y requiere el consentimiento del Jefe de Misión", "D": "Sí, si existe sospecha de actividad terrorista"}', 'C', 'El Art. 22 de la CVRD establece la inviolabilidad absoluta de los locales de la misión.', 'CVRD 1961 Art. 22.'),

-- Lección 3
(4, 3, 'Comunicaciones', '¿Qué diferencia a un Memorándum de una Nota Verbal?', '{"A": "El memorándum se envía a otro gobierno; la nota verbal a organismos internacionales", "B": "La nota verbal es de tercera persona sin firma; el memorándum es un resumen de conversación o posición, menos formal", "C": "No hay diferencia práctica", "D": "El memorándum es solo interno"}', 'B', 'Ambos son instrumentos diplomáticos, pero tienen usos y formatos distintos.', 'Técnica Diplomática.'),
(4, 3, 'Valija Diplomática', 'La valija diplomática es inviolable porque:', '{"A": "Está hecha de un material resistente a rayos X", "B": "Contiene únicamente documentos y artículos de uso oficial y está protegida por la CVRD", "C": "Siempre la acompaña un elemento armado", "D": "Es una práctica, no una norma jurídica"}', 'B', 'Art. 27 CVRD: la valija diplomática no puede ser abierta ni retenida.', 'CVRD Art. 27.'),
(4, 3, 'Asilo Diplomático', '¿Qué instrumento regula el asilo diplomático en el ámbito interamericano?', '{"A": "Convención de Viena 1961", "B": "Convención sobre Asilo Diplomático de Caracas (1954)", "C": "Estatuto de Roma", "D": "Convención de Refugiados 1951"}', 'B', 'La Convención de Caracas de 1954 es el instrumento regional que codifica el asilo diplomático.', 'Derecho Interamericano.'),

-- Lección 4
(4, 4, 'Mesas y protocolo de banquetes', '¿Cómo se determina el lugar de honor en una mesa de banquete oficial?', '{"A": "El invitado de mayor rango se sienta frente a la puerta de entrada", "B": "El invitado de mayor rango se sienta a la derecha del anfitrión", "C": "Se sortea entre los invitados", "D": "El más anciano preside siempre"}', 'B', 'La derecha del anfitrión es el lugar de honor en la mesa según el protocolo occidental.', 'Manual de Protocolo.'),
(4, 4, 'Banderas', '¿Cuál es el orden correcto para la colocación de banderas de varios países en un evento internacional?', '{"A": "Por antigüedad del país", "B": "Por extensión territorial del país", "C": "Orden alfabético en el idioma del país anfitrión o en inglés / francés", "D": "Por orden de llegada de los delegados"}', 'C', 'La práctica más extendida en eventos multilaterales es el orden alfabético del idioma del foro.', 'Protocolo Internacional.'),

-- ================================================
-- CURSO 5: Relaciones Bilaterales México - EE.UU. (id=5)
-- ================================================

-- Lección 1
(5, 1, 'Embajadas', '¿Cuántos Consulados generales tiene México en Estados Unidos aproximadamente?', '{"A": "5", "B": "20", "C": "50", "D": "Más de 50"}', 'C', 'México cuenta con más de 50 representaciones consulares en EE.UU., la red consular más grande en ese país.', 'SRE / Protección Consular.'),
(5, 1, 'Intercambio comercial', '¿México es el cuántos socios comercial de EE.UU.?', '{"A": "Primero", "B": "Segundo", "C": "Tercero", "D": "Cuarto"}', 'A', 'México es el principal socio comercial de EE.UU. desplazando a China y Canadá según datos recientes.', 'T-MEC / Comercio Bilateral.'),

-- Lección 2
(5, 2, 'Frontera', '¿Cuántos kilómetros mide la frontera terrestre México-EE.UU.?', '{"A": "Aproximadamente 1,500 km", "B": "Aproximadamente 2,000 km", "C": "Aproximadamente 3,145 km", "D": "Aproximadamente 4,000 km"}', 'C', 'La frontera entre México y EE.UU. es de 3,145 km, una de las más transitadas del mundo.', 'CILA / SRE.'),
(5, 2, 'Remesas', '¿Cuánto representan las remesas de mexicanos en EE.UU. para la economía de México?', '{"A": "Son insignificantes (<1% del PIB)", "B": "Son la primera o segunda fuente de divisas", "C": "Solo superan al sector turístico", "D": "Son equivalentes al presupuesto de educación"}', 'B', 'Las remesas superan con frecuencia al turismo y la IED como fuente de divisas para México.', 'Banco de México.'),
(5, 2, 'Comunidad mexicana en EE.UU.', 'Se estima que la comunidad de origen mexicano en EE.UU. supera los:', '{"A": "5 millones de personas", "B": "10 millones de personas", "C": "25 millones de personas", "D": "38 millones de personas"}', 'D', 'La comunidad de origen mexicano en EE.UU. supera los 38 millones, siendo la mayor minoría hispana.', 'SRE / Census Bureau EE.UU.'),

-- Lección 3
(5, 3, 'Plan Mérida', 'La Iniciativa Mérida es un acuerdo de cooperación enfocado en:', '{"A": "Migración laboral temporal", "B": "Seguridad, crimen organizado y tráfico de drogas", "C": "Protección ambiental de la frontera", "D": "Intercambio educativo y cultural"}', 'B', 'La Iniciativa Mérida (2008) canalizó equipamiento, capacitación e inteligencia para combatir al crimen organizado.', 'Relaciones de Seguridad.'),
(5, 3, 'Derechos de connacionales', 'El Caso Avena (México v. EE.UU., 2004) ante la CIJ versó sobre violación del derecho de mexicanos a:', '{"A": "Votar en consulados", "B": "Ser notificados sobre su derecho a asistencia consular al ser detenidos", "C": "Recibir doble ciudadanía", "D": "Circular libremente en la frontera"}', 'B', 'El Art. 36 de la CVRC obliga al Estado receptor a notificar al detenido extranjero su derecho a contactar su consulado.', 'CIJ Caso Avena 2004.'),
(5, 3, 'Tratados vigentes', '¿Cuántos tratados y acuerdos bilaterales aproximadamente tienen México y EE.UU.?', '{"A": "Menos de 50", "B": "Alrededor de 100", "C": "Más de 1,000", "D": "Más de 300"}', 'D', 'La relación bilateral tiene más de 300 tratados y acuerdos vigentes en diversas materias.', 'SRE Tratados.'),

-- ================================================
-- CURSO 6: Economía Política Internacional (id=6)
-- ================================================

-- Lección 1
(6, 1, 'OMC', '¿En qué año fue creada la OMC para reemplazar al GATT?', '{"A": "1986", "B": "1994", "C": "1995", "D": "2001"}', 'C', 'La OMC fue creada en 1995 a partir de los acuerdos de la Ronda de Uruguay del GATT.', 'OMC Historia.'),
(6, 1, 'Principios OMC', '¿Cuál es el principio que garantiza que cualquier ventaja arancelaria que un país otorgue a otro debe extenderse a todos los demás miembros de la OMC?', '{"A": "Principio de reciprocidad", "B": "Nación Más Favorecida (NMF)", "C": "Trato Nacional", "D": "Apertura comercial"}', 'B', 'El principio de NMF es pilar del GATT/OMC: no discriminación entre socios comerciales.', 'GATT Art. I.'),

-- Lección 2
(6, 2, 'Banco Mundial', '¿Cuáles son los dos componentes principales del Grupo Banco Mundial relevantes para préstamos a países en desarrollo?', '{"A": "FMI y OMC", "B": "BIRF (préstamos a ingresos medios) y AIF (préstamos a países pobres)", "C": "BIRD y BRICS", "D": "OCDE y CEPAL"}', 'B', 'El BIRF presta a países de renta media y la AIF (IDA) presta en condiciones concesionales a los más pobres.', 'Grupo Banco Mundial.'),
(6, 2, 'Aranceles', '¿Qué es un arancel ad valorem?', '{"A": "Un arancel fijo en moneda local por unidad de producto", "B": "Un arancel calculado como porcentaje del valor del bien importado", "C": "Un arancel que varía según el país de origen", "D": "Un arancel temporal de emergencia"}', 'B', 'El arancel ad valorem es el más común; por ejemplo, 10% sobre el valor CIF de la mercancía.', 'Derecho Económico Internacional.'),

-- Lección 3
(6, 3, 'CEPAL', '¿Cuál es la sede de la CEPAL (Comisión Económica para América Latina y el Caribe)?', '{"A": "Buenos Aires", "B": "Ciudad de México", "C": "Santiago de Chile", "D": "Río de Janeiro"}', 'C', 'La CEPAL tiene su sede en Santiago de Chile desde 1948.', 'Sistema ONU / CEPAL.'),
(6, 3, 'Teoría de la dependencia', 'La Teoría de la Dependencia, desarrollada principalmente desde la CEPAL, argumenta que:', '{"A": "El libre comercio siempre beneficia a todos los países por igual", "B": "Las economías periféricas (en desarrollo) están estructuralmente subordinadas a las economías del centro (desarrolladas)", "C": "La industrialización es imposible en Latinoamérica", "D": "El desarrollo solo se logra con ayuda militar"}', 'B', 'Raúl Prebisch y otros desarrollaron esta teoría para explicar el deterioro de los términos de intercambio.', 'CEPAL / Prebisch.'),
(6, 3, 'Deuda Externa', '¿Qué fue la "crisis de la deuda" en América Latina de 1982?', '{"A": "Una crisis cambiaria sin precedente en Europa", "B": "México declaró que no podía pagar su deuda externa, desencadenando una crisis regional", "C": "Un conflicto comercial con el FMI", "D": "La salida de México del GATT"}', 'B', 'En agosto de 1982 México declaró moratoria de su deuda externa, iniciando la "década perdida" en América Latina.', 'Historia Económica.'),

-- Lección 4
(6, 4, 'TLCAN / T-MEC', '¿Qué capítulo del T-MEC es especialmente relevante en materia de solución de controversias entre inversionistas y Estados?', '{"A": "Capítulo 2: Trato Nacional", "B": "Capítulo 14: Inversión", "C": "Capítulo 7: Sanidad", "D": "Capítulo 31: Solución de Controversias entre países"}', 'B', 'El Capítulo 14 del T-MEC regula la protección a inversionistas y tiene un mecanismo de solución restringido vs. TLCAN.', 'T-MEC.'),
(6, 4, 'IED', '¿Qué significa IED en el contexto de economía internacional?', '{"A": "Intercambio Económico Directo", "B": "Inversión Extranjera Directa", "C": "Ingreso Equivalente Doméstico", "D": "Índice de Estabilidad y Desarrollo"}', 'B', 'La Inversión Extranjera Directa implica control o influencia significativa de un inversor sobre una empresa en otro país.', 'OCDE / Economía Internacional.'),

-- ================================================
-- CURSO 7: Organismos Internacionales y Gobernanza Global (id=7)
-- ================================================

-- Lección 1
(7, 1, 'OIT', '¿Cuándo fue fundada la Organización Internacional del Trabajo?', '{"A": "1919, en el Tratado de Versalles", "B": "1945, con la ONU", "C": "1948, con la Declaración Universal de DDHH", "D": "1936, en la Sociedad de Naciones"}', 'A', 'La OIT fue creada en 1919 como parte del Tratado de Versalles; es la organización internacional más antigua del sistema ONU.', 'OIT Historia.'),
(7, 1, 'FAO', '¿Cuál es la sede de la FAO (Organización de las Naciones Unidas para la Alimentación y la Agricultura)?', '{"A": "Ginebra", "B": "Washington D.C.", "C": "Roma", "D": "París"}', 'C', 'La FAO tiene su sede en Roma, Italia, desde su fundación en 1945.', 'Sistema ONU.'),

-- Lección 2
(7, 2, 'TPI', 'La Corte Penal Internacional (CPI) juzga individuos por crímenes de:', '{"A": "Terrorismo y tráfico de drogas", "B": "Genocidio, crímenes de lesa humanidad, crímenes de guerra y crimen de agresión", "C": "Violaciones a tratados comerciales", "D": "Corrupción de funcionarios públicos"}', 'B', 'El Estatuto de Roma (1998) que crea la CPI define estos cuatro tipos de crímenes.', 'Estatuto de Roma 1998.'),
(7, 2, 'México y CPI', '¿México ratificó el Estatuto de Roma que crea la Corte Penal Internacional?', '{"A": "No, nunca lo ha firmado", "B": "Sí, lo ratificó en 2005", "C": "Sí, fue uno de los primeros en 1998", "D": "Lo firmó pero no ratificó"}', 'B', 'México ratificó el Estatuto de Roma en 2005, con una reserva constitucional que luego fue retirada.', 'SRE / CPI.'),

-- Lección 3
(7, 3, 'AIEA', '¿Cuál es el mandato principal del Organismo Internacional de Energía Atómica (OIEA/AIEA)?', '{"A": "Promover el desmantelamiento de armas nucleares", "B": "Promover el uso pacífico de la energía nuclear y evitar su proliferación militar", "C": "Controlar el mercado mundial de uranio", "D": "Proporcionar energía nuclear a países en desarrollo"}', 'B', 'El OIEA fue creado en 1957 para fomentar el uso pacífico de la energía atómica bajo el principio "átomos para la paz".', 'OIEA.'),
(7, 3, 'G7 vs G20', '¿Cuál es la principal diferencia entre el G7 y el G20?', '{"A": "El G7 incluye países emergentes; el G20 solo a los más ricos", "B": "El G7 agrupa a las 7 economías más avanzadas; el G20 incluye también economías emergentes grandes como México, Brasil, China", "C": "El G20 es exclusivamente europeo", "D": "El G7 fue creado antes que el G20 y tiene más poder vinculante"}', 'B', 'El G20 surgió precisamente para incluir economías emergentes que representan cerca del 80% del PIB mundial.', 'Gobernanza Global.'),

-- Lección 4
(7, 4, 'Operaciones de Paz ONU', '¿Bajo qué capítulo de la Carta de la ONU se autorizan las operaciones de paz coercitivas (como las del Golfo Pérsico 1991)?', '{"A": "Capítulo VI (Solución pacífica)", "B": "Capítulo VII (Acción en caso de amenazas a la paz)", "C": "Capítulo VIII (Acuerdos regionales)", "D": "Capítulo XIV (Corte Internacional de Justicia)"}', 'B', 'Las operaciones coercitivas requieren autorización del CS bajo Capítulo VII. Las de mantenimiento de paz (cascos azules) son bajo Cap. VI.', 'Carta de la ONU.'),
(7, 4, 'Reforma de la ONU', '¿Cuál es el principal debate sobre la reforma del Consejo de Seguridad?', '{"A": "Reducir sus miembros de 15 a 10", "B": "Ampliar el número de miembros permanentes y no permanentes para mayor representatividad", "C": "Eliminar el derecho de veto para todos", "D": "Trasladar su sede a otro continente"}', 'B', 'Países como India, Brasil, Alemania y Japón aspiran a un asiento permanente. El debate sobre la representatividad está activo.', 'Reforma ONU.'),

-- ================================================
-- CURSO 8: Derecho Consular y Protección a Mexicanos (id=8)
-- ================================================

-- Lección 1
(8, 1, 'Historia Consular', '¿Cuándo México estableció su primera red consular sistemática en EE.UU.?', '{"A": "Siglo XVIII", "B": "Primera mitad del Siglo XIX", "C": "1917 con la nueva Constitución", "D": "1942 con el Programa Bracero"}', 'B', 'México abrió sus primeros consulados en EE.UU. en el siglo XIX para proteger a los mexicanos que quedaron en el territorio cedido.', 'Historia Consular de México.'),
(8, 1, 'Cónsul Honorario', '¿Qué es un Cónsul Honorario?', '{"A": "Un ex embajador retirado", "B": "Un nacional del Estado que envía o del receptor que ejerce funciones consulares sin ser funcionario de carrera remunerado", "C": "El rango más alto en el servicio consular", "D": "Un cónsul que no tiene oficina fija"}', 'B', 'Los cónsules honorarios son personas reconocidas que ejercen funciones consulares limitadas sin ser parte de la carrera diplomática.', 'CVRC 1963.'),

-- Lección 2
(8, 2, 'Matrícula Consular', '¿Qué es la Matrícula Consular que expide México?', '{"A": "Un documento para solicitar visa en EE.UU.", "B": "Un documento de identidad consular para mexicanos en el extranjero", "C": "Una tarjeta de seguro médico", "D": "El equivalente al pasaporte para menores"}', 'B', 'La matrícula consular acredita la identidad y nacionalidad de connacionales; muchos estados de EE.UU. la aceptan como identificación.', 'SRE / Consulados.'),
(8, 2, 'DACA', '¿Qué significa DACA y cómo afecta a México?', '{"A": "Decreto de Asistencia Consular Activa, un programa mexicano", "B": "Deferred Action for Childhood Arrivals: protección migratoria de EE.UU. para jóvenes indocumentados traídos de niños", "C": "Defensa Arancelaria para el Comercio Agropecuario", "D": "Decreto de Acción Consular Activa"}', 'B', 'DACA protege a aproximadamente 500,000 mexicanos que llegaron a EE.UU. de niños, siendo objeto de intensa diplomacia bilateral.', 'Migración Bilateral.'),

-- Lección 3
(8, 3, 'Convención Viena 1963', 'Según la CVRC, ¿cuáles son las funciones principales de los consulados?', '{"A": "Representación política y negociación de tratados", "B": "Protección de nacionales, expedición de documentos, fomento de relaciones comerciales y culturales", "C": "Declaración de guerra y ruptura de relaciones", "D": "Supervisión electoral en el Estado receptor"}', 'B', 'Las funciones consulares están listadas en el Art. 5 de la CVRC e incluyen protección, documentación y fomento de vínculos.', 'CVRC 1963 Art. 5.'),
(8, 3, 'Notificación Consular', '¿Qué establece el Art. 36 de la Convención de Viena sobre Relaciones Consulares respecto a detenidos?', '{"A": "El Estado receptor puede decidir si informa o no al consulado", "B": "Si el detenido extranjero lo solicita, las autoridades deben notificar sin demora al consulado de su país", "C": "El consulado tiene derecho absoluto a visitar a cualquier detenido", "D": "La notificación solo aplica en casos de pena de muerte"}', 'B', 'El Art. 36 CVRC es la base del "caso Avena" y de numerosas controversias diplomáticas sobre connacionales detenidos en EE.UU.', 'CVRC Art. 36.'),

-- Lección 4
(8, 4, 'Protección Diplomática', '¿Cuándo puede un Estado ejercer "protección diplomática" por un nacional perjudicado en otro Estado?', '{"A": "En cualquier momento que lo decida", "B": "Cuando se ha agotado los recursos internos del Estado receptor y existe nexo de nacionalidad continua", "C": "Solo cuando hay tratado bilateral que lo permita", "D": "Nunca, ya que viola la soberanía del Estado receptor"}', 'B', 'El agotamiento de recursos internos y la nacionalidad continua del reclamante son requisitos clásicos de la protección diplomática.', 'CDI Protección Diplomática.'),
(8, 4, 'Asistencia consular en juicio', '¿Qué puede hacer un consulado cuando uno de sus connacionales enfrenta pena de muerte en otro país?', '{"A": "Nada, es un asunto interno del Estado receptor", "B": "Proporcionar asistencia jurídica, monitorear el proceso, hacer gestiones diplomáticas y solicitar clemencia al ejecutivo", "C": "Declarar la guerra al Estado receptor", "D": "Exigir la extradición inmediata"}', 'B', 'El consulado puede intervenir como amicus curiae y hacer gestiones diplomáticas, aunque no imponer decisiones judiciales.', 'SRE / Protección Consular.'),

-- ================================================
-- CURSO 9: Negociación y Mediación de Conflictos (id=9)
-- ================================================

-- Lección 1
(9, 1, 'Método Harvard', 'Los cuatro principios fundamentales del Método de Negociación de Harvard son:', '{"A": "Competir, persuadir, presionar, ceder", "B": "Separar personas del problema, enfocarse en intereses, generar opciones y usar criterios objetivos", "C": "Atacar la posición, bloquear, amenazar, ceder", "D": "Empatizar, comunicar, negociar, firmar"}', 'B', 'Fisher, Ury y Patton en "Getting to Yes" definieron estos cuatro principios de la negociación basada en principios.', 'Fisher y Ury.'),
(9, 1, 'Tipos de negociación', '¿Cómo se denomina la negociación donde una parte gana exactamente lo que la otra pierde?', '{"A": "Negociación integrativa", "B": "Negociación distributiva o suma cero", "C": "Negociación colaborativa", "D": "Negociación transformativa"}', 'B', 'En la negociación distributiva, los recursos son fijos y lo que gana uno lo pierde el otro.', 'Resolución de Conflictos.'),

-- Lección 2
(9, 2, 'MAAN/BATNA', '¿Para qué sirve conocer el MAAN de la contraparte?', '{"A": "Para saber cuánto cobrarle", "B": "Para entender hasta dónde puede ceder sin que prefiera retirarse de la negociación", "C": "Para copiar su estrategia", "D": "No tiene utilidad conocer el MAAN de la contraparte"}', 'B', 'Conocer el MAAN de la otra parte permite evaluar su límite inferior y diseñar ofertas que superen su alternativa.', 'Negociación Estratégica.'),
(9, 2, 'Zona de Posible Acuerdo', '¿Qué significa ZOPA en negociación?', '{"A": "Zona de Obstrucción y Presión Activa", "B": "Zona de Posible Acuerdo: rango entre los puntos de reserva de ambas partes donde es posible llegar a un deal", "C": "Zona de Oferta y Propuesta Alternativa", "D": "Zona de Proyección y Análisis"}', 'B', 'Si los puntos de reserva de ambas partes se solapan, existe una ZOPA y el acuerdo es teóricamente posible.', 'Teoría de la Negociación.'),

-- Lección 3
(9, 3, 'Mediación ONU', 'El Secretario General de la ONU tiene capacidad de mediación en conflictos mediante la figura de:', '{"A": "Voto en el Consejo de Seguridad", "B": "Buenos oficios y nombramiento de Enviados Especiales", "C": "Resoluciones vinculantes", "D": "Intervención militar directa"}', 'B', 'Los "buenos oficios" son la herramienta de mediación informal del Secretario General, complementada con enviados especiales.', 'Carta ONU Art. 99.'),
(9, 3, 'Arbitraje Internacional', '¿Cuál es la institución de arbitraje comercial internacional más importante del mundo?', '{"A": "CIJ", "B": "Corte Permanente de Arbitraje (CPA) de La Haya", "C": "Corte de Arbitraje Internacional de la CCI (París)", "D": "CIADI"}', 'C', 'La Corte de la CCI en París es el foro arbitral comercial más utilizado, aunque existen varios centros de renombre.', 'Arbitraje Internacional.'),
(9, 3, 'CIADI', 'El CIADI (Centro Internacional de Arreglo de Diferencias Relativas a Inversiones) resuelve disputas entre:', '{"A": "Dos Estados soberanos", "B": "Inversionistas extranjeros y Estados receptores de inversión", "C": "Empresas privadas de distintos países", "D": "Bancos centrales"}', 'B', 'El CIADI (Banco Mundial) es el principal foro para disputas inversionista-Estado en materia de IED.', 'CIADI / Banco Mundial.'),

-- Lección 4
(9, 4, 'Negociación multilateral', '¿Qué hace especialmente compleja la negociación multilateral respecto a la bilateral?', '{"A": "No hay diferencia real", "B": "Hay múltiples actores con intereses distintos, se forman coaliciones y el consenso es más difícil de alcanzar", "C": "Es siempre más fácil porque hay más alternativas", "D": "Solo se da en la ONU"}', 'B', 'Rondas comerciales de la OMC o cumbres climáticas son ejemplos donde la complejidad multilateral hace los acuerdos muy difíciles.', 'Negociación Multilateral.'),
(9, 4, 'Diplomacia preventiva', 'La "diplomacia preventiva" se define como:', '{"A": "El uso de la fuerza antes de que estalle el conflicto", "B": "Acciones para prevenir que las disputas se conviertan en conflictos armados", "C": "La vigilancia de fronteras por fuerzas internacionales", "D": "Los acuerdos de no agresión"}', 'B', 'La diplomacia preventiva es una herramienta fundamental en el arsenal del Secretario General de la ONU (Boutros-Ghali, 1992).', 'Un Programa de Paz, ONU 1992.'),

-- ================================================
-- CURSO 10: Cooperación Internacional para el Desarrollo (id=10)
-- ================================================

-- Lección 1
(10, 1, 'Historia CID', '¿Qué hito de la Guerra Fría fue determinante para el surgimiento de la cooperación internacional para el desarrollo?', '{"A": "La crisis de los misiles de Cuba", "B": "El Plan Marshall (1948) para reconstruir Europa", "C": "La caída del Muro de Berlín", "D": "La guerra de Vietnam"}', 'B', 'El Plan Marshall fue el primer esquema masivo de cooperación económica estatal que sentó precedentes.', 'Historia de la Cooperación.'),
(10, 1, 'Definición CID', '¿Cuál es el objetivo central de la Cooperación Internacional para el Desarrollo?', '{"A": "La expansión militar de países donantes", "B": "Contribuir al desarrollo sostenible, reducción de la pobreza y fortalecimiento de capacidades en países socios", "C": "El endeudamiento controlado de países receptores", "D": "La apertura de mercados para productos del donante"}', 'B', 'La CID busca promover el desarrollo humano sostenible, complementando las capacidades del Estado receptor.', 'OCDE / DAC.'),

-- Lección 2
(10, 2, 'AOD', '¿Qué significa AOD y cuál es la meta establecida por la ONU para países desarrollados?', '{"A": "Ayuda Opcional al Desarrollo: 0.5% del PIB", "B": "Asistencia Oficial al Desarrollo: 0.7% del INB (meta ONU)", "C": "Apoyo Oficial al Desarrollo: 1% del PIB", "D": "Asistencia Oficial al Desarrollo: 2% del PIB (estándar OTAN)"}', 'B', 'La meta del 0.7% del INB fue establecida en 1970 y reafirmada en los ODS. Solo algunos países escandinavos la cumplen regularmente.', 'OCDE / CAD.'),
(10, 2, 'AMEXCID', 'La AMEXCID tiene tres funciones sustantivas: cooperación que México recibe, cooperación que México otorga y:', '{"A": "Evaluación de la deuda externa", "B": "Cooperación triangular y gestión de becas", "C": "Administración del servicio exterior", "D": "Negociación de tratados de libre comercio"}', 'B', 'La AMEXCID gestiona la cooperación bilateral, triangular y los programas de becas como el Programa de Becas para Extranjeros.', 'AMEXCID.'),

-- Lección 3
(10, 3, 'ODS', 'La Agenda 2030 para el Desarrollo Sostenible fue adoptada en la Asamblea General de la ONU en:', '{"A": "2000", "B": "2010", "C": "2015", "D": "2020"}', 'C', 'Los 17 ODS fueron adoptados en septiembre de 2015 por los 193 Estados miembros de la ONU.', 'ONU / Agenda 2030.'),
(10, 3, 'ODS Relacionados con México', '¿Cuál ODS es especialmente prioritario para la política de cooperación de México hacia Centroamérica?', '{"A": "ODS 14 (Vida Submarina)", "B": "ODS 17 (Alianzas para el Desarrollo)", "C": "ODS 1 (Fin de la Pobreza) y ODS 8 (Trabajo Decente)", "D": "ODS 12 (Producción Responsable)"}', 'C', 'Reducir la pobreza y generar empleo en el Triángulo Norte son prioridades para abordar las causas de la migración irregular.', 'AMEXCID / Política Exterior.'),
(10, 3, 'Cooperación Sur-Sur', 'Una característica distintiva de la Cooperación Sur-Sur respecto a la Norte-Sur es:', '{"A": "Mayor volumen de recursos financieros", "B": "Horizontalidad, reciprocidad y transferencia de experiencias entre países con desafíos similares", "C": "Imposición de condicionalidades económicas", "D": "Exclusividad para países de África"}', 'B', 'La CSS se basa en la solidaridad, horizontalidad y mutuo beneficio, a diferencia del esquema donante-receptor tradicional.', 'NAIROBI 2009 / Cooperación Sur-Sur.'),

-- Lección 4
(10, 4, 'SEGIB', '¿Qué es la SEGIB y cuál es su relación con México?', '{"A": "Secretaría General de la Integración Económica de Brasil: México no es miembro", "B": "Secretaría General Iberoamericana: México es miembro activo como parte de la Comunidad Iberoamericana", "C": "Sistema Económico de Gobernanza Internacional Bilateral", "D": "México fundó la SEGIB y tiene sede en Ciudad de México"}', 'B', 'La SEGIB coordina las Cumbres Iberoamericanas. México ha sido país anfitrión en múltiples ocasiones.', 'SEGIB / Cooperación Iberoamericana.'),
(10, 4, 'Eficacia de la Ayuda', '¿Qué establece la Declaración de París (2005) sobre eficacia de la ayuda?', '{"A": "Que los donantes deben imponer sus propias prioridades", "B": "Principios de apropiación, alineación, armonización, gestión por resultados y mutua responsabilidad", "C": "Que la ayuda debe canalizarse solo a través de ONGs", "D": "El aumento obligatorio de la AOD al 1% del PIB"}', 'B', 'La Declaración de París transformó el paradigma de la cooperación hacia la eficacia y el liderazgo del receptor.', 'OCDE / Declaración de París.'),
(10, 4, 'Fondo Climático Verde', '¿Cuál es el principal instrumento financiero multilateral para apoyar a países en desarrollo en materia climática?', '{"A": "FMI Climático", "B": "Fondo Verde para el Clima (GCF)", "C": "Banco Climático de la OCDE", "D": "Fondo PNUD para el Clima"}', 'B', 'El Fondo Verde para el Clima fue establecido en la COP16 de Cancún (2010) y es el principal vehículo del Acuerdo de París para financiamiento climático.', 'UNFCCC / COP16 Cancún.')

ON CONFLICT DO NOTHING;

-- ================================================
-- VERIFICACIÓN: conteo de preguntas por curso
-- ================================================
-- SELECT id_curso, COUNT(*) as total_preguntas
-- FROM public.preguntas
-- GROUP BY id_curso
-- ORDER BY id_curso;
