Return-Path: <linux-leds+bounces-8744-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CZhsIl7mPGpXuAgAu9opvQ
	(envelope-from <linux-leds+bounces-8744-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:27:10 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 877A06C3C78
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:27:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=n4AwCQrb;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8744-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8744-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 23F6030184E2
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 08:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D5F13806DA;
	Thu, 25 Jun 2026 08:26:09 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDE12253EB;
	Thu, 25 Jun 2026 08:26:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375969; cv=none; b=uyYw5KicnX333Ce2SZ/ToJ3Lax4PVaUj+LFIqIms62rqLiyPeKUtCU+g3LV60IpaeT8+XfDQalrD/nDwfBxKmMBn7Jdz/6baZKbac9G8bcvA98xgusocXdWf7AD+MHoQ8Y5H0FrYSFaly6RaOE6wQXHFnjjqhgsmKPtfahUwsS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375969; c=relaxed/simple;
	bh=ogAQWFWgAEmefIFeK/00KKpXvA8UTvhOmXX+TiM8k7I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s308C9Z9kbG1IgsHyriTipp8P3Ifj2GA3EnlrEp3AJm+/nysiVWEqKWw8IYVso649LiHNDZ5B/GT1Q6d/VNCKD/EtPyRLMjpwk0okk9LdYmtZn4O6Tdh5E9RdDjHvSPm3C82NCWPOQwSzCCYQiTNbEfXAooPPa3q+PY/LbelwPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n4AwCQrb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 512B21F000E9;
	Thu, 25 Jun 2026 08:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782375967;
	bh=ogAQWFWgAEmefIFeK/00KKpXvA8UTvhOmXX+TiM8k7I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n4AwCQrbV+OQCQokPZg1Ct+t7bfVK1nA51j0TEDMNAzAg5ly9TKHcsMLk8XTgag8b
	 TFIWRGAdvr11iH89t7ouqGoLhcxEULlcB7YEaiBhVpDkaCz4wJ4c/qh4gbEWLTiKWz
	 i56GO7uUEFwkQ+vVYi0uXC2CrhG2T15gL7dtJEn08CG9OT/mGE5XDP7LeTMFdoHjy+
	 wBRI4yNTXSIHQ8aOKgxBrE6a99zZLNwINadE6j10U01YhQJ69Huyj5fbVCXUU/ZcWX
	 ih45SeoitABKwtdb/oyTQBoPIFfOycFFeO2BiGlL/OeQ+RPeekzvkbNb/IG/18cw66
	 M0u6/UuIG9F0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/7] mfd: Add driver for ASUS Transformer embedded
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, lee@kernel.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-leds@vger.kernel.org, dmitry.torokhov@gmail.com
In-Reply-To: <20260625081529.22447-3-clamor95@gmail.com>
References: <20260625081529.22447-1-clamor95@gmail.com>
 <20260625081529.22447-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 08:26:06 +0000
Message-Id: <20260625082607.512B21F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8744-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:conor+dt@kernel.org,m:lee@kernel.org,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:linux-leds@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:conor@kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qmqm.pl:email,sashiko.dev:url,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 877A06C3C78

> From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
>=20
> Support Nuvoton NPCE795-based ECs as used in Asus Transformer TF201,
> TF300T, TF300TG, TF300TL and TF700T pad and dock, as well as TF101 dock
> and TF600T, P1801-T and TF701T pad. This is a glue driver handling
> detection and common operations for EC's functions.
>=20
> Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625081529.2244=
7-1-clamor95@gmail.com?part=3D2


