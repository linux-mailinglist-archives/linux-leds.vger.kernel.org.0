Return-Path: <linux-leds+bounces-8738-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8XbBMBvmPGpKuAgAu9opvQ
	(envelope-from <linux-leds+bounces-8738-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:26:03 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF556C3C4C
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:26:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KA8Bbgzp;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8738-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8738-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3778F30453B4
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 08:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393B037D11C;
	Thu, 25 Jun 2026 08:22:35 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229EB2253EB;
	Thu, 25 Jun 2026 08:22:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375755; cv=none; b=GTeFqXa7Snx0i31B3W3ERKTqg0OyZJMhu4WnkGJqZJ/wP71HfWULcMCJFT8VhrfFfN9nfNxAH68m2U9Y8r49HokWbXydUTsiX+I1HnTyubr594tngYownJe/IyYqSnDt0/RCmjMk4/OzWPygjJJQEnRa6qVHpaUxr0vDpijiLlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375755; c=relaxed/simple;
	bh=EWYYWzY5LGNLs9iTL2sOMPGHuaVNyHjvMgXoaG7+ipM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=glc5iotsXwmgCTJMRInvTgAdLh8KfQ7g0gyjUrK6kg7tyfsqR5Z4/clC1bFsCmBCWKcYhTODkz98m7zBpWElJrryXOUKM6MNO7XCaw8yLHtO8bEJA8jCB8JzB3ImsK1ldwrtH3t0qMry9r4Ylw2oqV72DG+DoGXu2fLvVOSGEFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KA8Bbgzp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD0E1F000E9;
	Thu, 25 Jun 2026 08:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782375753;
	bh=EWYYWzY5LGNLs9iTL2sOMPGHuaVNyHjvMgXoaG7+ipM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KA8Bbgzpn+WLeecrEA/sZJzPfMIJdsxJAilb7lfX32UTI4hHNPnnP1Mp33OLkRYhg
	 K1LRtjO0S2+TI2QWI14V1lZSZt87itlVrmUg+trWqOJRxBWFiju3EC97p97d8+HsSc
	 CljiLJncq5EQpEYU2hguuiW3Svmx6OjOoP67o+r0jyZm076h0+sS8JvfQJT1jCbwBA
	 Wi9JsriK8EfkB06N9Pah33JqN1m0rt0YLQhyUhn4UVjoEupuUh2QDlQopUY2H0tS9e
	 7eEkV+ig6NqBmI3rXI3U14Iho1PI7XtP65zh9eIR+4MOvCsM8prddOlB6hqTmJCso8
	 evU/tGrtBx9LA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 5/7] leds: Add driver for ASUS Transformer LEDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, robh@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260625081529.22447-6-clamor95@gmail.com>
References: <20260625081529.22447-1-clamor95@gmail.com>
 <20260625081529.22447-6-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 08:22:32 +0000
Message-Id: <20260625082233.4BD0E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8738-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:conor+dt@kernel.org,m:linux-input@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:conor@kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qmqm.pl:email,vger.kernel.org:from_smtp,sashiko.dev:url,lists.linux.dev:replyto,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1DF556C3C4C

> From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
>=20
> ASUS Transformer tablets have a green and an amber LED on both the Pad
> and the Dock. If both LEDs are enabled simultaneously, the emitted light
> will be yellow.
>=20
> Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625081529.2244=
7-1-clamor95@gmail.com?part=3D5


