Return-Path: <linux-leds+bounces-7104-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKiJC+K3qWlEDAEAu9opvQ
	(envelope-from <linux-leds+bounces-7104-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 18:05:38 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC39215D93
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 18:05:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80A60306533F
	for <lists+linux-leds@lfdr.de>; Thu,  5 Mar 2026 17:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D971F39FCA4;
	Thu,  5 Mar 2026 17:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kTES/U+h"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D6F3CB2FA
	for <linux-leds@vger.kernel.org>; Thu,  5 Mar 2026 17:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772730142; cv=none; b=GqGBscc9Al+iqzveHzP8gZ2WMrQUmU5Sg3bVZ6LLcoORNlAjmVBPCz+V7SnwhnmwNw8v7hr3XbHEr/fB7yzr5AJML848g5KIAKW5zktkvJTrL0g6ttMnKT6hru57p08Vqfhc8WoEMLaQZBDigrIyLoNHjXEe+p1Xc/HT7Myoi0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772730142; c=relaxed/simple;
	bh=KZ5JBTEMvrwcsJ8djLfnOIxh+RoZq+jMyLeliqTXwFs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NuU51n2plcclzEKkCS7KcWgzz2FdGJ7m0JhkzsM2QHhm8RJ6MUjzpLe1jnJiaGmSs9mBnFiQOyj/1zDAHZcVp3H0tP7Qs4VUt6g5ldi5irwTL4YT7TPKEQ/2jeW3CJths1zoOoKKF/uuHCcZdWiXz622nAdPhPrV4TmfPxVPM+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kTES/U+h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA0CC116C6;
	Thu,  5 Mar 2026 17:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772730142;
	bh=KZ5JBTEMvrwcsJ8djLfnOIxh+RoZq+jMyLeliqTXwFs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kTES/U+hzUGnGg9NfUhVbMDhINdxuvUaXkgQXpA/aO8ph6kHcLOI/gtCmT7jWmGkL
	 b7GtKY1L2ULf/HzvRg7XJ37NHUJo4D6L/Pekwc2HrtQdbgrxGpw4D4lyPc0hMM82yo
	 inqXqcRgzR4tCFzSN6yqrB2ZPsed+1zlSo/2dLEcV6bqH3FFC5sMXlbNredVrgsxs9
	 /dLN3Lev1oSnO4YTRqydy1h7pZtpqePD0EkRZGTT4hrVohzoNgRIsoC3xKc4bHvx15
	 J44wWRVRv12nQxJiXDNVdDkwyCOt0Y6bsq0KRg+M76/WswOBZcmd/ubGcuX2Q+vqLZ
	 e2Zpoo0EpdS+A==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Michael Tretter <m.tretter@pengutronix.de>
Cc: linux-leds@vger.kernel.org, kernel@pengutronix.de
In-Reply-To: <20260206-leds-multicolor-fix-signedness-error-v1-1-48a00ed33c07@pengutronix.de>
References: <20260206-leds-multicolor-fix-signedness-error-v1-1-48a00ed33c07@pengutronix.de>
Subject: Re: (subset) [PATCH] leds: multicolor: change intensity_value to
 unsigned int
Message-Id: <177273014112.321702.15159156714467402540.b4-ty@kernel.org>
Date: Thu, 05 Mar 2026 17:02:21 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-Rspamd-Queue-Id: 9DC39215D93
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7104-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, 06 Feb 2026 15:21:23 +0100, Michael Tretter wrote:
> Using min to compare the intensity_value with led_dev->max_brightness
> causes a signedness error:
> 
> 	drivers/leds/led-class-multicolor.c: In function 'multi_intensity_store':
> 	././include/linux/compiler_types.h:630:45: error: call to '__compiletime_assert_195' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
> 
> Change the type of intensity_value to unsigned int to fix the signedness
> error.
> 
> [...]

Applied, thanks!

[1/1] leds: multicolor: change intensity_value to unsigned int
      commit: 2c490329e3a3ab896cb08eb34a0dbf254cf11e9e

--
Lee Jones [李琼斯]


