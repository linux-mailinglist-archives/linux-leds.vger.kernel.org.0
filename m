Return-Path: <linux-leds+bounces-7817-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8F+pKdg66mnYxAIAu9opvQ
	(envelope-from <linux-leds+bounces-7817-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2026 17:29:28 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBBA4545F6
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2026 17:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 921A1303CC32
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2026 15:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 715FC33D4E2;
	Thu, 23 Apr 2026 15:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D10g+2Ak"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E4D1BBBE5;
	Thu, 23 Apr 2026 15:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776958020; cv=none; b=Loat87DjH56ZbAAma/hO7aWhA2dpigAMB9QQuKoxW0AP0X+ehCO47TnOp2btsHERF+Y0GQFhP+onBNS0uDI1ayjIxPX/7mv37NGL83ntt3OyL7nbRkqx8ZHMDsjuWVhg8CYtP9YPZx9xu56pqwO3mAWr4XgerT30DvJJl+ezZMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776958020; c=relaxed/simple;
	bh=rZwPd8cFxLllHoQN41ZESM/RH4oP1GdssZqfN7zr0FY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O2mvLQGfBrLJr0f3o1iAwNdfyHXSWSpbXH3skbfwmJKmwi7+qLA2O+1703EoYpRqi9ZRVDNQBjrCviTJ6R6oLNrWqZrZMqq6nrrEQcvwUJ1/qcqEU4A1NPtNPSwUNBEvgan0Z31N8DZAsGOZxUxB0ldOZ0eYRhOqsTDWRlIW9+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D10g+2Ak; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38421C2BCAF;
	Thu, 23 Apr 2026 15:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776958019;
	bh=rZwPd8cFxLllHoQN41ZESM/RH4oP1GdssZqfN7zr0FY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D10g+2Ak2125VWHKGYBaBN0/Yfsw5P0ktqQrS8Fgo1XYsoE8L/GBD5YKeoHxfzEc+
	 IKjkFLIqAPS3dYuLMjTUn09dlyWrI+CvAl4Ggg0VWACSY7/lvv3ZG3sDDVM36mNIbJ
	 sGZ9dJGFiLj/ECHIVEZSpgU8662R0Q8bJHp6VRlPsI5t0cO3vE6CI3Gg7EHecU4KxY
	 bWvOjtMl5hTf2RTKfYzjEuOFoxqE9BRPybjbNEPsvvRkBixUjZ95zWX4pZm5Is5LpZ
	 6jzmuH1QnRRChCttetJ4ZR3STff1U+y03oPtUauJsNS+rN1dzMI11frL7W4XzZoqbM
	 aAmlDPe+3yxzg==
Date: Thu, 23 Apr 2026 16:26:55 +0100
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn?= Persson <Bjorn@xn--rombobjrn-67a.se>
Cc: Pavel Machek <pavel@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: leds: uleds: Make the documentation match the code.
Message-ID: <20260423152655.GF170138@google.com>
References: <20260402220811.4804DD8F722@tag.xn--rombobjrn-67a.se>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260402220811.4804DD8F722@tag.xn--rombobjrn-67a.se>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7817-lists,linux-leds=lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rombobj=?UTF-8?Q?=C3=B6?=rn.se:email]
X-Rspamd-Queue-Id: EEBBA4545F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 02 Apr 2026, Björn Persson wrote:

> From: Björn Persson <Bjorn@Rombobjörn.se>
> 
> · max_brightness must be set. Leaving it uninitialized or just omitting it
>   won't work.

What are these points?  How do you even type one of those?

Anyway, proper sentences / paragraphs is better.

> · The maximum brightness is not 255 but the value given to max_brightness.
> 
> · Brightness values must be read as ints, not bytes.
> 
> · The ints are signed, so the word "unsigned" is misleading.
> 
> Signed-off-by: Björn Persson <Bjorn@Rombobjörn.se>
> ---
>  Documentation/leds/uleds.rst | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/leds/uleds.rst b/Documentation/leds/uleds.rst
> index 83221098009c..9875a0fa4185 100644
> --- a/Documentation/leds/uleds.rst
> +++ b/Documentation/leds/uleds.rst
> @@ -17,16 +17,20 @@ structure to it (found in kernel public header file linux/uleds.h)::
>  
>      struct uleds_user_dev {
>  	char name[LED_MAX_NAME_SIZE];
> +	int max_brightness;
>      };
>  
> -A new LED class device will be created with the name given. The name can be
> -any valid sysfs device node name, but consider using the LED class naming
> -convention of "devicename:color:function".
> +A new LED class device will be created with the given name and maximum

Did you mean to revers "name given"?  A "given name" usually means
something else.

> +brightness. The name can be any valid sysfs device node name, but consider
> +using the LED class naming convention of "devicename:color:function".
>  
> -The current brightness is found by reading a single byte from the character
> -device. Values are unsigned: 0 to 255. Reading will block until the brightness
> -changes. The device node can also be polled to notify when the brightness value
> -changes.
> +Although max_brightness is a signed int, only positive values are valid:
> +1 to INT_MAX.

What about 0?

> +The current brightness is found by reading a whole int from the character

Try not to shorten names in documentation "integer".

Why do we need to specify "whole"?

> +device. The possible values are 0 to max_brightness. Reading will block until
> +the brightness changes. The device node can also be polled to notify when the
> +brightness value changes.
>  
>  The LED class device will be removed when the open file handle to /dev/uleds
>  is closed.
> -- 
> 2.53.0
> 

-- 
Lee Jones [李琼斯]

