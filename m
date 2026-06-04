Return-Path: <linux-leds+bounces-8481-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2R6vAEqYIWpVJgEAu9opvQ
	(envelope-from <linux-leds+bounces-8481-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 04 Jun 2026 17:22:50 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84729641611
	for <lists+linux-leds@lfdr.de>; Thu, 04 Jun 2026 17:22:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jI6Xosr2;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8481-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8481-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D411C303DAD3
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jun 2026 15:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3DBE32573F;
	Thu,  4 Jun 2026 15:15:53 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFE978F3A;
	Thu,  4 Jun 2026 15:15:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780586153; cv=none; b=jOaFdd80/aMLg0CI98T8SZeDxkqcggQTh8Wkh6TAr+OUDN4s0jaDcqWKBmsdxMf6sZkiEkkaGFruGf1p0HIiNYCs8Pxx9tnRh9J/yDx4FaUqjBR03MROholc6JM02TWrZi1J1bNM9EEZepzAuVA5v2tcVsBzaK8Rmh6rJRiFiZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780586153; c=relaxed/simple;
	bh=3xFriHZVShb9ecAqrTD2gS45PG/1Hm6NqLzlJokr8O0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tNUun+/mkLYPZQwe7OdfbpXnxuR/fPkgalyd05sYVpM+Tr1I5KLyBuDwZwM4/PczcnyML9eTQ6o5pBBxK5N1kND/1XOjHXkguuIt/msammkIAXvQv+X39H20uFpKloE3iHaUQQFy1mhMpDItjofZ4hzhnYOnExh5tS3xizDu4rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jI6Xosr2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353FD1F00893;
	Thu,  4 Jun 2026 15:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780586152;
	bh=d16veIcIRePGTgRSArWYxKcdAb7BqWhj5ZqwLOVbFuc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jI6Xosr2DolrceqdPk+oQGCaoWhlhs92k56Ec/RO3m82ro3zCqgL6y85Rc/7+Da9k
	 lxRPpjwb5hCe7XEt+f4+lMWP84uxayByY/YrWbwt+UygtOwxY6iXpDmMASBGeBgGkC
	 DaBEDJLOL4h1M0Hg0ZWmXO0Z6PANGymIE7CBddAdQ0pzHMDSxxkY3JEcyLdHjMMWu6
	 C1b5CCpn40OhRt3/yVw0L3rLeqEmM3R0Jp0/3U+qzlWS9KjfdAeQLwTMEbuNAhBC0E
	 bSV9W4P/TcdaV7WpR0YrT+ybm3x8XAYi0ydFk/IaHyCJwboX9kHZi5I1MqdYj+N0xh
	 HQqLLEIVVfb3w==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Lukas Timmermann <linux@timmermann.space>, 
 Jan-Simon Moeller <jansimon.moeller@gmx.de>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
 Riku Voipio <riku.voipio@iki.fi>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Jonathan Cameron <jic23@kernel.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260522104222.4081017-2-u.kleine-koenig@baylibre.com>
References: <20260522104222.4081017-2-u.kleine-koenig@baylibre.com>
Subject: Re: (subset) [PATCH v2] leds: Use named initializers for arrays of
 i2c_device_data
Message-Id: <178058614993.50485.12482605743964141441.b4-ty@b4>
Date: Thu, 04 Jun 2026 16:15:49 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:u.kleine-koenig@baylibre.com,m:sakari.ailus@linux.intel.com,m:linux@timmermann.space,m:jansimon.moeller@gmx.de,m:alexander.sverdlin@gmail.com,m:riku.voipio@iki.fi,m:kabel@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:jic23@kernel.org,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:alexandersverdlin@gmail.com,m:laurent.pinchart@ideasonboard.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-8481-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,timmermann.space,gmx.de,gmail.com,iki.fi,kernel.org,ideasonboard.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 84729641611

On Fri, 22 May 2026 12:42:22 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
> 
> [...]

Applied, thanks!

[1/1] leds: Use named initializers for arrays of i2c_device_data
      commit: dce22ae7b4145b52c98e9d9a0b28d67289adfdcc

--
Lee Jones [李琼斯]


