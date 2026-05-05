Return-Path: <linux-leds+bounces-7988-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +H8EOMxO+WkV7wIAu9opvQ
	(envelope-from <linux-leds+bounces-7988-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 03:58:36 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E0F4C5DC9
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 03:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81CD7302BE39
	for <lists+linux-leds@lfdr.de>; Tue,  5 May 2026 01:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500A93624C5;
	Tue,  5 May 2026 01:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxNlxZLF"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C73B3603C0;
	Tue,  5 May 2026 01:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777946281; cv=none; b=krjXx4RYz/gbktPOHxax/UvTPyieBfgEsL+gX+0pq/v+ra0howxeOwnCu3fdEaJChKB5//rTmDsK3IidU/DfQKqDb3nTscqTNUC4k88NMXcufQgBo0g+dGwzmcwdQEQUSMetEttXtj9y/9PjKFARQrZ9rl28ocUBHsco3G2XUCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777946281; c=relaxed/simple;
	bh=XrGa0jeT1NNmKT1hqZ/4WdmXOGRVamulJd8DWdE7XkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mBku+ZeqTYUq89fPi14TnZbIuytd23zzEYdR0/u67pTeXOvjBEwypKynUw1pobD7pYe5hJpZfxFelZ9kmwYl15rq0DyQFXyZTyxsb1N9BKNTVw+xdhSh2+rg7H9WowR59MJYrmYR0cmC4kVMumNOoZND+GKtMEP2Gju2cG6qN1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxNlxZLF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C0C0C2BCB8;
	Tue,  5 May 2026 01:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777946280;
	bh=XrGa0jeT1NNmKT1hqZ/4WdmXOGRVamulJd8DWdE7XkY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mxNlxZLFbwpggoGJWmzn6FaEGfFLTY4Y35idjv+ta0NUmB1B3B+XJN2yZQ+mKd5Ps
	 zzmZxWJqs/TB9XGaHo+WSmn3n4INR1SlSUFntKC+5VURwlcg4a9NhnHv0xzASY9hQT
	 K9evC+Ekg61vU1JIMWYrhLHyMHyi0JcxIYmpAPV48/JOix5of0F9Sevp21ROGWeqov
	 kWt8ZQd+ucRK303juIhxI9ww0nSb18csQ4g7/jz9bHlRmnbmLWF9/a++7RIG8rG5fX
	 GJFMzh90e2ny4lCSO7GqTJQ+jqRuL/QdoaOoYjdCq7Xzm1YXO5v1HV1Ix2x4S7AvIb
	 HU4rGMeUtphzw==
From: Jakub Kicinski <kuba@kernel.org>
To: github@szelinsky.de
Cc: Jakub Kicinski <kuba@kernel.org>,
	o.rempel@pengutronix.de,
	kory.maincent@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	krzk@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH net-next v5 2/2] net: pse-pd: add LED trigger support via notification path
Date: Mon,  4 May 2026 18:57:59 -0700
Message-ID: <20260505015759.831393-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429213224.1747410-3-github@szelinsky.de>
References: <20260429213224.1747410-3-github@szelinsky.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 43E0F4C5DC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-7988-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: pse-pd: add LED trigger support via notification path

This commit adds per-PI LED triggers to the PSE core subsystem to reflect
delivering and enabled states. The LED state is updated during hardware
events and administrative state changes via ethtool.

Link: https://lore.kernel.org/oe-kbuild-all/202603251254.o5PqMBRU-lkp@intel.com/
Link: https://lore.kernel.org/oe-kbuild-all/202603251250.cuMCk5Yv-lkp@intel.com/

> diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
> index b7ffec0c942c..bff97211ae22 100644
> --- a/drivers/net/pse-pd/pse_core.c
> +++ b/drivers/net/pse-pd/pse_core.c

[ ... ]

> @@ -669,6 +670,168 @@ static int _pse_pi_delivery_power_sw_pw_ctrl(struct pse_controller_dev *pcdev,
>  	return 0;
>  }
>  
> +#if IS_ENABLED(CONFIG_LEDS_TRIGGERS)

[ ... ]

