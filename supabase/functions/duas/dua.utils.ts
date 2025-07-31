import { DuaInfo, DuaLine } from "./duas.model.ts";

export function formatDuaInfos(duaInfos: DuaInfo[]): { 
    title: { [key: string]: string },
    description: { [key: string]: string },
    seoDescription: { [key: string]: string },
    wordCount: { [key: string]: number },
    } {
    const title: { [key: string]: string } = {};
    const description: { [key: string]: string } = {};
    const seoDescription: { [key: string]: string } = {};
    const wordCount: { [key: string]: number } = {};

    duaInfos.forEach(duaInfo => {
        const languageCode = duaInfo.language_code;
        title[languageCode] = duaInfo.title;
        description[languageCode] = duaInfo.description;
        seoDescription[languageCode] = duaInfo.seo_description;
        wordCount[languageCode] = duaInfo.word_count;
    });
        
    return { title, description, seoDescription, wordCount };
}

export function formatDuaLines(duaLines: DuaLine[]): { [key: string]: string | number | boolean | null }[] {
    const lines: {
        [key: string]: string | number | boolean | null
    }[] = [];

    duaLines.forEach(duaLine => {
        const newLine: {
            [key: string]: string | number | boolean | null
        } = {}
        
        if (duaLine.repetitions_number) {
            newLine["repetitions_number"] = duaLine.repetitions_number;
        }
        if (duaLine.begin_of_section) {
            newLine["begin_of_section"] = duaLine.begin_of_section;
        }
        if (duaLine.type !== "SUPPLICATION") {
            newLine["type"] = duaLine.type;
        }

        duaLine.dua_line_texts.forEach(duaLineText => {
            newLine[duaLineText.language_code] = duaLineText.text;
        });

        lines.push(newLine);
    });

    return lines;
}
