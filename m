Return-Path: <linux-leds+bounces-8483-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LdFtFGGfIWqcKAEAu9opvQ
	(envelope-from <linux-leds+bounces-8483-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 04 Jun 2026 17:53:05 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CB0641996
	for <lists+linux-leds@lfdr.de>; Thu, 04 Jun 2026 17:53:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NRsAoY7j;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8483-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8483-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CAA1301455A
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jun 2026 15:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3DD34CFA1;
	Thu,  4 Jun 2026 15:39:21 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1566633D6DD;
	Thu,  4 Jun 2026 15:39:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780587560; cv=none; b=kMVdR+ivXwLY2tyGEpOdMsT9dWpc9vDtWQKhz+NRQfbsfpWsdfrF4ATRKig7hghZ6TOzbQeakNgZgRQ/SQFTUuNatEynu5+InlZ20KGNzGraIRICzvn1eUsHoc7YB8spzAPVNCOgLDGBI+7slpjG4dg6UhIFsYxNDgoELZE8ec8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780587560; c=relaxed/simple;
	bh=FwXfzorioxEmBEwxUR7juggtZ3fXff97YXjCVNMfvt4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uH+Q3ZOyYfYbeeQJ9m5w19NmdJ0kUcIp/dOwFsl5Du1SbS7bBHiLZqNbOlGFNfuiJJd5YX6EH+vU1uz5EkYGqWw1RyQEL6PrHdS00c+GmHyzQGzFFu7BHhOKXjXuuGpxNfspaB/Hs+APJjntVj7+Jg+EErTGDxA4VKty8QegTsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRsAoY7j; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91DFD1F00893;
	Thu,  4 Jun 2026 15:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780587559;
	bh=WIjgeloGGVlHcSVb4WWYfAPYHDejWwOw4WcMpkn2jUQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NRsAoY7jriDkTQykWKgbIs75zndpAPjvQizqwq+x/TK2b72/UY6ikrX1gh57dN30L
	 y7W8plQldWmCNl2VxRRAPEPYEJvIRSiU4i+NS9dT/oAI03OxqfWCuBuOysPLninnml
	 qEh8Eo5DvHvho84V3jYCausqaqW0b6ATzx50lkGwRUksPmfIVih8BBzwzQHZtZbEHG
	 S4Cf4LVaJ1LYXqLElxokIqacWK5WLNR1SCQWPgCiyD9kF96kMkupRCbW4ez7H9TuGx
	 W4EtOliIqmKy5HxJZXGa6iDMKN42hjsG0grU90J9GJifhWaGxTmYl0G7aTrfoVOLmE
	 FZd+wVr1KoyNg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@kernel.org, Armin Wolf <W_Armin@gmx.de>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260524235553.189134-1-W_Armin@gmx.de>
References: <20260524235553.189134-1-W_Armin@gmx.de>
Subject: Re: (subset) [PATCH] leds: uleds: Fix potential buffer overread
Message-Id: <178058755832.68831.13304002591164882113.b4-ty@b4>
Date: Thu, 04 Jun 2026 16:39:18 +0100
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
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:W_Armin@gmx.de,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmx.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-8483-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4CB0641996

On Mon, 25 May 2026 01:55:53 +0200, Armin Wolf wrote:
> The name string supplied by userspace is not guaranteed to be
> null-terminated, so using strchr() on it might result in a buffer
> overread. The same thing will happen when said string is used by
> the LED class device.
> 
> Fix this by using strnchr() instead and explicitly check that
> the name string is properly null-terminated.
> 
> [...]

Applied, thanks!

[1/1] leds: uleds: Fix potential buffer overread
      commit: 22b69b2c0a5573e58ad66693196fc86369980568

--
Lee Jones [李琼斯]


