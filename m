Return-Path: <linux-leds+bounces-8009-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yO11GWCs+mnFRQMAu9opvQ
	(envelope-from <linux-leds+bounces-8009-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 06 May 2026 04:50:08 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A41304D5C1C
	for <lists+linux-leds@lfdr.de>; Wed, 06 May 2026 04:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADE4030131E8
	for <lists+linux-leds@lfdr.de>; Wed,  6 May 2026 02:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53ED253B73;
	Wed,  6 May 2026 02:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFSVwFmu"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E9D72627;
	Wed,  6 May 2026 02:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778035804; cv=none; b=AxLfiGiVK1WOpL4nd0HtJ9Vk+AQqDF68tZHQXNJWPka0GMZ0BP8u8mwc/2y9aCDlYxvRi5D4tp/anVutu5aZ2Q2dy1VGqGBKLMQXPpTunq1V9+wAdXw6aDj+Kd5FEXIOBfdvcF2hrJCpggt95PgG8c0e4hLV6RahKmVl0//oJ2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778035804; c=relaxed/simple;
	bh=9Zp6weps/5i0bic4zLcKMfZvfoo875xrUuifN3/il+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ipqloIpled+jSGMTQOoYjWeb4/UAhExXr9xTXfBMQ0COvBM8gDq2b6sUe3ud/FAnp1qW06nt4VQqCLpcNCS5MqmIFCjds02j1kiXMjGBpWFYYkSRAhhDK8ZrfXBcFJHiHr1l7IKhVSSlKjNBDj0fdDvryG7+XGk9pZ1npk/JFlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFSVwFmu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7820C2BCB4;
	Wed,  6 May 2026 02:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778035804;
	bh=9Zp6weps/5i0bic4zLcKMfZvfoo875xrUuifN3/il+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BFSVwFmuFDrQZSHs0jRdNiiat100r3VhPb+RdSmbPZaeyzbXt3kjIc5204csi3fmv
	 8DmvceFufkt0gK0cBt2vTmWAducwVcTkbB0cfPVXqDS3jvgw2kDv6M1M9OaVAdNz6V
	 YsIti6u8JHQxWeOJBLabNU67GtpsDY0kIoLnxiQyXT68PfBn1uQcKjV32oTtDcrW/N
	 VvWyRoPAhsu3Y5iRq9BcNdXMtAUYnj8rN4QeXp1ONTbwV/JI9R3RXLTW1xaKut/4G/
	 OggD4wSBMLUGEFNFp9NrZiGdyg6oWSKpdQ3IOeKA1s+Aa9S4+XDRJoSLz2MqpsBMLN
	 4fIb61GXo4wZA==
Date: Wed, 6 May 2026 02:49:59 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH] leds: Move MODULE_DEVICE_TABLE next to the table itself
Message-ID: <afqsV2bejC5Mr7_o@google.com>
References: <20260505102846.186219-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505102846.186219-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Rspamd-Queue-Id: A41304D5C1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8009-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Tue, May 05, 2026 at 12:28:45PM +0200, Krzysztof Kozlowski wrote:
> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
> 
> Most of the privers already have this correctly placed, so adjust
              ^ d

> the missing ones.  No functional impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/leds/blink/leds-bcm63138.c | 2 +-
>  drivers/leds/leds-cros_ec.c        | 2 +-

For leds-cros_ec.c,
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

