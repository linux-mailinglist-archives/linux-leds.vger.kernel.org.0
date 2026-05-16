Return-Path: <linux-leds+bounces-8144-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJlpHnNECGrphAMAu9opvQ
	(envelope-from <linux-leds+bounces-8144-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 12:18:27 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E964355B19A
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 12:18:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5CAF301BEC7
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 10:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229C63D413D;
	Sat, 16 May 2026 10:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b="N+UKmX2v"
X-Original-To: linux-leds@vger.kernel.org
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A863D410B;
	Sat, 16 May 2026 10:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.127.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778926688; cv=none; b=FNT+c/N7hpla3K3QvWjPHKWVHukY82dh0jk6BfvVCr1AT705tnqExWnApkJdNrJQPeRk154VY3+skv5q3AJeFaPPmn/JqDNYIRV95JAjvWqsb/CDtByj4FQMeAxrswZgBBwGS/mEtkO77KWe7N85pWt5vTrjvVFjDUsKVyDsd6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778926688; c=relaxed/simple;
	bh=DI2H3odz9igGDZefixGC7J4ofaz8QQ17m+7X51yHAok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bPXo5pvB4WpfNcBojFmvT37HfWs3hHOmLlU1RzLe+pO//qhwphv/By0SA6ry+Py2dHQBlSwVCDVIsZmd7deo7N1fLTrbPM6IBMM9q+TJX+dBHS6hv6g+a/B5F4nt3Ikf3HwYtSJG3nsIZBoEXrBsGQiJygaBxTb22HKzoy9byms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de; spf=pass smtp.mailfrom=szelinsky.de; dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b=N+UKmX2v; arc=none smtp.client-ip=85.214.127.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 4262EE8318C;
	Sat, 16 May 2026 12:18:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1778926683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TQGOF48RZlCgdcLIv13iEIDRIt2Z9P1Adet0sn3KxQ0=;
	b=N+UKmX2vAXSi1dYuqqNTBFpti21pCgTfzAcAunwPx9mO2vxvuY7/KK2BL5Ifj/vYvhV6Za
	uXQR4GYKz8Sb8wElgEaQ6oQjKVrjEEMwnPQ5Kw6H6Fx1xnvIrnKRbC/deqHPHKYWtokYcz
	2Rer0LA5FbhKa4WXPh3mOKNhor7rs1HangXSJMPLV7wm70wO7NmGNOBjZtYgnIQ8io+72g
	g0yhCLcHGfP8FbBGSqS/gDhw8KCZO1TCn6/iGTz5wHMQoX5LuNqev5xr0RrkRVSAIkSQam
	c1pavoJFglaGPPITf468wAydGLQjdqmRHSR5e9ycE2SD7bw+MGXcFjxEsguZjQ==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id aX5cp-AK3E5x; Sat, 16 May 2026 12:18:03 +0200 (CEST)
Received: from p14sgen5.fritz.box (p578439b8.dip0.t-ipconnect.de [87.132.57.184])
	by szelinsky.de (Postfix) with ESMTPSA;
	Sat, 16 May 2026 12:18:02 +0200 (CEST)
From: Carlo Szelinsky <github@szelinsky.de>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Carlo Szelinsky <github@szelinsky.de>
Subject: Re: [PATCH net-next v5 2/2] net: pse-pd: add LED trigger support via notification path
Date: Sat, 16 May 2026 12:17:59 +0200
Message-ID: <20260516101759.1686592-1-github@szelinsky.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505015759.831393-1-kuba@kernel.org>
References: <20260505015759.831393-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E964355B19A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[szelinsky.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[szelinsky.de:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8144-lists,linux-leds=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github@szelinsky.de,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[szelinsky.de:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[szelinsky.de:mid,szelinsky.de:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Jakub,

Thanks for the second pass! I went through all four points and
would love to clarify some points before moving on to v6. 
Replying inline again:

On Mon, 4 May 2026 18:57:59 -0700 Jakub Kicinski wrote:
> > +	pcdev->pi_led_trigs = devm_kcalloc(dev, pcdev->nr_lines,
> > +					   sizeof(*pcdev->pi_led_trigs),
> > +					   GFP_KERNEL);
>
> Since devm resources are released in strict LIFO order, and pi_led_trigs
> is allocated here after the regulators are registered in
> pse_controller_register(), will the pi_led_trigs array be freed before
> the regulators are unregistered on driver unbind?
>
> When the regulator core later unregisters the regulators and flushes
> pending disables, could it invoke pse_pi_disable() and call pse_led_update(),
> dereferencing the dangling pcdev->pi_led_trigs pointer?

Yes, seems to be real: devm LIFO frees pi_led_trigs before the 
regulators get unregistered. If a deferred disable fires during
regulator_unregister() (via flush_work on rdev->disable_work),
pse_pi_disable() runs and pse_led_update() walks freed memory.

But for one piece I got a question: the same path also touches
pcdev->pi. pse_pi_disable() calls _pse_pi_disable(), before:
pse_led_update(), and _pse_pi_disable() derefs pcdev->pi[id]
(via pse_pi_deallocate_pw_budget(&pcdev->pi[id]) and
pcdev->pi[id].pw_d). pcdev->pi is already freed by
pse_release_pis() in pse_controller_unregister(). So setting
pi_led_trigs NULL only fixes the LED half, or?

Should v6 also handle pcdev->pi here (NULL after
kfree, plus a guard in _pse_pi_disable)? Feels like the same
class of bug as 1/2's reorder, just on the regulator-cleanup
path. Or is a separate fix outside this patch series better?

> > +	for (i = 0; i < pcdev->nr_lines; i++) {
> > +		struct pse_pi_led_triggers *trigs = &pcdev->pi_led_trigs[i];
> [...]
> > +		trigs->delivering.name = devm_kasprintf(dev, GFP_KERNEL,
> > +							"pse-%s:port%d:delivering",
> > +							dev_id, i);
> [...]
> > +		ret = devm_led_trigger_register(dev, &trigs->delivering);
>
> Regulators are exposed before this code runs in pse_controller_register().
> What happens if a consumer calls regulator_enable() concurrently?
> [...] Since devm_led_trigger_register() hasn't initialized the trigger's
> internal led_cdevs list head yet, will led_trigger_event() attempt to
> iterate a zeroed memory list and cause a NULL pointer dereference?

Right, but the window is microseconds wide (between setting
trigs->delivering.name and devm_led_trigger_register() returning).
You'd need a consumer racing during probe to hit it, right?

The fix seems to be simple: move pse_led_triggers_register() before the
regulator loop in pse_controller_register(). of_load_pse_pis()
runs earlier so pi[]/pi[i].np is already filled in, which is
all the trigger loop needs. Regulators only get exposed after
triggers are fully registered, no race window left.

Question: Do you agree with that solution for v6?

> > +	ret = pse_led_triggers_register(pcdev);
> > +	if (ret) {
> > +		/* LED triggers are non-essential for power delivery; warn
> > +		 * and continue. [...]
> > +		dev_warn(pcdev->dev, "Failed to register LED triggers: %d\n",
> > +			 ret);
> > +		pcdev->pi_led_trigs = NULL;
> > +	}
>
> If pse_led_triggers_register() fails halfway through, the device probe
> still succeeds, which means devm cleanup will not run. Could the
> successfully registered LED triggers from earlier loop iterations remain
> registered indefinitely with the LED subsystem?

Would love to clarify this one with you as well: devm cleanup does still run
on driver unbind, since devm_led_trigger_register() attaches a
per-call release action. So the partially-registered triggers
stay in sysfs until unbind, but they're not leaked across it.
And with pi_led_trigs = NULL, pse_led_update() short-circuits
so the orphans never fire either. So practically they're inert
sysfs entries until unbind, not a leak.

That said, I agree the "warn and orphan" middle ground is a bit
weird. So which path should I follow:

1) treat LED reg failure as fatal: return ret, fail probe.
Smallest change, matches the rest of the function. The
"non-essential" framing was mine, happy to drop it.
2) wrap the registration in a devres group so partial
failures roll back the triggers we did manage to register.
3) leave as-is, since devm already cleans up on unbind.

I'd go with 1) since OOM during probe is fatal for most things
anyway, but happy to do 2) or 3) if you have a preference.

> > +		/* Update LEDs for described PIs regardless of consumer state.
> [...]
> > +		if (pcdev->no_of_pse_pi || pcdev->pi[i].np)
> > +			pse_led_update(pcdev, i);
>
> The docstring for pse_led_update() requires it to be called with pcdev->lock
> held. Does calling it here locklessly inside the event handler violate
> that locking contract?

From what I see, both callers of pse_handle_events() hold pcdev->lock
across the call:

* pse_isr() takes mutex_lock(&pcdev->lock) at line 1524, then
  calls pse_handle_events() at line 1531.
* pse_poll_worker() takes mutex_lock(&pcdev->lock) at line 1547,
  then calls pse_handle_events() at line 1551.

So pse_led_update() is running with the lock held in both paths.

Tbh I don't get completely what the AI is flagging here, or is
this a false positive? If false positive, I'd still add
lockdep_assert_held(&pcdev->lock) in pse_led_update() and
pse_handle_events() to make the contract explicit and catch any
future caller that forgets, but that would be documentation,
not a bug fix.

So plan for v6 [2/2], pending your answers:
* NULL pcdev->pi_led_trigs in pse_controller_unregister()
  (and possibly NULL pcdev->pi too, depending on your answer?)
* move pse_led_triggers_register() before the regulator loop
* add lockdep_assert_held() (assuming is a false positive)
* whichever option you pick for question 3?

Depending on what we do with [1/2], I'll roll v6 with your
decisions baked in.

Sorry for the long text...

Cheers,
Carlo

