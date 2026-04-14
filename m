Return-Path: <linux-leds+bounces-7722-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGcRCy1L3mkzqAkAu9opvQ
	(envelope-from <linux-leds+bounces-7722-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 14 Apr 2026 16:11:57 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8F33FAE8A
	for <lists+linux-leds@lfdr.de>; Tue, 14 Apr 2026 16:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71DC7300D446
	for <lists+linux-leds@lfdr.de>; Tue, 14 Apr 2026 14:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A5D3E7168;
	Tue, 14 Apr 2026 14:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DjGQPrR+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EE33E717D;
	Tue, 14 Apr 2026 14:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776175519; cv=none; b=e2zRUfJoDZTxSgclFskaAygo6CqcnSFKmIhjyhPWnOH5ScYP87cnALAf05cS3Tph5yuWbJ+Xv65iSZsDua5D+wGnMvHizzEzvfrwkw90yjtTljoZ7I3be1Cq5AFWC+1ii27lqj5cpF21BJp54t6cbGHm8np7ukLOiZhCqGzaE5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776175519; c=relaxed/simple;
	bh=y9K26p2Tzkjn8wZH5lLTrvaKdmj0DBdqNXllPyEOWLs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CvuuF9RnAkLm+T3XDp/uvJhtELQUMmyA8Ys/UUXgSgFW3QrBUbOkn2Zgw1lCs244ag3ltwrR+roFBg+2KXxjaE+qO/1/PFAK9gUHgNd+zitS9xASkibmnnZNl8UJX5GFyMQNaDWHYJt87yDQtKs3taZJaf94qIRRLfgjpoGNK/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DjGQPrR+; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0F3AA1A32A9;
	Tue, 14 Apr 2026 14:05:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CFAE960410;
	Tue, 14 Apr 2026 14:05:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9DECC10451130;
	Tue, 14 Apr 2026 16:05:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776175512; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9suh8TF17pxHQmMK3Z/vHxI4XcEeGwW6GHcsKyhiSNI=;
	b=DjGQPrR+XlRmaneUDM0ihJ4KyfJmuvUNEZzkGhL4KamEqm9DkPZuEIx9LF0z54I5wPoCQL
	GPUSKjHUyHzg97TEOrCPgSu4+qTErlFNEA+1Vg+wI4zNDGltz01eS6ftMH7But2jT4OiH7
	YXdQ74zfYg/jAObNqgDmIGZLDCGtcncpMZfVvvXLmni6pwxvGQlheJcjwR8kTmP/d4w5iO
	pjyD4H50+m0kuNSG//5ms5XwLSA7HyB/9wNQhggQayYnJHrwYI/lrpdlpvkHNc96I6BBAw
	ZeTsGzy0ntF678SpWXhpOvROpKGeINbNRGurm+K63dR1FLJOZaduIBZ4yQdsGw==
Date: Tue, 14 Apr 2026 16:05:06 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: github@szelinsky.de, o.rempel@pengutronix.de, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 krzk@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, lkp@intel.com
Subject: Re: [PATCH net-next v4 1/2] net: pse-pd: add devm_pse_poll_helper()
Message-ID: <20260414160506.4ce4d543@kmaincent-XPS-13-7390>
In-Reply-To: <20260413225021.3634733-1-kuba@kernel.org>
References: <20260410124428.809943-2-github@szelinsky.de>
	<20260413225021.3634733-1-kuba@kernel.org>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-7722-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kory.maincent@bootlin.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-leds,netdev,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6F8F33FAE8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 13 Apr 2026 15:50:21 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> ---
> net: pse-pd: add devm_pse_poll_helper()
>=20
> Extract the common event handling loop from pse_isr() into a shared
> pse_handle_events() function, and add a generic poll-based alternative
> to the IRQ path for PSE controllers that lack interrupt support.
>=20
> > Work cancellation on teardown is handled via devm_add_action_or_reset()
> > to ensure the delayed work is cancelled before poll_notifs is freed
> > by devres, avoiding a use-after-free when devm_pse_poll_helper() is
> > called after devm_pse_controller_register() (devres LIFO ordering). =20
>=20
> Is it safe to rely on this devm registration order to prevent a
> use-after-free?
>=20
> Standard Linux driver initialization typically sets up interrupts and
> pollers before device registration to prevent race conditions where an
> unready device is exposed to userspace.
>=20
> If a driver follows this standard ordering by calling the helper before
> registration, devres will unregister the controller first. This will
> tear down resources in pse_controller_unregister() while the poll work
> remains active.
>=20
> If the worker executes during this race window, could it access the
> already-freed pcdev->pi array or push to the destroyed ntf_fifo? Would
> it be safer to explicitly cancel asynchronous event sources within
> pse_controller_unregister() instead?
>=20
> > --- a/drivers/net/pse-pd/pse_core.c
> > +++ b/drivers/net/pse-pd/pse_core.c =20
> [ ... ]
> > +static void pse_handle_events(struct pse_controller_dev *pcdev,
> > +			      unsigned long *notifs,
> > +			      unsigned long notifs_mask)
> >  {
> > -	struct pse_controller_dev *pcdev;
> > -	unsigned long notifs_mask =3D 0;
> > -	struct pse_irq_desc *desc;
> > -	struct pse_irq *h =3D data;
> > -	int ret, i;
> > -
> > -	desc =3D &h->desc;
> > -	pcdev =3D h->pcdev;
> > -
> > -	/* Clear notifs mask */
> > -	memset(h->notifs, 0, pcdev->nr_lines * sizeof(*h->notifs));
> > -	mutex_lock(&pcdev->lock);
> > -	ret =3D desc->map_event(irq, pcdev, h->notifs, &notifs_mask);
> > -	if (ret || !notifs_mask) {
> > -		mutex_unlock(&pcdev->lock);
> > -		return IRQ_NONE;
> > -	}
> > +	int i;
> > =20
> >  	for_each_set_bit(i, &notifs_mask, pcdev->nr_lines) { =20
>=20
> Can this lead to an out-of-bounds read on the stack if a controller
> supports more than BITS_PER_LONG ports?
>=20
> The notifs_mask variable is passed by value to pse_handle_events(), but
> for_each_set_bit() takes its address. If pcdev->nr_lines is greater than
> BITS_PER_LONG (e.g., a 48-port switch on a 32-bit architecture), the
> macro will read past the function argument on the stack into uninitialized
> memory.

It's seems there is a possible out-of-bound issue in my code :/ Oops.
Carlo, could you take a look and propose a fix? Otherwise, I'll handle it.

Regards
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

