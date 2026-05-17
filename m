Return-Path: <linux-leds+bounces-8168-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOKsKZmLCWpXewQAu9opvQ
	(envelope-from <linux-leds+bounces-8168-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 11:34:17 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2190656047D
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 11:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92831301EB7D
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 09:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E1530C14F;
	Sun, 17 May 2026 09:33:42 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EA135AC10
	for <linux-leds@vger.kernel.org>; Sun, 17 May 2026 09:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779010422; cv=none; b=bLirmXl49R/DGgd+IeMkEQUTEgvOwFzrs3FVHDj7cDNRKB0PstHVLClvhs27/GsQdEztQik1XyHXQGytQFKF/IT7P6U3JZdy1MPniPZ0QT4EBYiNNRaDoBFcbdckND9EPZ+8SVloD4GPUX4y9960JS48krnE7k8Y4bQr0Orz16A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779010422; c=relaxed/simple;
	bh=jpgQufVZ1nva1OHdK04aUbJPiKH6f6T/9AOq8CpGXmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMqteqm5EzvmU+xjHL2/vOijaFYZf9WFCmctDhKpdLm0C/+uZGjMDx7gC828VRa5DgOzpF3FzhqzQJ5ZQHGz+9S7zLf+WvBfMgCjx5QS+ZUXKM4pTtI7F3pneTD1EpG2Abyq+m7WD+q6hjV9RSHIF6H3bmKRp7ipseCgrsmv8Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1wOXs0-0005Er-8O; Sun, 17 May 2026 11:33:12 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1wOXrw-000PBc-2L;
	Sun, 17 May 2026 11:33:09 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1wOXrx-0000000CT4S-0jtc;
	Sun, 17 May 2026 11:33:09 +0200
Date: Sun, 17 May 2026 11:33:09 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Carlo Szelinsky <github@szelinsky.de>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH net-next v5 2/2] net: pse-pd: add LED trigger support via
 notification path
Message-ID: <agmLVW-WfHf3S_2J@pengutronix.de>
References: <20260505015759.831393-1-kuba@kernel.org>
 <20260516101759.1686592-1-github@szelinsky.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260516101759.1686592-1-github@szelinsky.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Rspamd-Queue-Id: 2190656047D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8168-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DMARC_NA(0.00)[pengutronix.de];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,pengutronix.de:url,pengutronix.de:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Carlo,

Thank you for your work!

On Sat, May 16, 2026 at 12:17:59PM +0200, Carlo Szelinsky wrote:
> Hi Jakub,
> 
> Thanks for the second pass! I went through all four points and
> would love to clarify some points before moving on to v6. 
> Replying inline again:
> 
> On Mon, 4 May 2026 18:57:59 -0700 Jakub Kicinski wrote:
> > > +	pcdev->pi_led_trigs = devm_kcalloc(dev, pcdev->nr_lines,
> > > +					   sizeof(*pcdev->pi_led_trigs),
> > > +					   GFP_KERNEL);
> >
> > Since devm resources are released in strict LIFO order, and pi_led_trigs
> > is allocated here after the regulators are registered in
> > pse_controller_register(), will the pi_led_trigs array be freed before
> > the regulators are unregistered on driver unbind?
> >
> > When the regulator core later unregisters the regulators and flushes
> > pending disables, could it invoke pse_pi_disable() and call pse_led_update(),
> > dereferencing the dangling pcdev->pi_led_trigs pointer?
> 
> Yes, seems to be real: devm LIFO frees pi_led_trigs before the 
> regulators get unregistered. If a deferred disable fires during
> regulator_unregister() (via flush_work on rdev->disable_work),
> pse_pi_disable() runs and pse_led_update() walks freed memory.
> 
> But for one piece I got a question: the same path also touches
> pcdev->pi. pse_pi_disable() calls _pse_pi_disable(), before:
> pse_led_update(), and _pse_pi_disable() derefs pcdev->pi[id]
> (via pse_pi_deallocate_pw_budget(&pcdev->pi[id]) and
> pcdev->pi[id].pw_d). pcdev->pi is already freed by
> pse_release_pis() in pse_controller_unregister(). So setting
> pi_led_trigs NULL only fixes the LED half, or?
> 
> Should v6 also handle pcdev->pi here (NULL after
> kfree, plus a guard in _pse_pi_disable)? Feels like the same
> class of bug as 1/2's reorder, just on the regulator-cleanup
> path. Or is a separate fix outside this patch series better?

Please, send fixes for existing bugs separately for stable fixes. 

