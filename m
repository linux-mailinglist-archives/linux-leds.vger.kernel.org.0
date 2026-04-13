Return-Path: <linux-leds+bounces-7705-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEwANUl13WngeQkAu9opvQ
	(envelope-from <linux-leds+bounces-7705-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 14 Apr 2026 00:59:21 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9F83F4207
	for <lists+linux-leds@lfdr.de>; Tue, 14 Apr 2026 00:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C02D306EB7E
	for <lists+linux-leds@lfdr.de>; Mon, 13 Apr 2026 22:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE9F39D6FC;
	Mon, 13 Apr 2026 22:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ARDoulFj"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DCA3161BA;
	Mon, 13 Apr 2026 22:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776120819; cv=none; b=jNOWmTsNRMvvw+Y6mfDqUr3zAWlIuZSapAXVEdBKpSCtKujs/P4JuVcGmUrjie7BjqYTVdywxdG5fpTZuoDqnofBAqyFoKf6n8oY3S3VCvDurDmq277a6IWNMUDQo+CeQUefUr2MKOw1qQldX7Vb6BV1y2iuGG0dC4gE0e+8lAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776120819; c=relaxed/simple;
	bh=FiGGUQxmABYaXdw21QLcbqrU0Gubq6P7H8oeYQBF+F8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cmm3OTwIVZxbLbg0Z4D5GWMHC/ZM33bB7eMgUC1Vhz18ojERqUAoZ7IsLyY6pFgwoNDKBRl50zfHGTAcrn0aDp+R2S+/0hP+HDZR1tEttygzlT8pK4/kjtqG5OClFkSah3jKZ7zyk070jCpNHzJ20PCsaoUeY3pWYBI1rrsvhjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ARDoulFj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B28A3C2BCAF;
	Mon, 13 Apr 2026 22:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776120818;
	bh=FiGGUQxmABYaXdw21QLcbqrU0Gubq6P7H8oeYQBF+F8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ARDoulFjahffk3wD8HxrFckAjSHzhMZBYlDE2g9nfv0if2jtRrG5TZW2yz45NeS+4
	 XImSz2ZbaT0kz0y4mw5P60GaXuGfF7tsQyWzYGDSyljRUm+sQ4PV308y/dnorkcusF
	 7RWeWfNDyQcefqVq3MMfSNuPs5bYbcov0Huq+eAShHa564JGz0lhe5B8yWETdl0/65
	 zNFHNy35OqiT/JM0f3taEMu63kauPHtsOnyoArnWgxQAjzU7CJm/bbnkBzSi7eeDez
	 4w6Nng2a0fVmzStqMxB/Rc9hGnCfEXzFE+8Tb1zywX2/BpGkhDBDvH4Xlr9kSTLU6n
	 kCRAwmVRFylPg==
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
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robh@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	lkp@intel.com
Subject: Re: [PATCH net-next v4 2/2] net: pse-pd: add LED trigger support via notification path
Date: Mon, 13 Apr 2026 15:53:34 -0700
Message-ID: <20260413225334.3638943-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410124428.809943-3-github@szelinsky.de>
References: <20260410124428.809943-3-github@szelinsky.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-7705-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4E9F83F4207
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
Date:   Fri Apr 10 12:44:28 2026 +0000

    net: pse-pd: add LED trigger support via notification path
    
    Add per-PI "delivering" and "enabled" LED triggers to the PSE core
    subsystem. LED state is updated from the shared pse_handle_events()
    function whenever the IRQ or poll path detects a state change, as well
    as from the regulator enable/disable paths so that host-initiated
    admin state changes via ethtool are immediately reflected.

    Link: https://lore.kernel.org/oe-kbuild-all/202603251254.o5PqMBRU-lkp@intel.com/
    Link: https://lore.kernel.org/oe-kbuild-all/202603251250.cuMCk5Yv-lkp@intel.com/

> diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
> index f641a6fa087fb..dfc84340afb9d 100644
> --- a/drivers/net/pse-pd/pse_core.c
> +++ b/drivers/net/pse-pd/pse_core.c

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
> +
> +		ret = devm_led_trigger_register(dev, &trigs->delivering);

The commit message states that the initial LED state is queried at
registration time so already-active ports are reflected immediately.

Since no LED is bound to these triggers at registration time, the initial
led_trigger_event() call will be dropped. If an LED is bound later, will
it remain in the default (off) state because there is no .activate callback
configured on the trigger to sync the current state?

Furthermore, since the state is cached in last_delivering and last_enabled,
subsequent updates might not fire new events until the hardware state
actually toggles.

> +		if (ret)
> +			return ret;
> +
> +		trigs->enabled.name = devm_kasprintf(dev, GFP_KERNEL,
> +						     "pse-%s:port%d:enabled",
> +						     dev_id, i);
> +		if (!trigs->enabled.name)
> +			return -ENOMEM;
> +
> +		ret = devm_led_trigger_register(dev, &trigs->enabled);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

[ ... ]

> @@ -1108,6 +1217,20 @@ int pse_controller_register(struct pse_controller_dev *pcdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = pse_led_triggers_register(pcdev);
> +	if (ret) {
> +		dev_warn(pcdev->dev, "Failed to register LED triggers: %d\n",
> +			 ret);
> +	}

If devm_led_trigger_register() fails inside pse_led_triggers_register(),
the function returns an error but leaves trigs->delivering.name allocated
and non-NULL.

Because we only log a warning here and continue execution, the cleanup
for pcdev->pi_led_trigs does not occur.

Later, pse_led_update() verifies validity using this check:

	if (!trigs->delivering.name)
		return;

Since the name is non-NULL, it proceeds to call led_trigger_event() on the
unregistered trigger. Could this result in a NULL pointer dereference,
as the led_cdevs list head within the zero-initialized led_trigger
structure is uninitialized?

> +
> +	/* Query initial LED state for all PIs so already-active ports
> +	 * are reflected immediately without waiting for a hardware event.
> +	 */
> +	for (i = 0; i < pcdev->nr_lines; i++) {
> +		if (pcdev->no_of_pse_pi || pcdev->pi[i].np)
> +			pse_led_update(pcdev, i);
> +	}

The docstring for pse_led_update() specifies that it "Must be called with
pcdev->lock held."

Since this loop calls pse_led_update(pcdev, i) without acquiring
pcdev->lock, and the PI regulators have already been registered and exposed
to consumers earlier in this function, can this race with a concurrent
regulator_enable()?

A concurrent regulator_enable() can trigger pse_pi_enable(), which acquires
the lock and also calls pse_led_update(). This could result in unprotected
calls to the pi_get_pw_status and pi_get_admin_state hardware callbacks,
and concurrent writes to the last_delivering and last_enabled variables.

> +
>  	mutex_lock(&pse_list_mutex);
>  	list_add(&pcdev->list, &pse_controller_list);
>  	mutex_unlock(&pse_list_mutex);

