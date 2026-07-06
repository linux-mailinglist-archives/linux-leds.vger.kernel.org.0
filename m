Return-Path: <linux-leds+bounces-8933-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Kwk9Kr1lS2rlQgEAu9opvQ
	(envelope-from <linux-leds+bounces-8933-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 06 Jul 2026 10:22:21 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7074870E0A6
	for <lists+linux-leds@lfdr.de>; Mon, 06 Jul 2026 10:22:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=h152Xv1c;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8933-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-8933-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6697931976E5
	for <lists+linux-leds@lfdr.de>; Mon,  6 Jul 2026 07:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCEB3317166;
	Mon,  6 Jul 2026 07:35:28 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCD83126DF;
	Mon,  6 Jul 2026 07:35:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783323325; cv=none; b=eCHOriGg5ggTeeLBRUG56aGPspdaFytvEPOQdRWJPSWEk2Bck2Zy2urxnxb+bExgCOF72QS+Z4PzCdh9J1ZsbAjBCZv81hYZeBkHYgfGofnR1uM8pex1nq8J9Uhbv1PJtScvGWnx4xpHrpaF/39BaNXGrOT/XIvsFOLaKrmbRck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783323325; c=relaxed/simple;
	bh=1VKGll8VO7q01/u+rSZ+/ZBVXEteUob5QpHa0DFBAYE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=du7g1QCQdSrPw8BPQ7JtRElW7QP1j56duiJPjpSAPbZ/so21O/Qf9fNeW7UR6JpGY10rPSS6E9W44b/zQry/ByPv4oKeGKlbovUm9WugZ21IjTQZweJVJ5E/aK0KSvHN9wEwz/NI2+UtKvINsW46skSepWFHqEleWO23uVUAJGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h152Xv1c; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE07E1F00A3A;
	Mon,  6 Jul 2026 07:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783323317;
	bh=1VKGll8VO7q01/u+rSZ+/ZBVXEteUob5QpHa0DFBAYE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h152Xv1c9JnC7ZCYhL0We4s2tV2ZYo7OBn6zlfHoygP9aMXxe4XWzKsN7bMyys8r0
	 30fI2b7aStcYWwjVLxrLJjNTB4zX2+0v9z+iFyD3mlTFm1HgsGXyJOGLDvaTbICtLP
	 zwlu5xbbdU+oKaG2emZVYZGkst23hdq1wf6izMKItDk4+wdoCw/u3BvrK4jA4xgRHP
	 hv3ZWcVp48dhhqLAb84vDJDAhl9JCBmFaBTU8XEDFgbeBx/SO/lNzAryiejLyAFDt9
	 bYibfj9gWDd9lHiIYnB3glcUMdqEIJsUB/FIQXnjQUaXOTM/YY77h4fvSEYtKBVDql
	 FaztXIHN+JDSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: update my email address for the AW99706
 backlight driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junjie Cao" <junjie.cao@linux.dev>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org, robh@kernel.org, linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260706073307.1038430-1-junjie.cao@linux.dev>
References: <20260706073307.1038430-1-junjie.cao@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 07:35:16 +0000
Message-Id: <20260706073516.BE07E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-8933-lists,linux-leds=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:junjie.cao@linux.dev,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:linux-leds@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,sashiko.dev:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,smtp.kernel.org:mid,vger.kernel.org:from_smtp,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7074870E0A6

> Switch my maintainer entry for the Awinic AW99706 WLED backlight
> driver from my personal Gmail address to junjie.cao@linux.dev.
>=20
> Update both MAINTAINERS and the device-tree binding maintainers field.
>=20
> Signed-off-by: Junjie Cao <junjie.cao@linux.dev>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706073307.1038=
430-1-junjie.cao@linux.dev?part=3D1


