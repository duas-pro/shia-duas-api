export const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey',
    'Access-Control-Allow-Methods': 'POST, GET, OPTIONS, PUT, DELETE',
}

export function createResponse(status: number, data: any) {
    return new Response(JSON.stringify(data), {
        headers: {...corsHeaders, 'Content-Type': 'application/json'},
        status: status,
    });
}
