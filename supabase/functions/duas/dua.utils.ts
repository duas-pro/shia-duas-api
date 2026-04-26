import { DuaInfo, DuaLine, DuaLineView } from "./duas.model.ts";

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

export function formatDuaLines(duaLines: DuaLine[]): DuaLineView[] {
    return duaLines.map(duaLine => {
        const line: DuaLineView = {
            line_number: duaLine.line_number,
            translations: duaLine.dua_line_texts.map(t => ({
                text: t.text,
                language: t.language_code,
                section_title: t.section_title ?? null,
            })),
        };

        if (duaLine.begin_of_section) line.begin_of_section = true;
        if (duaLine.type !== "SUPPLICATION") line.type = duaLine.type;
        if (duaLine.repetitions_number) line.repetitions_number = duaLine.repetitions_number;

        return line;
    });
}
