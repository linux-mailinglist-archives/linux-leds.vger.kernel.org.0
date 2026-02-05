Return-Path: <linux-leds+bounces-6845-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHMpB8O7hGnG4wMAu9opvQ
	(envelope-from <linux-leds+bounces-6845-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 05 Feb 2026 16:48:19 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C664CF4C21
	for <lists+linux-leds@lfdr.de>; Thu, 05 Feb 2026 16:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 60426300382C
	for <lists+linux-leds@lfdr.de>; Thu,  5 Feb 2026 15:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B66426EB8;
	Thu,  5 Feb 2026 15:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/pc6UkG"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C96428847
	for <linux-leds@vger.kernel.org>; Thu,  5 Feb 2026 15:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770306497; cv=none; b=vAbx2N9haqmPvP9GMEwwtL+WqkZtrKNmrW7JiBmh5lzokth2bE+XSctMfnKKa/I9WwtxKo+yLaqFiYzAtVt1XvjL0eJ7zO125rtDpN0b4CWj4I+L2z6O1wP+c81JjIGLF20usFry10YSAmo98znGEB8zOtj87HbpnY4d/uU50+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770306497; c=relaxed/simple;
	bh=dOcnKunkIWuJXFH2ZWZlVgs1g6L49KmURwl1igmBcXk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U9t2sKF4vkpZ8PxZqCofZnuOUJxl25ipL/mVhhVwYN8Xn4z9QKroxiSI8UVrmaTPZ2XPL24Sf/Jc1dm8Xo/z3cVVoekow064Ed91U9km2cIAXj8h5x4udOM3hEQFo04arJ8Jjl9WRuJZktGNo5TjCPDS+PHCFAUBas9yIGbodMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/pc6UkG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B584C116D0;
	Thu,  5 Feb 2026 15:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770306496;
	bh=dOcnKunkIWuJXFH2ZWZlVgs1g6L49KmURwl1igmBcXk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Q/pc6UkGIYlq2QjCTX0Pt59n7UnBCHLhFlz+JquEbfOTBSkQkyddzjXBaY1yDNrPr
	 4piL8LfJrKd2R2+j1iNdk3nl4jdRKDy9RgFliUJidpLrQQWeEDHYQF4VlezLHhW2RD
	 gDKTUJTcUFehDy4Bsw8wvha8HO0sajEI++grABt11L+39xyCdq6EGzu8Ksn7hASg6d
	 nHRUvwwMqTGOslo9PRe3anbAfH7cn/i5Gw1dV3Sg7lWNoQX+Tb4bLPsPJ/3tTaIgSz
	 hedH2r0YcEvrwqXvbZaq/1Smv57Y19wgg3UKaIMOzFDAGfE8BYAW8TrUXL3yAiBdCQ
	 CrlA96DxhdbIA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Michael Tretter <m.tretter@pengutronix.de>
Cc: linux-leds@vger.kernel.org, kernel@pengutronix.de, 
 Thorsten Schmelzer <tschmelzer@topcon.com>
In-Reply-To: <20260123-leds-class-convert-brightness-value-v1-1-ae9d3ae4224b@pengutronix.de>
References: <20260123-leds-class-convert-brightness-value-v1-1-ae9d3ae4224b@pengutronix.de>
Subject: Re: (subset) [PATCH] leds: led-class: detect brightness conversion
 base from string
Message-Id: <177030649514.1673459.109305643284556954.b4-ty@kernel.org>
Date: Thu, 05 Feb 2026 15:48:15 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6845-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C664CF4C21
X-Rspamd-Action: no action

On Fri, 23 Jan 2026 10:57:26 +0100, Michael Tretter wrote:
> sysfs-class-led doesn't specify the number format for the brightness,
> but the class only accepts base 10 numbers.
> 
> Use the automatic base detection of kstrtoul and accept the brightness
> as hex value as well.
> 
> 
> [...]

Applied, thanks!

[1/1] leds: led-class: detect brightness conversion base from string
      commit: 07da045a49bd4cb17678d74efbdd600c71b136d4

--
Lee Jones [李琼斯]


