
return {

	"sphamba/smear-cursor.nvim",

	event = "VeryLazy",

	opts = {

		-- Couleur de la traînée (code hex)

		cursor_color = "#C9AB6B",



		-- Mouvement plus fluide

		time_interval = 17,

		stiffness = 0.8,

		trailing_stiffness = 0.6,

		stiffness_insert_mode = 0.7,

		trailing_stiffness_insert_mode = 0.7,

		damping = 0.95,

		damping_insert_mode = 0.95,

		distance_stop_animating = 0.5,



		-- Particules et traînée moins "carrées" (remets false si tu vois des trous)

		legacy_computing_symbols_support = false,



		-- Particules

		particles_enabled = true,

		particle_spread = 1,

		particles_per_second = 300,

		particles_per_length = 30,

		particle_max_lifetime = 600,

		particle_max_initial_velocity = 15,

		particle_velocity_from_cursor = 0.4,

		particle_damping = 0.2,

		particle_gravity = -30,

		min_distance_emit_particles = 0,

	},

}

