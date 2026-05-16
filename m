Return-Path: <linux-leds+bounces-8145-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMDDK9JFCGq8hQMAu9opvQ
	(envelope-from <linux-leds+bounces-8145-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 12:24:18 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5293D55B1F9
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 12:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B4F2A30066A3
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 10:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEA03D3CF2;
	Sat, 16 May 2026 10:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b="lFgeuMo1"
X-Original-To: linux-leds@vger.kernel.org
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95323C7DF1;
	Sat, 16 May 2026 10:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.127.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778927052; cv=none; b=p8j9cO1pMixjLR2X6gTSjxyBD2istgCUcZsuYuSkGSM7cJAyLAoemC20pTbQkkDyG20fTzsvkNgwEdg88Zth8KQv9vaUNuNHHF5nlwB+23NA1urmxmU9mzckw+Jup+CQdGhEnBJkje2E8ggd2Xqav/0JZl31J8ITP4mmac72Zds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778927052; c=relaxed/simple;
	bh=bdN0NT6/HcYgI/x4qjaeluTgxOtZ+qYb36w6gMUlXR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gFdO8sKaQsl4F5aRsIjFpjGF3JgVIjeg98c/mKBH7cKz5XkDndZVpl7fQ5PbnLb15ODs50X3S6s9C5zYEIqylVsQfvvd9egRMZrld0RBogbURZdMuF99Of6LjP03bTNZVOkq/jAe3JsYef6hEjYjFHa5VPUZBpWdPd3zLEqzSgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de; spf=pass smtp.mailfrom=szelinsky.de; dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b=lFgeuMo1; arc=none smtp.client-ip=85.214.127.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 529CDE83300;
	Sat, 16 May 2026 12:17:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1778926664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xQxE5eeNi+FgzpQyikK/9wb1gzBGDwcK1LlAPy0UyIo=;
	b=lFgeuMo1K1pAxBJ2oR7LoPSr7PvIuSayWS9JSK1hr3Z87k5OoIx53LwcwZvmnSxORpMM/v
	wZ2i46cdxJ+W4awMI+KwulKLD70Un8aMhKfEdaRXQ3Am4L1h88iF8jw9zmcwuZLXC4UHsq
	ZlmwO/IhNTQjIHkZgDzhtDGOE5IMS8cw+yEc79KEabi6u7wZrVnyDg5nY7VsjU12WcyBZi
	e713O6gsHAYn9R+rS6ZhnuRq3TnkMjGtLLF2pCBDB8qEsGxfH9vRVpE76teUogFhhMQk1W
	N+/iHWHDCM1FPT9y9dODyV/JJY1Pl5nrhsfFm2ZEvcAcETj0C5RVwztUMGk6Fg==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id ZRLkrymdl950; Sat, 16 May 2026 12:17:43 +0200 (CEST)
Received: from p14sgen5.fritz.box (p578439b8.dip0.t-ipconnect.de [87.132.57.184])
	by szelinsky.de (Postfix) with ESMTPSA;
	Sat, 16 May 2026 12:17:43 +0200 (CEST)
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
Subject: Re: [PATCH net-next v5 1/2] net: pse-pd: add devm_pse_poll_helper()
Date: Sat, 16 May 2026 12:17:20 +0200
Message-ID: <20260516101720.1686465-1-github@szelinsky.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505015757.831372-1-kuba@kernel.org>
References: <20260505015757.831372-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5293D55B1F9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[szelinsky.de,quarantine];
	R_DKIM_ALLOW(-0.20)[szelinsky.de:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8145-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github@szelinsky.de,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[szelinsky.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Hi Jakub,

Thanks for sending the AI review. I checked the code again... both
points are real, but one of them looks to me like more theory than practice.
Out of curiosity, what prompt do you use for these reviews, so I can use it 
before sending the next version? Replying inline:

On Mon, 4 May 2026 18:57:57 -0700 Jakub Kicinski wrote:
> > @@ -1118,6 +1125,8 @@ void pse_controller_unregister(struct pse_controller_dev *pcdev)
> >  	pse_release_pis(pcdev);
> >  	if (pcdev->irq)
> >  		disable_irq(pcdev->irq);
> > +	if (pcdev->polling)
> > +		cancel_delayed_work_sync(&pcdev->poll_work);
>
> Because pse_release_pis() executes kfree(pcdev->pi) before the delayed work
> is cancelled, can pse_poll_worker() run concurrently and access the freed
> pcdev->pi array inside pse_handle_events() before the cancellation completes?

Yes, seems like a real bug. The IRQ thread and the poll worker can still run
after pse_release_pis() frees pcdev->pi, and both end up in
pse_handle_events() touching pcdev->pi[i]. We need to stop them
first. v6 will reorder pse_controller_unregister() to:

	if (pcdev->irq)
		disable_irq(pcdev->irq);
	if (pcdev->polling)
		cancel_delayed_work_sync(&pcdev->poll_work);
	cancel_work_sync(&pcdev->ntf_work);
	pse_release_pis(pcdev);

The IRQ side seem to be already broken before this patch. I went
through the git log:

* fc0e6db30941 ("net: pse-pd: Add support for reporting events")
  added pse_isr but never called disable_irq() in unregister at all.
* ffef61d6d273 ("net: pse-pd: Add support for budget evaluation
  strategies") added the disable_irq() call, but put it in the
  wrong place (after pse_release_pis()).

What do you suggest to do, I could imagine: ... 

1) Send the fix as a standalone "Fixes:" patch to net first,
   then rebase v6 on top once it lands? Or fold it into v6 as
   patch 1/3? My vote is standalone since the fix stands on its
   own, but up to you.

2) Which commit for the Fixes: tag? I'd pick ffef61d6d273
   (that's where the broken order came from), but fc0e6db30941
   also works (no protection at all back then). wdyt?

> > +int devm_pse_poll_helper(struct pse_controller_dev *pcdev,
> > +			 const struct pse_irq_desc *d)
> > +{
> [...]
> > +	queue_delayed_work(system_freezable_wq, &pcdev->poll_work,
> > +			   msecs_to_jiffies(pcdev->poll_interval_ms));
>
> Since memory is allocated with devm_ helpers but no devm cleanup action is
> registered to cancel the delayed work, what happens if a driver's probe
> function encounters an error after calling this helper? [...]
>
> The commit message mentions that drivers typically set up the helper before
> registering the controller. If queue_delayed_work() schedules the worker
> to run before devm_pse_controller_register() completes, will
> pse_poll_worker() attempt to acquire pcdev->lock and push events into
> pcdev->ntf_fifo before they are initialized?

The probe-failure case is a real bug. If probe fails between this
helper and devm_pse_controller_register(), the work stays queued
and fires later on a pcdev whose devres memory is gone. UAF.

The "worker fires before mutex/kfifo are ready" case is real in
theory, but I don't think you can actually hit it?! Default
poll_interval_ms is 1000 ms, so pse_controller_register() would
need to take over a second to lose the race. Worth fixing to keep
the code clean, but not urgent or?

Same fix for both: move queue_delayed_work() out of the helper.
The helper just allocates the state and does INIT_DELAYED_WORK.
pse_controller_register() then arms the work as the very last
step on success, gated on pcdev->polling. So the work only ever
runs when everything is set up AND register has succeeded.

Should I fix both in v6, or just the probe-failure leak? One
change covers both, so I would suggest to do both. wdyt?

So the steps for v6 [1/2] could be:
* standalone "Fixes:" patch reordering pse_controller_unregister()
  (sent to net first, unless you suggest to fold it in)
* move queue_delayed_work() into pse_controller_register()

Do you have any other feedback, do I miss anything ?

Cheers,
Carlo

