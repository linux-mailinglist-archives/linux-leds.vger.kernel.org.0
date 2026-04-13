Return-Path: <linux-leds+bounces-7704-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBCbMuR03WngeQkAu9opvQ
	(envelope-from <linux-leds+bounces-7704-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 14 Apr 2026 00:57:40 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5743F41DF
	for <lists+linux-leds@lfdr.de>; Tue, 14 Apr 2026 00:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DAD130056CF
	for <lists+linux-leds@lfdr.de>; Mon, 13 Apr 2026 22:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E4039C014;
	Mon, 13 Apr 2026 22:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqBaKfqs"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A032539BFE0;
	Mon, 13 Apr 2026 22:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776120814; cv=none; b=dAYSp7cxeSkWrTJNDGKUf6zMGg8qeCeRyozYgTM2q4mIjHYw5AAByAfeX8eTBdpOfGIsJ7aqTV/Hb2Ifh0h5RgIkTxU1WYhNyhwdNsvvWAmXJOyYaf/7whvZUhqJ1haCg2AYvVTYYb1Pts1UpUfg+dzy7Yp4q6UQ05aSdvcK2qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776120814; c=relaxed/simple;
	bh=gSbS1nlRpVF8hVXKTOWKoSW7xU9rDrZIooHLIsZCmRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rJSjn9jaxPqfI4LTEVFXnVPrLxqHs1VdhdcZxWf0cnMyrjalYsHPorBlfb/kpOYcn0FJ1++G+NtCpmNtD5BuayzXO2aic8u5HaR5tyawLBHbBzNZ3kdI0nfpbLesaGIm3QbBW/fb2qwtWMh+r+ZIZN8lVL06hdl/p/WR7y2gE1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqBaKfqs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D9DC2BCB4;
	Mon, 13 Apr 2026 22:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776120814;
	bh=gSbS1nlRpVF8hVXKTOWKoSW7xU9rDrZIooHLIsZCmRQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TqBaKfqs9MiVwBY24iw5wQ4Ef0M4xk1TdGFFaOe6qBHfJAa13Y9HykE5ySUAK6q5O
	 lDgfqP292iPs418MpHeQV0sW6BWYlLC2iWaZN9+u7inmXJzA4e2PR6Up9dRya0NY1x
	 58vFUtxLR8syt2O670Sd3bTBhXlHhjU8dATGRxzV0O/VwoU8FkRlnyc53OnAl0VMf4
	 gyPUxK5XYu1OW3KfrZHvGr8eA9EvGDpIRnHXJbjOAWkthnWOkrcezm4xtyme10mjc9
	 q4pzlSvNXcIJSymfO34mGOpi30kAddcHxyMIml5AZlw2W7czjQ5xxnVwdmUueBEdcM
	 ObUBGoEAcJhgg==
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
Subject: Re: [PATCH net-next v4 1/2] net: pse-pd: add devm_pse_poll_helper()
Date: Mon, 13 Apr 2026 15:50:21 -0700
Message-ID: <20260413225021.3634733-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410124428.809943-2-github@szelinsky.de>
References: <20260410124428.809943-2-github@szelinsky.de>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-7704-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,poll_work.work:url]
X-Rspamd-Queue-Id: 2F5743F41DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: pse-pd: add devm_pse_poll_helper()

Extract the common event handling loop from pse_isr() into a shared
pse_handle_events() function, and add a generic poll-based alternative
to the IRQ path for PSE controllers that lack interrupt support.

> Work cancellation on teardown is handled via devm_add_action_or_reset()
> to ensure the delayed work is cancelled before poll_notifs is freed
> by devres, avoiding a use-after-free when devm_pse_poll_helper() is
> called after devm_pse_controller_register() (devres LIFO ordering).

Is it safe to rely on this devm registration order to prevent a
use-after-free?

Standard Linux driver initialization typically sets up interrupts and
pollers before device registration to prevent race conditions where an
unready device is exposed to userspace.

If a driver follows this standard ordering by calling the helper before
registration, devres will unregister the controller first. This will
tear down resources in pse_controller_unregister() while the poll work
remains active.

If the worker executes during this race window, could it access the
already-freed pcdev->pi array or push to the destroyed ntf_fifo? Would
it be safer to explicitly cancel asynchronous event sources within
pse_controller_unregister() instead?

> --- a/drivers/net/pse-pd/pse_core.c
> +++ b/drivers/net/pse-pd/pse_core.c
[ ... ]
> +static void pse_handle_events(struct pse_controller_dev *pcdev,
> +			      unsigned long *notifs,
> +			      unsigned long notifs_mask)
>  {
> -	struct pse_controller_dev *pcdev;
> -	unsigned long notifs_mask = 0;
> -	struct pse_irq_desc *desc;
> -	struct pse_irq *h = data;
> -	int ret, i;
> -
> -	desc = &h->desc;
> -	pcdev = h->pcdev;
> -
> -	/* Clear notifs mask */
> -	memset(h->notifs, 0, pcdev->nr_lines * sizeof(*h->notifs));
> -	mutex_lock(&pcdev->lock);
> -	ret = desc->map_event(irq, pcdev, h->notifs, &notifs_mask);
> -	if (ret || !notifs_mask) {
> -		mutex_unlock(&pcdev->lock);
> -		return IRQ_NONE;
> -	}
> +	int i;
>  
>  	for_each_set_bit(i, &notifs_mask, pcdev->nr_lines) {

Can this lead to an out-of-bounds read on the stack if a controller
supports more than BITS_PER_LONG ports?

The notifs_mask variable is passed by value to pse_handle_events(), but
for_each_set_bit() takes its address. If pcdev->nr_lines is greater than
BITS_PER_LONG (e.g., a 48-port switch on a 32-bit architecture), the
macro will read past the function argument on the stack into uninitialized
memory.

[ ... ]
> +static irqreturn_t pse_isr(int irq, void *data)
> +{
> +	struct pse_controller_dev *pcdev;
> +	unsigned long notifs_mask = 0;
> +	struct pse_irq *h = data;
> +	int ret;
> +
> +	pcdev = h->pcdev;
> +
> +	/* Clear notifs mask */
> +	memset(h->notifs, 0, pcdev->nr_lines * sizeof(*h->notifs));
> +	mutex_lock(&pcdev->lock);
> +	ret = h->desc.map_event(irq, pcdev, h->notifs, &notifs_mask);

Could this also result in a stack out-of-bounds write?

If map_event() uses set_bit() to report an event on a port index greater
than or equal to BITS_PER_LONG, it will write past the 4-byte boundary of
the scalar notifs_mask variable, corrupting adjacent stack memory.

[ ... ]
> +static void pse_poll_worker(struct work_struct *work)
> +{
> +	struct pse_controller_dev *pcdev =
> +		container_of(work, struct pse_controller_dev,
> +			     poll_work.work);
> +	unsigned long notifs_mask = 0;
> +	int ret;
> +
> +	memset(pcdev->poll_notifs, 0,
> +	       pcdev->nr_lines * sizeof(*pcdev->poll_notifs));
> +	mutex_lock(&pcdev->lock);
> +	ret = pcdev->poll_desc.map_event(0, pcdev, pcdev->poll_notifs,
> +					 &notifs_mask);

Does this share the same out-of-bounds write risk for notifs_mask as the
IRQ handler above?
-- 
pw-bot: cr

