Return-Path: <linux-leds+bounces-8169-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNKXBkGRCWrIfwQAu9opvQ
	(envelope-from <linux-leds+bounces-8169-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 11:58:25 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD2C5605A0
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 11:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75C81301C169
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 09:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A6A3587DE;
	Sun, 17 May 2026 09:57:44 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35F134F498
	for <linux-leds@vger.kernel.org>; Sun, 17 May 2026 09:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779011864; cv=none; b=ZXfzAeKfzw9X2eR4nhL1FsEbe8+R8s1cbLNT3y0ZNGvmYddzajk5NKMbI32H3x/stxPYF6mh8P5GONxChRWu0PfKudLttiBs8w2SxSlFjE8PVNni3QdLaghc3G64D37kGvmrY8qb6zsb6FGTr/gn07GeCpOyOhG/DAYEXs5B4HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779011864; c=relaxed/simple;
	bh=9yxTgSmcxMcQF7W/Zfd9dDhpHTGFsYq+RF8Gcosneng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqtHY3/wSeMYFcHHR0p7RTVMdLDMLWdwRmcXQOo8fGjS3xCCHHuDn1Lxxn8zFxPyEp5D8KwYhxGawJYLLpXt0PN5knpBNmHI/dVkFgk8iC6rPXYzJGOnreCxVib8lbupEjPJOR4/IIhZZ4bmjOdVYhIiT9VOYTI8CFObP3PMkLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1wOYFS-0006Jt-Pd; Sun, 17 May 2026 11:57:26 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1wOYFR-000PHi-1w;
	Sun, 17 May 2026 11:57:26 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1wOYFS-0000000CTNw-0CKx;
	Sun, 17 May 2026 11:57:26 +0200
Date: Sun, 17 May 2026 11:57:26 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Carlo Szelinsky <github@szelinsky.de>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH net-next v5 1/2] net: pse-pd: add devm_pse_poll_helper()
Message-ID: <agmRBryQW3PkcJMJ@pengutronix.de>
References: <20260505015757.831372-1-kuba@kernel.org>
 <20260516101720.1686465-1-github@szelinsky.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260516101720.1686465-1-github@szelinsky.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Rspamd-Queue-Id: 9DD2C5605A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8169-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DMARC_NA(0.00)[pengutronix.de];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:url,pengutronix.de:mid]
X-Rspamd-Action: no action

On Sat, May 16, 2026 at 12:17:20PM +0200, Carlo Szelinsky wrote:
> Hi Jakub,
> 
> Thanks for sending the AI review. I checked the code again... both
> points are real, but one of them looks to me like more theory than practice.
> Out of curiosity, what prompt do you use for these reviews, so I can use it 
> before sending the next version?

Sashiko is using https://github.com/masoncl/review-prompts

I personally run pre-review with opencode + review-prompts +
 gemini-3.1-pro-preview-customtools / or claude-sonnet-4-5

After installing review-prompts to opencode config the review can be
done with "/kreview commit_id"

But sashiko still finds things, i do not know what is the difference.

> Replying inline:
> 
> On Mon, 4 May 2026 18:57:57 -0700 Jakub Kicinski wrote:
> > > @@ -1118,6 +1125,8 @@ void pse_controller_unregister(struct pse_controller_dev *pcdev)
> > >  	pse_release_pis(pcdev);
> > >  	if (pcdev->irq)
> > >  		disable_irq(pcdev->irq);
> > > +	if (pcdev->polling)
> > > +		cancel_delayed_work_sync(&pcdev->poll_work);
> >
> > Because pse_release_pis() executes kfree(pcdev->pi) before the delayed work
> > is cancelled, can pse_poll_worker() run concurrently and access the freed
> > pcdev->pi array inside pse_handle_events() before the cancellation completes?
> 
> Yes, seems like a real bug. The IRQ thread and the poll worker can still run
> after pse_release_pis() frees pcdev->pi, and both end up in
> pse_handle_events() touching pcdev->pi[i]. We need to stop them
> first. v6 will reorder pse_controller_unregister() to:
> 
> 	if (pcdev->irq)
> 		disable_irq(pcdev->irq);
> 	if (pcdev->polling)
> 		cancel_delayed_work_sync(&pcdev->poll_work);
> 	cancel_work_sync(&pcdev->ntf_work);
> 	pse_release_pis(pcdev);
> 
> The IRQ side seem to be already broken before this patch. I went
> through the git log:
> 
> * fc0e6db30941 ("net: pse-pd: Add support for reporting events")
>   added pse_isr but never called disable_irq() in unregister at all.
> * ffef61d6d273 ("net: pse-pd: Add support for budget evaluation
>   strategies") added the disable_irq() call, but put it in the
>   wrong place (after pse_release_pis()).
> 
> What do you suggest to do, I could imagine: ... 
> 
> 1) Send the fix as a standalone "Fixes:" patch to net first,
>    then rebase v6 on top once it lands? Or fold it into v6 as
>    patch 1/3? My vote is standalone since the fix stands on its
>    own, but up to you.

Yes, please send the fix to stable. In this case you will need to wait
until net-next includes stable fixes.

> 2) Which commit for the Fixes: tag? I'd pick ffef61d6d273
>    (that's where the broken order came from), but fc0e6db30941
>    also works (no protection at all back then). wdyt?

If it is introduce by ffef61d6d273, then use this for Fixes.

> > > +int devm_pse_poll_helper(struct pse_controller_dev *pcdev,
> > > +			 const struct pse_irq_desc *d)
> > > +{
> > [...]
> > > +	queue_delayed_work(system_freezable_wq, &pcdev->poll_work,
> > > +			   msecs_to_jiffies(pcdev->poll_interval_ms));
> >
> > Since memory is allocated with devm_ helpers but no devm cleanup action is
> > registered to cancel the delayed work, what happens if a driver's probe
> > function encounters an error after calling this helper? [...]
> >
> > The commit message mentions that drivers typically set up the helper before
> > registering the controller. If queue_delayed_work() schedules the worker
> > to run before devm_pse_controller_register() completes, will
> > pse_poll_worker() attempt to acquire pcdev->lock and push events into
> > pcdev->ntf_fifo before they are initialized?
> 
> The probe-failure case is a real bug. If probe fails between this
> helper and devm_pse_controller_register(), the work stays queued
> and fires later on a pcdev whose devres memory is gone. UAF.
> 
> The "worker fires before mutex/kfifo are ready" case is real in
> theory, but I don't think you can actually hit it?! Default
> poll_interval_ms is 1000 ms, so pse_controller_register() would
> need to take over a second to lose the race. Worth fixing to keep
> the code clean, but not urgent or?

The probe() is a process and can be outscheduled by any high prio process
at any time. May be on a single core SoC with pse-pd core build
as module and squashfs root it will make the boot load heavy enough
to reproduce it?

> Same fix for both: move queue_delayed_work() out of the helper.
> The helper just allocates the state and does INIT_DELAYED_WORK.
> pse_controller_register() then arms the work as the very last
> step on success, gated on pcdev->polling. So the work only ever
> runs when everything is set up AND register has succeeded.

Sounds good.

> Should I fix both in v6, or just the probe-failure leak? One
> change covers both, so I would suggest to do both. wdyt?

Fixes for pre-existing bugs to net, new bugs to net-next :) 

Best Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