> > > +	for (i = 0; i < pcdev->nr_lines; i++) {
> > > +		struct pse_pi_led_triggers *trigs = &pcdev->pi_led_trigs[i];
> > [...]
> > > +		trigs->delivering.name = devm_kasprintf(dev, GFP_KERNEL,
> > > +							"pse-%s:port%d:delivering",
> > > +							dev_id, i);
> > [...]
> > > +		ret = devm_led_trigger_register(dev, &trigs->delivering);
> >
> > Regulators are exposed before this code runs in pse_controller_register().
> > What happens if a consumer calls regulator_enable() concurrently?
> > [...] Since devm_led_trigger_register() hasn't initialized the trigger's
> > internal led_cdevs list head yet, will led_trigger_event() attempt to
> > iterate a zeroed memory list and cause a NULL pointer dereference?
> 
> Right, but the window is microseconds wide (between setting
> trigs->delivering.name and devm_led_trigger_register() returning).
> You'd need a consumer racing during probe to hit it, right?
> 
> The fix seems to be simple: move pse_led_triggers_register() before the
> regulator loop in pse_controller_register(). of_load_pse_pis()
> runs earlier so pi[]/pi[i].np is already filled in, which is
> all the trigger loop needs. Regulators only get exposed after
> triggers are fully registered, no race window left.
> 
> Question: Do you agree with that solution for v6?

Sounds plausible.

> > > +	ret = pse_led_triggers_register(pcdev);
> > > +	if (ret) {
> > > +		/* LED triggers are non-essential for power delivery; warn
> > > +		 * and continue. [...]
> > > +		dev_warn(pcdev->dev, "Failed to register LED triggers: %d\n",
> > > +			 ret);
> > > +		pcdev->pi_led_trigs = NULL;
> > > +	}
> >
> > If pse_led_triggers_register() fails halfway through, the device probe
> > still succeeds, which means devm cleanup will not run. Could the
> > successfully registered LED triggers from earlier loop iterations remain
> > registered indefinitely with the LED subsystem?
> 
> Would love to clarify this one with you as well: devm cleanup does still run
> on driver unbind, since devm_led_trigger_register() attaches a
> per-call release action. So the partially-registered triggers
> stay in sysfs until unbind, but they're not leaked across it.
> And with pi_led_trigs = NULL, pse_led_update() short-circuits
> so the orphans never fire either. So practically they're inert
> sysfs entries until unbind, not a leak.
> 
> That said, I agree the "warn and orphan" middle ground is a bit
> weird. So which path should I follow:
> 
> 1) treat LED reg failure as fatal: return ret, fail probe.
> Smallest change, matches the rest of the function. The
> "non-essential" framing was mine, happy to drop it.
> 2) wrap the registration in a devres group so partial
> failures roll back the triggers we did manage to register.
> 3) leave as-is, since devm already cleans up on unbind.
> 
> I'd go with 1) since OOM during probe is fatal for most things
> anyway, but happy to do 2) or 3) if you have a preference.

1 feels for me as most straightforward way. I would expect to see this
kind of errors in a pre-production phase not in the end product.

> > > +		/* Update LEDs for described PIs regardless of consumer state.
> > [...]
> > > +		if (pcdev->no_of_pse_pi || pcdev->pi[i].np)
> > > +			pse_led_update(pcdev, i);
> >
> > The docstring for pse_led_update() requires it to be called with pcdev->lock
> > held. Does calling it here locklessly inside the event handler violate
> > that locking contract?
> 
> From what I see, both callers of pse_handle_events() hold pcdev->lock
> across the call:
> 
> * pse_isr() takes mutex_lock(&pcdev->lock) at line 1524, then
>   calls pse_handle_events() at line 1531.
> * pse_poll_worker() takes mutex_lock(&pcdev->lock) at line 1547,
>   then calls pse_handle_events() at line 1551.
> 
> So pse_led_update() is running with the lock held in both paths.
> 
> Tbh I don't get completely what the AI is flagging here, or is
> this a false positive?

Yes.

> If false positive, I'd still add
> lockdep_assert_held(&pcdev->lock) in pse_led_update() and
> pse_handle_events() to make the contract explicit and catch any
> future caller that forgets, but that would be documentation,
> not a bug fix.

I do not know what here went wrong, too much context?

In the raw log it looks like LLM was able to detect proper locking:
https://sashiko.dev/#/log/35678

"I'm seeing that in `pse_controller_register`, the code takes the mutex,
iterates and calls `pse_led_update`. Also, in `pse_handle_events`, this
is happening again, and this is called from `pse_isr` with
`mutex_lock(&pcdev->lock)`. And in `pse_pi_enable`, it's again called
within the mutex. So, `pse_led_update` *always* seems to be called with
the lock held. This is consistent and good."

And later:

"However, there's no evidence that `pcdev->lock` is held inside
`pse_handle_events`. Furthermore, the code uses a separate
`ntf_fifo_lock`."

We can ignore it. In case if you cares, lockdep_assert_held() sounds
good, comments can be misread. I would add it to pse_handle_events(), it
will make it fully visible for AI and detectable by CI.

> So plan for v6 [2/2], pending your answers:
> * NULL pcdev->pi_led_trigs in pse_controller_unregister()
>   (and possibly NULL pcdev->pi too, depending on your answer?)
> * move pse_led_triggers_register() before the regulator loop
> * add lockdep_assert_held() (assuming is a false positive)
> * whichever option you pick for question 3?
> 
> Depending on what we do with [1/2], I'll roll v6 with your
> decisions baked in.
> 
> Sorry for the long text...
> 
> Cheers,
> Carlo


Thank you!

Best Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

