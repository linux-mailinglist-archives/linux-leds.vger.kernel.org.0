Return-Path: <linux-leds+bounces-9024-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AduPNH1jUWr4DgMAu9opvQ
	(envelope-from <linux-leds+bounces-9024-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 23:26:21 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B15BA73ED82
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 23:26:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=oUjtMk2Z;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9024-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9024-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CDD07300809C
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 21:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78363A4513;
	Fri, 10 Jul 2026 21:26:16 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0B4395AF5;
	Fri, 10 Jul 2026 21:26:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718776; cv=none; b=OGyNZMi+kGLgw7pE5a0Y60fBDUeQX5TEABe0cesO27ljCjuxMT6Hkza9ROR/aR/E+lQf++9ELP/wjcMRIfHUK+wtRY8yb/fkucr5+h/0VgVaz3e5qAjZjQ/5FpNDMscYkvOHtgM8BsBrjwIvaJHGjTHF+wtlyWVmrbje/6TZRTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718776; c=relaxed/simple;
	bh=ImAdpjj6L7TePNCLILLQLrYE8S2FWD4xJGB6aL5SP20=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GlIh6+eNNZAQlMfoUqapGJ0iZbNCPBloyaQ/cKoyVcGpZ7t404jFHTBN/Cydq4NOLJGaQ0DCfabZZAl5op3Uth3d1DmZVMaPsXbZ8y3zlhAqZ7eXB3PnVwvKd4859NL/9XsxsQdI28SgVNfwOGDbKudZOT1WC20KUPycWqprAqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oUjtMk2Z; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4CC1F00A3A;
	Fri, 10 Jul 2026 21:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783718775;
	bh=ImAdpjj6L7TePNCLILLQLrYE8S2FWD4xJGB6aL5SP20=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oUjtMk2Zb5L0iHHrWATUMSN6gJGdvakM3vq+Eu4eA/hDZoH6Kcvdb0KuWDw4A6C43
	 njfSUgtE0gkb/gidI+Mg/MsNxpav7Tytj2LGECIyZxV4usJHPKv+v0apsq8LOsiKL+
	 fJRHyclX7C6+irbLKbXGEJzkcIESmQphnX4kXTEXkcbomT2C5S8S44EmK9MWtskB5s
	 fn0JVUzI30IOD6xcHTIjaFuVEOuaoqLFKsjlaVVaWyhOnp4jDhQXVYz0cvoaa8uAFf
	 IPk2P49lXSpMziUC610FLBh6aSt1nq4qDjCi5GwvoA0QNIIJjyY6+hX+NtreAp0eQH
	 q31GfXxYENgyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] [v6] Input: soc_button_array - select
 CONFIG_GPIOLIB_LEGACY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: lee@kernel.org, linux-leds@vger.kernel.org, dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
In-Reply-To: <20260710211854.1371746-2-arnd@kernel.org>
References: <20260710211854.1371746-1-arnd@kernel.org>
 <20260710211854.1371746-2-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 21:26:14 +0000
Message-Id: <20260710212614.AD4CC1F00A3A@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-9024-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,smtp.kernel.org:mid,qualcomm.com:email,sashiko.dev:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,arndb.de:email,lists.linux.dev:replyto];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:linux-input@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B15BA73ED82

> From: Arnd Bergmann <arnd@arndb.de>
>=20
> This driver converts information from ACPI in x86 based tablets and
> laptops into platform_data for the gpio_keys driver, using the obsolete
> gpio number based interfaces.
>=20
> This should really be converted to some other method, but since the
> conversion is nontrivial, have this one select GPIOLIB_LEGACY for the
> time being.
>=20
> This enables turning GPIOLIB_LEGACY off by default on most kernel
> builds. Since the driver is only used on x86 portables, add a CONFIG_X86
> dependency, which means non-x86 allmodconfig builds usuallly build
> without the legacy gpio support.
>=20
> Link: https://lore.kernel.org/all/ah-1z9LhVG0wtfBw@google.com/
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710211854.1371=
746-1-arnd@kernel.org?part=3D1


