export interface DuaLine {
    line_number: number;
    type: string;
    begin_of_section: boolean;
    repetitions_number: number | null;
    dua_line_texts: DuaLineText[];
}

export interface DuaLineText {
    text: string;
    language_code: string;
}

export interface DuaInfo {
    id?: number;
    title: string;
    description: string;
    narrated_by: string;
    language_code: string;
}

export interface Tag {
    name: string;
}

export interface DuaHasTag {
    tags: Tag;
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
}

export interface Dua {
    route_name: string;
    background_image_low_quality_url: string;
    background_image_high_quality_url: string;
    dua_infos: DuaInfo[];
    dua_lines?: DuaLine[];
    dua_has_tags: DuaHasTag[];
    dua_recitations?: DuaRecitation[];
}

export interface DuaView {
    route_name: string;
    image_url: string;
    languages: string[];
    title: { [key: string]: string };
    description: { [key: string]: string };
    narratedBy: { [key: string]: string };
    tags: string[];
    lines: {[key: string]: string | number | boolean | null}[];
    recitations: DuaRecitation[];
}

export interface DuaItemView {
    route_name: string;
    image_url: string;
    languages: string[];
    title: { [key: string]: string };
    description: { [key: string]: string };
    narratedBy: { [key: string]: string };
    tags: string[];
}