> +static int pse_led_triggers_register(struct pse_controller_dev *pcdev)
> +{
> +	struct device *dev = pcdev->dev;
> +	const char *dev_id;
> +	int i, ret;
> +
> +	dev_id = dev_name(dev);
> +
> +	pcdev->pi_led_trigs = devm_kcalloc(dev, pcdev->nr_lines,
> +					   sizeof(*pcdev->pi_led_trigs),
> +					   GFP_KERNEL);

Since devm resources are released in strict LIFO order, and pi_led_trigs
is allocated here after the regulators are registered in
pse_controller_register(), will the pi_led_trigs array be freed before
the regulators are unregistered on driver unbind?

When the regulator core later unregisters the regulators and flushes
pending disables, could it invoke pse_pi_disable() and call pse_led_update(),
dereferencing the dangling pcdev->pi_led_trigs pointer?

> +	if (!pcdev->pi_led_trigs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < pcdev->nr_lines; i++) {
> +		struct pse_pi_led_triggers *trigs = &pcdev->pi_led_trigs[i];
> +
> +		/* Skip PIs not described in device tree */
> +		if (!pcdev->no_of_pse_pi && !pcdev->pi[i].np)
> +			continue;
> +
> +		trigs->delivering.name = devm_kasprintf(dev, GFP_KERNEL,
> +							"pse-%s:port%d:delivering",
> +							dev_id, i);
> +		if (!trigs->delivering.name)
> +			return -ENOMEM;
> +		trigs->delivering.activate = pse_led_delivering_activate;
> +
> +		ret = devm_led_trigger_register(dev, &trigs->delivering);

Regulators are exposed before this code runs in pse_controller_register().
What happens if a consumer calls regulator_enable() concurrently?

If a concurrent pse_pi_enable() calls pse_led_update() right after
trigs->delivering.name is set but before devm_led_trigger_register() executes:

pse_led_update() sees pcdev->pi_led_trigs and trigs->delivering.name are
both non-NULL, and proceeds to call led_trigger_event().

Since devm_led_trigger_register() hasn't initialized the trigger's internal
led_cdevs list head yet, will led_trigger_event() attempt to iterate a
zeroed memory list and cause a NULL pointer dereference?

> +		if (ret) {
> +			trigs->delivering.name = NULL;
> +			return ret;
> +		}

[ ... ]

> @@ -1107,6 +1273,31 @@ int pse_controller_register(struct pse_controller_dev *pcdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = pse_led_triggers_register(pcdev);
> +	if (ret) {
> +		/* LED triggers are non-essential for power delivery; warn
> +		 * and continue. NULL out the array so pse_led_update()'s
> +		 * early-return guard short-circuits any later calls onto
> +		 * partially-registered triggers.
> +		 */
> +		dev_warn(pcdev->dev, "Failed to register LED triggers: %d\n",
> +			 ret);
> +		pcdev->pi_led_trigs = NULL;
> +	}

If pse_led_triggers_register() fails halfway through, the device probe still
succeeds, which means devm cleanup will not run. Could the successfully
registered LED triggers from earlier loop iterations remain registered
indefinitely with the LED subsystem?

Since pcdev->pi_led_trigs is NULLed, pse_led_update() will short-circuit.
Does this leave these globally visible triggers permanently orphaned without
ever receiving state updates?

> +
> +	/* Query initial LED state for all PIs so already-active ports
> +	 * are reflected immediately without waiting for a hardware event.
> +	 * Hold pcdev->lock: regulators are already exposed and a
> +	 * concurrent regulator_enable() would race on the hw callbacks
> +	 * and on last_delivering / last_enabled.
> +	 */
> +	mutex_lock(&pcdev->lock);

[ ... ]

> @@ -1267,7 +1458,14 @@ static void pse_handle_events(struct pse_controller_dev *pcdev,
>  		struct pse_ntf ntf = {};
>  		int ret;
>  
> -		/* Do nothing PI not described */
> +		/* Update LEDs for described PIs regardless of consumer state.
> +		 * LED triggers are registered at controller init, before any
> +		 * PHY claims a PSE control, so rdev may still be NULL here.
> +		 */
> +		if (pcdev->no_of_pse_pi || pcdev->pi[i].np)
> +			pse_led_update(pcdev, i);

The docstring for pse_led_update() requires it to be called with pcdev->lock
held. Does calling it here locklessly inside the event handler violate
that locking contract?

Could this lack of synchronization cause data races on the cached state
variables, or allow concurrent execution of the hardware callbacks
(pi_get_pw_status and pi_get_admin_state) if they are invoked at the same
time by other paths?

> +
> +		/* Skip regulator/netlink path for PIs without consumers */
>  		if (!pcdev->pi[i].rdev)
>  			continue;

