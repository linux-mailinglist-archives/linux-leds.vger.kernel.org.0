Return-Path: <linux-leds+bounces-8638-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IWLjKKqzMmok3wUAu9opvQ
	(envelope-from <linux-leds+bounces-8638-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 16:48:10 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CF669AA68
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 16:48:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="VeUXPv/c";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8638-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8638-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57D3730F4D54
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 14:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E00893F5BC3;
	Wed, 17 Jun 2026 14:48:01 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31463E5570;
	Wed, 17 Jun 2026 14:47:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781707681; cv=none; b=AiAcLAvV0Qgx4a1Vj1cD1NgFJfBYdi3yKOB5O2mtzTCVZepDUPLAuMtuV8oA/7NE0YMLfY27y9HXa8oAgU/Mhap0g2LWMYLOP4861mD6zwahsqFNvbe0hjuM/OOQlVOjhdJ3+pf+ZkU8rCCCQQ9+SuLvBVzVHJqQD3+YU5zcze8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781707681; c=relaxed/simple;
	bh=gbcwfIqQk/SiNy9mAf17Fap730sdHglnahEjyBgjgbc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=isnx3MdLnBHJfGkzfD3rAvIQ+N3IZU+ZBUEkOMfRqrgGqJ0sikuWBiwHyi4BmbZmbygaV/F4oVPUin6/NQJaNom8kMxKY8GXOIVurcwBPywu6E7nLtv5DSKYPxY1xUJnamORw9hB/lM06xI+kXcm1drE41YlxlqkZL5vonNAwKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VeUXPv/c; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77BE51F00A3A;
	Wed, 17 Jun 2026 14:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781707679;
	bh=eZGB9EDPJPmx499AeGY1lMTU/ir06dPRWzp+DbysV3o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VeUXPv/cbM99dmwl/oLl4HegllRbhasfo/lUJmLiczml+sWJtHKneBqlnkytBZNJ7
	 7OX3Vgni+JwHpcpkwrkkZi9EZErk9uYYIKRF1YMZzvJRg7jd+TJ7f1M2yGS9ZyLK3g
	 uCAkFfIerlNIGC7D+FQdt0LVO3ndrTzrkEQ75b2d+oEgJu7+Sd07SFdX+vC187ivwM
	 JwRGy4Oi6HNRzn9GQ+F09ZCF9Na55/XZ7kcXS0KwWHh0KGXpgH+LICAs2X1LQuHU8O
	 FoaudrESv9qL/oivV1eWbm899j8WD+Sh4aCBLcwqSZNx3KflPhQwmXdklNvredoKEh
	 BqFP6Vdndyung==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Sven Schwermer <sven.schwermer@disruptive-technologies.com>, 
 Jonas Rebmann <jre@pengutronix.de>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de
In-Reply-To: <20260605-multicolor-default-v2-2-ed07271df6b0@pengutronix.de>
References: <20260605-multicolor-default-v2-2-ed07271df6b0@pengutronix.de>
Subject: Re: (subset) [PATCH v2 2/2] leds: pwm-multicolor: Introduce
 default-intensity property
Message-Id: <178170767624.1623415.15294454040580448912.b4-ty@b4>
Date: Wed, 17 Jun 2026 15:47:56 +0100
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
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jacek.anaszewski@gmail.com,m:sven.schwermer@disruptive-technologies.com,m:jre@pengutronix.de,m:pavel@ucw.cz,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:krzk@kernel.org,m:conor@kernel.org,m:jacekanaszewski@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,disruptive-technologies.com,pengutronix.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-8638-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 10CF669AA68

On Fri, 05 Jun 2026 09:27:48 +0200, Jonas Rebmann wrote:
> Like all LED drivers, pwm-multicolor supports turning on an LED on boot
> by setting linux,default-trigger, e.g. to "default-on". pwm-multicolor
> however scales the brightness of the color-component sub-LEDs with their
> individual intensity value. Since these intensities are
> zero-initialized, on boot a trigger is invisible until colors are set
> from userspace.
> 
> [...]

Applied, thanks!

[2/2] leds: pwm-multicolor: Introduce default-intensity property
      commit: 69dd3b9d8681085eceeb35459a12d67b848372d4

--
Lee Jones [李琼斯]


