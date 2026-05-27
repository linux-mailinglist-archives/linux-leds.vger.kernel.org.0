Return-Path: <linux-leds+bounces-8323-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPY5FF6sFmp/oQcAu9opvQ
	(envelope-from <linux-leds+bounces-8323-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2026 10:33:34 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC4D5E128F
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2026 10:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6657A301E55E
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2026 08:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A4F36C5B4;
	Wed, 27 May 2026 08:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Aln71qlp"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D2C3DEAD5
	for <linux-leds@vger.kernel.org>; Wed, 27 May 2026 08:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779870757; cv=none; b=Icd5NYDFQQtb05jQYKUK9iDAeO4EyqU84KhQgeR7bb8y+Jpq9BWuvWrsRQXaEhG6suAE2+c5ZktSU9bW1Kb4EDb6Gjmbj0NFRjfM8RvVPdcxTXYCmOEgoOrkx72UQHcAtJRgbgp+m9wAPdV4C/Akms863wCVWw/yWDnNHPFdYI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779870757; c=relaxed/simple;
	bh=CLAiSUrVd2gqGwAHS9VaY2GKKi5AVjvUsv3x46PJT4U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gM11EiQdVstyJDoCGqhltjEYTMd9a371lQlxXleQz2RKUV2QF+plbrt5Blhupx6PmrbPdWLNoVambQMBl7ugOKMK3oaPGyGAhrrlrQY2et2zWuqngZg06Hv6d1QWmp2k22NkF4vaSIb6AXTrkwHMx7gnO6pv/PkYXkfXSp+FZUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Aln71qlp; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E66311A36ED;
	Wed, 27 May 2026 08:32:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B15DA601A1;
	Wed, 27 May 2026 08:32:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A48910888435;
	Wed, 27 May 2026 10:32:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779870753; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CLAiSUrVd2gqGwAHS9VaY2GKKi5AVjvUsv3x46PJT4U=;
	b=Aln71qlpVMcdGphX67KoMmp+qSif13pKUdBszMxVUi6ItdzWD1sNItYpWhm+uuUELsgQ3J
	iA8l4If4U0hROlT5J8ZYn1DxtdbGyBB+00Mv+LqFDOAGjr/91V5MIl7yjpYC+P2/Rd2trA
	rxaMcs0b521U1JGUm/juxEOa3sL+1ormYRxX3Ow1u6yipRQC5ynmbyylPHRDjWrgHC9st9
	MDx4uLdD7TiavY7e70wBepI0+DTtdMdotkCtIUd+cmrU37omuegNmQ7c+NAs+Ya66G88TD
	yARvO3IYCcGeAsNsQ2xrBJq0oimPorlqzl/H/jv5B+Zd6t+WzNEdYPcRcn0cAg==
Date: Wed, 27 May 2026 10:32:25 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Carlo Szelinsky <github@szelinsky.de>
Cc: Jakub Kicinski <kuba@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org
Subject: Re: [PATCH net-next v4 1/2] net: pse-pd: add devm_pse_poll_helper()
Message-ID: <20260527103225.5d408809@kmaincent-XPS-13-7390>
In-Reply-To: <20260523192027.319105-1-github@szelinsky.de>
References: <20260414161146.77b70d4d@kmaincent-XPS-13-7390>
	<20260523192027.319105-1-github@szelinsky.de>
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
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8323-lists,linux-leds=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kory.maincent@bootlin.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,bootlin.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,szelinsky.de:email]
X-Rspamd-Queue-Id: EBC4D5E128F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Carlo,

On Sat, 23 May 2026 21:20:27 +0200
Carlo Szelinsky <github@szelinsky.de> wrote:

> Hi Kory,
>=20
> Sorry for the late reply. Too many different track and I got lost.
>=20
> Just to close the loop on the notifs_mask OOB:
> v5 1/2 ("net: pse-pd: add devm_pse_poll_helper()", sent Apr 29)
> extends your bitmap pattern from 5099807f335c to
> pse_handle_events() and pse_poll_worker(). Storage moved to
> notifs_mask pointers backed by devm_bitmap_zalloc, with
> bitmap_zero / bitmap_empty / for_each_set_bit on real pointers.
>=20
> So the new code in v5 doesn't reintroduce the OOB.
>=20
> Does this make sense?=20

This does.
Sorry I didn't have the time to take a look at you v5.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

