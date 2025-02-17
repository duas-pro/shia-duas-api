import { createResponse } from "../_shared/response.ts";
import { supabaseClient } from "../_shared/supabase-client.ts";

Deno.serve(async (req: Request) => {
  const { url } = req;

  try {
    const taskPattern = new URLPattern({ pathname: "/audios/:uuid" });
    const matchingPath = taskPattern.exec(url);
    const uuid = matchingPath ? matchingPath.pathname.groups.uuid : null;

    if (!uuid) {
      return createResponse(400, {"error": "uuid is a required parameter"})
    }

    const { data, error } = await supabaseClient
      .from("dua_recitations")
      .select(`
        uuid,
        audio_low_quality_url,
        audio_high_quality_url,
        duration_in_ms,
        reciters (
          full_name_tl,
          full_name_ar,
          profile_image_url
        ),
        dua_lines_has_recitations (
          start_time_in_ms
        )
          `)
      .eq("uuid", uuid);

    if (error) {
      console.error(
        "Error while receiving dua audio for " + uuid + ", error: " +
          JSON.stringify(error),
      );
      return createResponse(500, { error: `Internal Server Error` });
    }    
    const duaRecitation = data[0];

    const response = {
      uuid: duaRecitation.uuid,
      audio_low_quality_url: duaRecitation.audio_low_quality_url,
      audio_high_quality_url: duaRecitation.audio_high_quality_url,
      duration_in_ms: duaRecitation.duration_in_ms,
      reciter: duaRecitation.reciters,
      startTimes: duaRecitation.dua_lines_has_recitations.map(l => l.start_time_in_ms) || []
    };

    return createResponse(200, {"data": response})
  } catch (err) {
    return new Response(String(err?.message ?? err), { status: 500 });
  }
});
