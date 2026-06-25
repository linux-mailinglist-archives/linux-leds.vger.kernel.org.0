Return-Path: <linux-leds+bounces-8742-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j73bJcPlPGojuAgAu9opvQ
	(envelope-from <linux-leds+bounces-8742-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:24:35 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6E36C3BE2
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:24:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=iDgdYCIN;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8742-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8742-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 41ECB300468B
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 08:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E03037BE60;
	Thu, 25 Jun 2026 08:24:31 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6107B37B03E;
	Thu, 25 Jun 2026 08:24:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375871; cv=none; b=fg8Aa+I0WqKIRT0eHHhwlY1fPYx6uifsee5FNJAVumhN18r+zqZeQKP1sDcVG+W04wCCXoXVN0e5C0PxA28v0bPCWfzIt1aiU3toVDAljuo7SALa29yvEKiFkOChSARftkjmLGJBJOSiAS8xkGpNKOyDmKo1zT/TcVzGt8D8Ob8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375871; c=relaxed/simple;
	bh=QqpFTRuCYbfkrvajuXGbgu8Cm7Y1hSYlQvHARFpT59w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lb/PzzCtq3miNxsyJs7VYK+2dwn9Y17Yt3Q7Xbk2r1aqibDSsRanjUsWbitiPV/xUmqWuF67dG5CXc7WiUDVB8D3kvlD1ptXdINVe+OE6FIp08f4+KmAlnHo4PZ1Ym5tIRHBbulT3UNWsKBzChiYAmVAQgzz5uysZqawSEF7e7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDgdYCIN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95941F000E9;
	Thu, 25 Jun 2026 08:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782375870;
	bh=QqpFTRuCYbfkrvajuXGbgu8Cm7Y1hSYlQvHARFpT59w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iDgdYCINetY7SkQ2ivYP8zNSDTSzrLzNMnSrZ+15idpq3UQXUXupK1rAmupvaT0cR
	 gLI8srx7gNcaOrBO7dKATVDg6EC1tz4O8ajuTdFp+ma/BphnnJBorwGXWOzdzFNuWp
	 onPynzuYa5ZNsTUwrZMVvvwNHSUCW705fUuiFQGF3TD0fCoHQoIWMaF3ISNiiuJ1WX
	 DUCat5VQE7MixipWPAQqbV9q020q7IHbRGG/f2fQ+hHy9e12yHw0EFwg0UiqFjoPqs
	 jIDeouEf0M0JpeIAbHdu45YtW/sr41KOWQQDhcgrZ0tBjPurGMHPeeA0QmeHxaCbKm
	 rdvMVwp5Uly5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/6 RESEND] dt-bindings: leds: leds-cpcap: convert to
 DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, lee@kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260625081812.33474-2-clamor95@gmail.com>
References: <20260625081812.33474-1-clamor95@gmail.com>
 <20260625081812.33474-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 08:24:29 +0000
Message-Id: <20260625082429.B95941F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-8742-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:linux-input@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:lee@kernel.org,m:conor+dt@kernel.org,m:linux-leds@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,sashiko.dev:url,lists.linux.dev:replyto,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE6E36C3BE2

> Convert LEDs devicetree bindings for the Motorola CPCAP MFD from TXT to
> YAML format. This patch does not change any functionality; the bindings
> remain the same.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625081812.3347=
4-1-clamor95@gmail.com?part=3D1


