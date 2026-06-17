Return-Path: <linux-leds+bounces-8637-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vnEQEqGzMmoe3wUAu9opvQ
	(envelope-from <linux-leds+bounces-8637-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 16:48:01 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF89F69AA65
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 16:48:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WD97aG1H;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8637-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8637-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4DC9D301FF0D
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 14:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC102BE7AB;
	Wed, 17 Jun 2026 14:47:58 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610512E06EF
	for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 14:47:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781707678; cv=none; b=ZpX91TDa4cKnuBhEl4T4olcl1/Xg6QlGgsUojnxc3cbR+T/n7RbC14/PFn1rXO2zhxrCk1JdVJGGTKWbiSXhudCCN4UWmQfLaJd9jnekJxF7muex3MjwtY2ZfB79gp/4IDLM5qA/yFMu5QHrhmIoY3I74Q8PQdpX4NZ08mXDFs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781707678; c=relaxed/simple;
	bh=bbO7Y5mkeQBIg0tybl9fvxjl2WCeMjy+pR/ZHeWPeOU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eRR2FSsgzRAPugtxiYkQfDc0kZ2q6eTZkiygAhsajdjYFDfZ3SNNjvcrZZWbcnMdZAX6e8LUBeBGT351wcZ9W1pcU+wzVSlgzWKFh2A1XYTJ9qJZu1Z76Rep/NnUjAuCUYg1V6yLGG06XzIL4DTPZIiMqXHtNa4Vv2enbpyw2O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WD97aG1H; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF7D1F000E9;
	Wed, 17 Jun 2026 14:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781707675;
	bh=k3J1Y4oafT0H9z1fk1KMA31K416N4UNTVaA78yiboMg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WD97aG1Heu7f9/a+IAZUHtU75Cf3IVCGwYBXjFamma3avHDsewJZwx4aYnUT9pm9g
	 ECFiM9fSexLGWXyuK9NtNmJSkSsCRSgBPDw/7acPn1H7cnZREUX1BRr7BdBolnsdyW
	 BCGlEE9qCrdY9K+4sRZapn6qCZ/CL5ptBunXYJOTMeIWuqW194ypVYRbYJYvbamsyA
	 NAufCy/ryC7XwXpaIcbf9+O4dz3+dIH24FjICrIr4JE8oU4eFqKr2S+K3HptrSFs1R
	 3SuHYJGzNjdUmxzI2CENM+aHk+tzKHmoHurtI/p2ie9Vjy3/y/jCRUlrQRpZGCcDx4
	 IlNGbM1W0pf/A==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-leds@vger.kernel.org
In-Reply-To: <20260427-leds-st1202-v2-1-119e4cfa6365@kernel.org>
References: <20260427-leds-st1202-v2-1-119e4cfa6365@kernel.org>
Subject: Re: (subset) [PATCH v2] leds: st1202: Drop unused include
Message-Id: <178170767458.1623415.6661985550461880978.b4-ty@b4>
Date: Wed, 17 Jun 2026 15:47:54 +0100
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
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:linusw@kernel.org,m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8637-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF89F69AA65

On Mon, 27 Apr 2026 10:48:57 +0200, Linus Walleij wrote:
> The driver includes the legacy GPIO header <linux/gpio.h> but does
> not use any symbols from it so drop the include.

Applied, thanks!

[1/1] leds: st1202: Drop unused include
      commit: 5ed87cc71c1bc1c3a3449ebd2de83e2b9c32670b

--
Lee Jones [李琼斯]


