Return-Path: <linux-leds+bounces-7723-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IBTFW1M3mkzqAkAu9opvQ
	(envelope-from <linux-leds+bounces-7723-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 14 Apr 2026 16:17:17 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC873FAFD4
	for <lists+linux-leds@lfdr.de>; Tue, 14 Apr 2026 16:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9F53300579D
	for <lists+linux-leds@lfdr.de>; Tue, 14 Apr 2026 14:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B503E7174;
	Tue, 14 Apr 2026 14:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JEeDPus/"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4005B3CFF49;
	Tue, 14 Apr 2026 14:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776175915; cv=none; b=kL6kStnJT7cgfxHb5gN7RF9AReDTIp5yjao80o5sCLDROcQ1p8RU6O4lGn/hlwLdf10wTUOwdXnpjpgORVmv7kkzYbGwjV/DWAFiU7j4msgyuQIPP/lqku6REa4kJcEzTY+fXoywpJXqO3pCNBCqQ53HWKIfdjtF8kEBLMFjFDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776175915; c=relaxed/simple;
	bh=aIm9zZckmz0fMWSLF7/m4WIKc58xk5cOcOXHkkshABM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rmlBBVPyoRniYdtPcKDiZmMCQLYDq6DHpgSKZOSeqjhxcRyzOGtQS7DUh/nk7/3cBgWyYJx9ibe+rAaITuSqFSzpC3X3ogT8oJ1HvuBl1ApmP6eFilLjuHmikNAn4UyLfPArRyN6KnoREeNZNnwxLtN7E39oFX+fjBNpsPTSFR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JEeDPus/; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B4F154E429EA;
	Tue, 14 Apr 2026 14:11:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A7AD60410;
	Tue, 14 Apr 2026 14:11:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A97910450648;
	Tue, 14 Apr 2026 16:11:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776175910; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iu/Lmz7gzln+fVkrhZx/OoSmpwIAfBuKTEilomGYWpI=;
	b=JEeDPus/hZWyL3CkwZgxMUoyxiT8wVowOjnIbEegvclTJEh8f8F9w8Qm8yy20x3gdsv9+d
	/HIm5RQpqaHufIiwbFEJJbAC6Ec8vj6OVZh68Ag09L52Dr3kNH/mz8cl6tgg7oWfcv0XVw
	gOUK3gGsBUZew5A3aW4/QjdHQIlBxho4i3hjgGKWjKOMChBesQe6nyFGXXdhEvYaIS/8r6
	i0satL6slmnTKjI+fMhWbX3B4mAv9DX+BS3lqReibYKvboM/6amujFeVdyqg9H8Any+bjM
	Rru8wpyahDduXYIUel69YnTKxkyQKIKe84JWDB7f1GRdwbKwY/heDpuW8lDIvw==
Date: Tue, 14 Apr 2026 16:11:46 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: github@szelinsky.de, o.rempel@pengutronix.de, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 krzk@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, lkp@intel.com
Subject: Re: [PATCH net-next v4 1/2] net: pse-pd: add devm_pse_poll_helper()
Message-ID: <20260414161146.77b70d4d@kmaincent-XPS-13-7390>
In-Reply-To: <20260414160506.4ce4d543@kmaincent-XPS-13-7390>
References: <20260410124428.809943-2-github@szelinsky.de>
	<20260413225021.3634733-1-kuba@kernel.org>
	<20260414160506.4ce4d543@kmaincent-XPS-13-7390>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-7723-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:email,bootlin.com:url]
X-Rspamd-Queue-Id: CDC873FAFD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 14 Apr 2026 16:05:06 +0200
Kory Maincent <kory.maincent@bootlin.com> wrote:

> On Mon, 13 Apr 2026 15:50:21 -0700
> Jakub Kicinski <kuba@kernel.org> wrote:
>=20
> > This is an AI-generated review of your patch. The human sending this
> > email has considered the AI review valid, or at least plausible.
> > ---
> > net: pse-pd: add devm_pse_poll_helper()
> >=20
> > Extract the common event handling loop from pse_isr() into a shared
> > pse_handle_events() function, and add a generic poll-based alternative
> > to the IRQ path for PSE controllers that lack interrupt support.
> >  =20
> > > Work cancellation on teardown is handled via devm_add_action_or_reset=
()
> > > to ensure the delayed work is cancelled before poll_notifs is freed
> > > by devres, avoiding a use-after-free when devm_pse_poll_helper() is
> > > called after devm_pse_controller_register() (devres LIFO ordering).  =
 =20
> >=20
> > Is it safe to rely on this devm registration order to prevent a
> > use-after-free?
> >=20
> > Standard Linux driver initialization typically sets up interrupts and
> > pollers before device registration to prevent race conditions where an
> > unready device is exposed to userspace.
> >=20
> > If a driver follows this standard ordering by calling the helper before
> > registration, devres will unregister the controller first. This will
> > tear down resources in pse_controller_unregister() while the poll work
> > remains active.
> >=20
> > If the worker executes during this race window, could it access the
> > already-freed pcdev->pi array or push to the destroyed ntf_fifo? Would
> > it be safer to explicitly cancel asynchronous event sources within
> > pse_controller_unregister() instead?
> >  =20
> > > --- a/drivers/net/pse-pd/pse_core.c
> > > +++ b/drivers/net/pse-pd/pse_core.c   =20
> > [ ... ] =20
> > > +static void pse_handle_events(struct pse_controller_dev *pcdev,
> > > +			      unsigned long *notifs,
> > > +			      unsigned long notifs_mask)
> > >  {
> > > -	struct pse_controller_dev *pcdev;
> > > -	unsigned long notifs_mask =3D 0;
> > > -	struct pse_irq_desc *desc;
> > > -	struct pse_irq *h =3D data;
> > > -	int ret, i;
> > > -
> > > -	desc =3D &h->desc;
> > > -	pcdev =3D h->pcdev;
> > > -
> > > -	/* Clear notifs mask */
> > > -	memset(h->notifs, 0, pcdev->nr_lines * sizeof(*h->notifs));
> > > -	mutex_lock(&pcdev->lock);
> > > -	ret =3D desc->map_event(irq, pcdev, h->notifs, &notifs_mask);
> > > -	if (ret || !notifs_mask) {
> > > -		mutex_unlock(&pcdev->lock);
> > > -		return IRQ_NONE;
> > > -	}
> > > +	int i;
> > > =20
> > >  	for_each_set_bit(i, &notifs_mask, pcdev->nr_lines) {   =20
> >=20
> > Can this lead to an out-of-bounds read on the stack if a controller
> > supports more than BITS_PER_LONG ports?
> >=20
> > The notifs_mask variable is passed by value to pse_handle_events(), but
> > for_each_set_bit() takes its address. If pcdev->nr_lines is greater than
> > BITS_PER_LONG (e.g., a 48-port switch on a 32-bit architecture), the
> > macro will read past the function argument on the stack into uninitiali=
zed
> > memory. =20
>=20
> It's seems there is a possible out-of-bound issue in my code :/ Oops.
> Carlo, could you take a look and propose a fix? Otherwise, I'll handle it.

But currently it can't be reached as the only driver that support interrupt=
 is
the TPS23881 with 8 ports.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

