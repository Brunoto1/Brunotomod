extern float green;

extern vec2 mouse_screen_pos;

extern float screen_scale;
extern float hovering;
extern float dissolve;
extern float time;

extern vec2 texture_details;
extern vec2 image_details;

extern vec4 burn_colour_1;
extern vec4 burn_colour_2;

extern bool shadow;

vec4 effect(vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords)
{
    vec4 col = Texel(texture, texture_coords);

    float dummy =
        mouse_screen_pos.x +
        mouse_screen_pos.y +
        screen_scale +
        hovering +
        dissolve +
        time +
        texture_details.x +
        texture_details.y +
        image_details.x +
        image_details.y +
        burn_colour_1.r +
        burn_colour_2.r;

    if (shadow)
        dummy += 1.0;

    col.r = 0.0;
    col.g += green * 0.000001;
    col.b = 0.0;

    // Fuerza al compilador a mantener los uniforms
    col.g += dummy * 0.000001;

    return col * colour;
}