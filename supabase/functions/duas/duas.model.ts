export interface DuaLine {
  id: number;
  line_number: number;
  type: string;
  begin_of_section: boolean;
  repetitions_number: number | null;
  dua_line_texts: DuaLineText[];
}

export interface DuaLineText {
  id: number;
  text: string;
  language_code: string;
  section_title: string | null;
}

export interface DuaLineTranslation {
  text: string;
  language: string;
  section_title: string | null;
}

export interface DuaLineView {
  line_number: number;
  begin_of_section?: boolean;
  type?: string;
  repetitions_number?: number;
  translations: DuaLineTranslation[];
}

export interface DuaInfo {
  id?: number;
  title: string;
  description: string;
  seo_description: string;
  language_code: string;
  word_count: number;
}

export interface Reciter {
  full_name_tl: string;
  full_name_ar: string;
  profile_image_url: string;
}

export interface DuaRecitation {
  uuid: string;
  duration_in_ms: number;
  audio_low_quality_url?: string;
  audio_high_quality_url?: string;
  reciter: Reciter;
  audio_plays: number;
  api_calls: number;
}

export interface DuaCollection {
  id: number;
  slug: string;
  image_url: string;
  title: { [key: string]: string };
  description: { [key: string]: string };
  seo_description: { [key: string]: string };
}

export interface Dua {
  slug: string;
  background_image_low_quality_url: string;
  background_image_high_quality_url: string;
  page_views: number;
  api_calls: number;
  narrator: string;
  book: string;
  dua_infos: DuaInfo[];
  dua_lines?: DuaLine[];
  tags: string[];
  dua_recitations?: DuaRecitation[];
}

export interface DuaView {
  slug: string;
  image_url: string;
  languages: string[];
  title: { [key: string]: string };
  description: { [key: string]: string };
  seo_description: { [key: string]: string };
  word_count: { [key: string]: number };
  narrator: string;
  book: string;
  tags: string[];
  lines: DuaLineView[];
  recitations: DuaRecitation[];
  collections: DuaCollection[];
}

export interface DuaItemView {
  slug: string;
  image_url: string;
  languages: string[];
  title: { [key: string]: string };
  description: { [key: string]: string };
  narrator: string;
  tags: string[];
}
