import { createResponse } from '../_shared/response.ts';
import { getDua } from './get-single-dua.service.ts';
import { supabaseClient } from '../_shared/supabase-client.ts';
import { getDuas } from './get-all-duas.service.ts';

Deno.serve((req: Request) => {
    const { url, method } = req

    if (method === 'OPTIONS') {
        return createResponse(200, {});
    }

    try {
        const urlObj = new URL(url);
        const languageCodes = urlObj.searchParams.get('languages')?.split(',').map(lc => lc.toUpperCase()) || [];
        const page = urlObj.searchParams.get('page');
        const pageSize = urlObj.searchParams.get('size');

        const taskPattern = new URLPattern({ pathname: '/duas/:id' })
        const matchingPath = taskPattern.exec(url)
        const routeName = matchingPath ? matchingPath.pathname.groups.id : null

        if (routeName == null) {
            return getDuas(supabaseClient, languageCodes, +(page ?? 1), +(pageSize ?? 10));
        }
        return getDua(supabaseClient, routeName, languageCodes)
    } catch (error) {
        console.error(error)
        return createResponse(400, { error: (error as Error).message });
    }
})
