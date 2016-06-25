package com.objectstyle.bq_demo;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Configuration;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.UriInfo;

import com.google.inject.Binder;
import com.google.inject.Module;
import com.nhl.bootique.Bootique;
import com.nhl.bootique.jersey.JerseyModule;
import com.nhl.link.rest.DataResponse;
import com.nhl.link.rest.LinkRest;
import com.objectstyle.bq_demo.cayenne.Artist;

public class App implements Module {

	public static void main(String[] args) {
		Bootique.app(args).module(App.class).autoLoadModules().run();
	}

	@Override
	public void configure(Binder binder) {
		JerseyModule.contributeResources(binder).addBinding().to(Api.class);
	}

	@Path("/")
	public static class Api {

		@Context
		Configuration config;

		@GET
		@Produces(MediaType.APPLICATION_JSON)
		public DataResponse<Artist> get(@Context UriInfo uri) {
			return LinkRest.select(Artist.class, config).uri(uri).select();
		}
	}
}
