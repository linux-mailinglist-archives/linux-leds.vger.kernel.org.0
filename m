Return-Path: <linux-leds+bounces-7987-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qD4kNqlO+WkV7wIAu9opvQ
	(envelope-from <linux-leds+bounces-7987-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 03:58:01 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AD44C5DB0
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 03:58:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AA3530143D0
	for <lists+linux-leds@lfdr.de>; Tue,  5 May 2026 01:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAA63603E9;
	Tue,  5 May 2026 01:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="axa9EvNI"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4695A26E6F2;
	Tue,  5 May 2026 01:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777946279; cv=none; b=rOXVtq0EJcNQpMBX3yZv+SFSRLUD1jaEpo9RwNSbktYjo2AzmXKKrX6/c58jVBbanraXlQRd2It0ouAR58csgfa2KW9btbE2HyucLVf+n5xcHVPmzJidun5MOb3+/TFocTyXanbJz5MvpkdGMaPSAmts+hdAymnt/2/op9PMhVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777946279; c=relaxed/simple;
	bh=Fyiur2XAhvk5O8V7IrEnGOrDuAqm81WoJNB0CmzryLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OWd4pSZH0Cfyllfxmkpka4jl9FbhQLJAFqhFrlJDcbXYFuDcHwQn5Ur5zLTnAm61V4gaiK/BVNPVv+iw9X3+X1Dxjd0enGS7Wa/idHGWja89LHJn9WKjfs7+gHiUUvN5LMd1I/ebHtBPgfqCKXd75/SZ959vy3B/nbinw0kApek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=axa9EvNI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 651B1C2BCB8;
	Tue,  5 May 2026 01:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777946278;
	bh=Fyiur2XAhvk5O8V7IrEnGOrDuAqm81WoJNB0CmzryLw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=axa9EvNIzS9COtHGZzbXp+936O+s1IsW+sLcvYWwf3MtrYNLjUlK3fcjkSav73ixf
	 kw9ZvWn9uiSO73rJ4LPxjAy+1huucD4F+rD8cxfgQmF6DM9bIN6PenKPiuJIUaTHP1
	 h9JYDFiTGFE+ISI8DrFjPkZi8IcRWOVOYJjzLF+3GsHooHZlvj3Lpny8RVmNpsRc2d
	 2CDuFmw20XmZPs3y/Xs2Uwikqg+CJthf6wthWKGBClLrYqMTj/EFr3sa69dmf+7cDL
	 CurtZFIhAAy2bX5SU3iiNoj3GKh7aHQTBLvBXFOS7ACU65wU8fp1qX9hiYmihq4JpI
	 +DQ1BDjrYf8ag==
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
Subject: Re: [PATCH net-next v5 1/2] net: pse-pd: add devm_pse_poll_helper()
Date: Mon,  4 May 2026 18:57:57 -0700
Message-ID: <20260505015757.831372-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429213224.1747410-2-github@szelinsky.de>
References: <20260429213224.1747410-2-github@szelinsky.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 53AD44C5DB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-7987-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
    net: pse-pd: add devm_pse_poll_helper()

This patch extracts the common event handling loop from pse_isr() into a
shared function and adds a poll-based alternative for PSE controllers
that lack interrupt support.

> diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
> index 87aa4f4e9724..b7ffec0c942c 100644
> --- a/drivers/net/pse-pd/pse_core.c
> +++ b/drivers/net/pse-pd/pse_core.c
[ ... ]
> @@ -1118,6 +1125,8 @@ void pse_controller_unregister(struct pse_controller_dev *pcdev)
>  	pse_release_pis(pcdev);
>  	if (pcdev->irq)
>  		disable_irq(pcdev->irq);
> +	if (pcdev->polling)
> +		cancel_delayed_work_sync(&pcdev->poll_work);

Because pse_release_pis() executes kfree(pcdev->pi) before the delayed work
is cancelled, can pse_poll_worker() run concurrently and access the freed
pcdev->pi array inside pse_handle_events() before the cancellation completes?

[ ... ]
> @@ -1356,6 +1403,54 @@ int devm_pse_irq_helper(struct pse_controller_dev *pcdev, int irq,
>  }
>  EXPORT_SYMBOL_GPL(devm_pse_irq_helper);
>  
> +/**
> + * devm_pse_poll_helper - Register poll-based PSE event notifier
> + * @pcdev: a pointer to the PSE controller device
> + * @d: PSE event description (uses same pse_irq_desc as IRQ path)
[ ... ]
> +int devm_pse_poll_helper(struct pse_controller_dev *pcdev,
> +			 const struct pse_irq_desc *d)
> +{
> +	struct device *dev = pcdev->dev;
> +
> +	if (!d || !d->map_event || !d->name)
> +		return -EINVAL;
> +
> +	pcdev->poll_desc = *d;
> +	pcdev->poll_notifs = devm_kcalloc(dev, pcdev->nr_lines,
> +					  sizeof(*pcdev->poll_notifs),
> +					  GFP_KERNEL);
> +	if (!pcdev->poll_notifs)
> +		return -ENOMEM;
> +
> +	pcdev->poll_notifs_mask = devm_bitmap_zalloc(dev, pcdev->nr_lines,
> +						     GFP_KERNEL);
> +	if (!pcdev->poll_notifs_mask)
> +		return -ENOMEM;
> +
> +	if (!pcdev->poll_interval_ms)
> +		pcdev->poll_interval_ms = PSE_DEFAULT_POLL_INTERVAL_MS;
> +
> +	INIT_DELAYED_WORK(&pcdev->poll_work, pse_poll_worker);
> +	pcdev->polling = true;
> +
> +	queue_delayed_work(system_freezable_wq, &pcdev->poll_work,
> +			   msecs_to_jiffies(pcdev->poll_interval_ms));

Since memory is allocated with devm_ helpers but no devm cleanup action is
registered to cancel the delayed work, what happens if a driver's probe
function encounters an error after calling this helper? Will devres free the
pcdev structure while the system workqueue still has the delayed work armed,
leading to a use-after-free when the timer expires?

The commit message mentions that drivers typically set up the helper before
registering the controller. If queue_delayed_work() schedules the worker
to run before devm_pse_controller_register() completes, will
pse_poll_worker() attempt to acquire pcdev->lock and push events into
pcdev->ntf_fifo before they are initialized?

> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(devm_pse_poll_helper);

