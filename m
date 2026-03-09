Return-Path: <linux-leds+bounces-7161-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wP8AOjIQr2ldNQIAu9opvQ
	(envelope-from <linux-leds+bounces-7161-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 09 Mar 2026 19:23:46 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AB423E93C
	for <lists+linux-leds@lfdr.de>; Mon, 09 Mar 2026 19:23:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9297C3001B6B
	for <lists+linux-leds@lfdr.de>; Mon,  9 Mar 2026 18:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220AF346A0C;
	Mon,  9 Mar 2026 18:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TXdOhpqR"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14E72FFDF7;
	Mon,  9 Mar 2026 18:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773080562; cv=none; b=TcgMj58HozoQ3YdBJ/Kk+ngUB5+JjwvKyx4/8/Kldga9lXbohRw2bDt74j89tPSUMRG14iIlWDrL0JOWW9jJOMMjktCUaSU7zfrMlTSr7poFQcqdXCKdf5i9qN8FIEKlsQapFs6ErD9WLCmwwjm0mCbRbO2L/Tif3UbkQWfJAbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773080562; c=relaxed/simple;
	bh=fHyPzZQYI84kpph/uTyLsAf9L3h9GnJHmbSUWm0Lef4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PLyx+zb0lrrO3ey+XG3pgqJ/qUiDIb70870KAb7hN+wbMlmBqcEDyz9lam6a/D9iaMf8HlUZIuIIhxW1GPCTTvtbh7gzjwNvaepf3U6q6re8DSnMv5J2DCmkGaa3U/DoJaRgsE84V2/mDndqESknri7yZJKv6t+FbkNkkSJwMKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TXdOhpqR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0B0AC4CEF7;
	Mon,  9 Mar 2026 18:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773080561;
	bh=fHyPzZQYI84kpph/uTyLsAf9L3h9GnJHmbSUWm0Lef4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TXdOhpqR3OHjBb+Ea2hIOFV/RsyHMVpvAa+vilekGpLgYAS5vh+GWxnN9q69eqDgG
	 QIYv1CkjDJX9YWBsmLE1MbSdbOMSmclZL52bJ4quzYPp1mIgNxDAXrgLIpWzweTpAi
	 Kcwc0zAs0dDuDQCsnmFBzTlzJiYtRkMhU9sPMtS3vtcSqpWU3GbwaMqkdkNnXTJJwz
	 qTjiFNnNPU7iEMuCE37rYsri3irpkndsIsndFCqSKHlwNxzdjvYvi5UbViSS6loAnw
	 Fvx86nt16Nc0yPelncTI+GxaBrorUtL3xWAirB0SHmxRnwZRGWJQtU1LLffgurFHT6
	 wM5P3fxHw9HQg==
Date: Mon, 9 Mar 2026 18:22:36 +0000
From: Lee Jones <lee@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Steffen Trumtrar <kernel@pengutronix.de>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] leds: lp5860: add enable-gpio
Message-ID: <20260309182236.GY183676@google.com>
References: <20260217-v6-19-topic-ti-lp5860-enable-gpio-v1-0-f5e8edeb5d74@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260217-v6-19-topic-ti-lp5860-enable-gpio-v1-0-f5e8edeb5d74@pengutronix.de>
X-Rspamd-Queue-Id: 55AB423E93C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7161-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pengutronix.de:email]
X-Rspamd-Action: no action

On Tue, 17 Feb 2026, Steffen Trumtrar wrote:

> The LP5860 can have the VIO_EN pin either be connected to VIO power
> supply or a GPIO.
> 
> Add support for the pin to the devicetree binding and the driver.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
> Steffen Trumtrar (2):
>       dt-bindings: leds: lp5860: add enable-gpio
>       leds: rgb: lp5860: add enable-gpio
> 
>  Documentation/devicetree/bindings/leds/leds-lp5860.yaml |  7 +++++++
>  drivers/leds/rgb/leds-lp5860-core.c                     | 10 ++++++++++
>  include/linux/platform_data/leds-lp5860.h               |  1 +
>  3 files changed, 18 insertions(+)
> ---
> base-commit: 51455910fda1e5e315f604b7633f413116d4fa1f
> change-id: 20260217-v6-19-topic-ti-lp5860-enable-gpio-83c0652d34ad
> prerequisite-message-id: <20260217-v6-14-topic-ti-lp5860-v6-1-54a766d8b602@pengutronix.de>
> prerequisite-patch-id: 1d4485e2a6544fae1103cf9475f317773f206dc5

As you're probably already aware, the set does not apply.

-- 
Lee Jones [李琼斯]

