Return-Path: <linux-leds+bounces-8840-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nt+LAzRvRmolVAsAu9opvQ
	(envelope-from <linux-leds+bounces-8840-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 16:01:24 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC726F8A53
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 16:01:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YWwrJmaq;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8840-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8840-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB31230590AC
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 13:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C394A2E01;
	Thu,  2 Jul 2026 13:56:08 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F1E42A7AD;
	Thu,  2 Jul 2026 13:56:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783000568; cv=none; b=XAkIk3Ro42OOy5fvnOdPABdbVluC07bSg8GYKgLBSZ4zMaTWz5MWX+qZiEC17UMyDOBkv1J0e7nM+l0p1rcLeby6pehwIGvoDI4fXbSWrywLByvWm2Qy7CNW4TryGktmwToODN23QD0M5Annmb9dVNy5GMnoTx9rAYLtU0kzr4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783000568; c=relaxed/simple;
	bh=KMh+d+4YvuIT3L7XAtCuxUSBmLIkaYYGtqOt6pQR0ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kUppvT5DSfPxJ0yWYYG1KPze4iIwigUo+v4Hvj4Kw9GYiJli1MjgWCuRlqIYE1EYVw/Qza5jycxxImcMzScTtIYuJ+oIh2kQBL1Wc1E1WyCX9mjueux/DmT1JoUUXwpvoi3WS12BJycS6J/zivLgGD3VcUlfbot3c94dn/fhLEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWwrJmaq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1E21F000E9;
	Thu,  2 Jul 2026 13:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783000567;
	bh=PXLihuaPglXVOXzLjkFS0ahzQ9+d8CRPgbnAm3DoXUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YWwrJmaqp8JTuPi9rZCGCJtU7fohTNeO/qN3gxmOrCuLsaSruKXvz3L7H1bPR112K
	 BqOrnulppYRFnK4VpmfjbRWM1MeS/HF7rYLiuaLqbwkRwmkWGD6h8kIb5PO1z4Zmtf
	 6+p3z7YfvpV0nT/wgkTUuALf+mVDCFL49qfgeTmVwRy7wWU17+4Sx5ljkKVL2hb2wD
	 6nPwwoj0ypIob1TAgia5H0PstyhkYP+WsiMvxWNZWZkMfdNBJJuTqVzqasEjmYo8BH
	 rQ76LtXLEnyXPsC5woK0yMwRQXhjOzwiiRh+tZ5eJAVIwEpyVVMZEoNcjm57DwGdiH
	 5wcAMtuR5u7dA==
Date: Thu, 2 Jul 2026 14:56:03 +0100
From: Lee Jones <lee@kernel.org>
To: Manuel Fombuena <fombuena@outlook.com>
Cc: pavel@kernel.org, vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/9] leds: st1202: fix multiple bugs in pattern engine
 and brightness handling
Message-ID: <20260702135603.GP2108533@google.com>
References: <GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[outlook.com];
	FORGED_RECIPIENTS(0.00)[m:fombuena@outlook.com,m:pavel@kernel.org,m:vicentiu.galanopulo@remote-tech.co.uk,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[sashiko.dev:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-8840-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sashiko.dev:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCC726F8A53

On Thu, 18 Jun 2026, Manuel Fombuena wrote:

> This series fixes several bugs in the LED1202 driver related to hardware
> pattern programming and brightness control. The issues were found during
> testing on a Linksys MX4200v2 router running OpenWrt.

Still a few potential issues highlighted - are they yours?

https://sashiko.dev/#/patchset/GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com

-- 
Lee Jones

