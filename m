Return-Path: <linux-leds+bounces-1621-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 042558BDD10
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2024 10:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9802A1F231D3
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2024 08:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8289913C906;
	Tue,  7 May 2024 08:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="euYnEslD"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5438913C8FE;
	Tue,  7 May 2024 08:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715070200; cv=none; b=DMgm0krMtD93CDCJpghr/i/gVDDBzgRlLmDNn6G6KtMY05jpHyBLg6BY4pCm79dotdhf3Dn0PS/qqu5cvkf7n/hrPElea6YLEEIJUMBPQeV/4vkzrgP3XMWaR0Xq/vtox50d7kKyGEgh7FruT6kopQj469X6yCUcdsnHQYvLUpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715070200; c=relaxed/simple;
	bh=QxX4b7q5XOeUTB4IiEc4dG0x64/1OCYe/75fyaZndHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXcXsrZmWYgrLRTJE8ftImt9Tbc76/qHlcKrYv3lCxzFX+tey6RfHmDn0B3v5CG9Rjx7MdGQXI84vpbL7BC8KU8bTvLEWPTTOmiONUdEpi5q41JqT+6RAKa3DnfjB2W/Be3j8S0lczv1kqUwVP3lQiEEQhFO5t+H2zPcHhqXb0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=euYnEslD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD19C2BBFC;
	Tue,  7 May 2024 08:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715070199;
	bh=QxX4b7q5XOeUTB4IiEc4dG0x64/1OCYe/75fyaZndHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=euYnEslDreQIgjsExv5pQhTSYbvEKH0VOQM+I60M3KW8WozW+xl0WPGbFOaTLAoAb
	 /V/l5Sd0Kip9+SG1+lwlsqE6EzQ2QDTtH1JcQRl9SR+sYfrbTIhujenn2HjtkUmgoB
	 8JkhC7UDf2kHcQZFtTKw7GLOxtgRwgiFgPl7o+WtMTCHDNQRrbMZerM6Wxlh8+daVy
	 K5fCxgZyqWPf4Ul8hJ+9+zGkJ2bkKQCaQQTRUbyEKLMBmwK5lc8ioBoqaIRNzVLddE
	 cJHawYtzqZOSCfMVfGcM9Tfj/khOJBJ+h/1BxdtGbwX7bhlv4bkCTMMgoXWE6ze8R/
	 PvnCf1OOYTHzw==
Date: Tue, 7 May 2024 09:23:15 +0100
From: Lee Jones <lee@kernel.org>
To: Ben Greear <greearb@candelatech.com>
Cc: "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
	LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: 6.9.0-rc2+ kernel hangs on boot (bisected, maybe LED related)
Message-ID: <20240507082315.GS1227636@google.com>
References: <30819e01-43ce-638f-0cc6-067d6a8d03c7@candelatech.com>
 <89a9eec3-337f-3c9f-6bbe-00a26a15287c@candelatech.com>
 <20240411070718.GD6194@google.com>
 <de43c7e1-7e8c-bdbe-f59e-7632c21da24a@candelatech.com>
 <8736ebc8881e1e0cabfbbf033725a3123a5e8e90.camel@sipsolutions.net>
 <bc420f3a-5809-4c4a-80ad-ccd8a46853b6@leemhuis.info>
 <8ab88be5de30bcbd0d1cac3cfde6b2085dcfc8fb.camel@sipsolutions.net>
 <0197efe8-828b-43ae-85c9-5d521913a289@leemhuis.info>
 <20240502071908.GB5338@google.com>
 <8054cc9c-fbfe-a08d-5968-57b90a25af65@candelatech.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8054cc9c-fbfe-a08d-5968-57b90a25af65@candelatech.com>

On Sat, 04 May 2024, Ben Greear wrote:

> On 5/2/24 00:19, Lee Jones wrote:
> > On Tue, 23 Apr 2024, Linux regression tracking (Thorsten Leemhuis)
> > wrote:
> > 
> > > On 23.04.24 11:06, Johannes Berg wrote:
> > > > On Tue, 2024-04-23 at 11:00 +0200, Linux regression tracking
> > > > (Thorsten Leemhuis) wrote:
> > > > > On 16.04.24 08:17, Johannes Berg wrote:
> > > > > > On Mon, 2024-04-15 at 13:37 -0700, Ben Greear wrote:
> > > > > > > 
> > > > > > > Johannes, you had another suggestion: changing iwlwifi's
> > > > > > > request_module() to request_module_nowait() in
> > > > > > > iwl_req_fw_callback()
> > > > > > > 
> > > > > > > Is that still best thing to try in your opinion?
> > > > > > 
> > > > > > I guess so, I don't have any better ideas so far anyway ...
> > > > > 
> > > > > [adding the iwlwifi maintainer; thread starts here:
> > > > > https://lore.kernel.org/lkml/30f757e3-73c5-5473-c1f8-328bab98fd7d@candelatech.com/
> > > > > 
> > > > > ]
> > > > > 
> > > > > Johannes, Miri, what's the status wrt to this regression? From
> > > > > here things look somewhat stalled -- but maybe there was
> > > > > progress and I just missed it.
> > > > 
> > > > What do you want? It got bisected to an LED merge, but you ping
> > > > _us_? Way to go ...
> > > 
> > > Sorry, to me it sounded a bit like you had an idea for a fix and
> > > were going to give it a try -- similar to how the maintainers for
> > > a r8169 driver and the igc driver provided fixes for bugs recent
> > > LED changes exposed.
> > > 
> > > But sure, you are right, in the end some LED change seems to have
> > > cause this, so the duty to fix it lies in that field. Therefore:
> > > 
> > > Lee, what's the status here to get this fixed before the final?
> > 
> > No idea.  Did you send a fix?
> 
> I sent what is probably just a work-around.  I also spent time
> bisecting and testing. The problem appears to have come in with the
> LED related merge.  I think it is fair to ask the LED folks to at
> least take a look at the lockdep debugging I posted.

I can't speak for Pavel, but I personally have no way of debugging or
reproducing this.  The only usefulness I can provide is to review and
apply fixes as and when they appear.

> It is not fair to expect anyone that manages to find or track a bug to
> also fix it.

No such expectation has been felt or communicated.

-- 
Lee Jones [李琼斯]

