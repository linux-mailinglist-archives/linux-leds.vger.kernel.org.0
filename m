Return-Path: <linux-leds+bounces-6646-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A78A2D21483
	for <lists+linux-leds@lfdr.de>; Wed, 14 Jan 2026 22:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1B7A4300461D
	for <lists+linux-leds@lfdr.de>; Wed, 14 Jan 2026 21:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A055C35E55E;
	Wed, 14 Jan 2026 21:11:23 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230C035A954;
	Wed, 14 Jan 2026 21:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768425083; cv=none; b=jev+GaCPBIMufeF48aYbmzIblj8wGl5BVevAT3mAHwagluRWTNyd5UCHctZvtWCEoSsOfcZcYK2zGaPwIzsRT/pSxrRry6hIW47vGaqy663RvN9JeB5idn6V/nu1yVXPWM8eLhXRmXkshL2Gv8MMvH1OcKJjYd59tNo64q8q6wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768425083; c=relaxed/simple;
	bh=22nOV1jKDJuoorL0g1S34FxtynIvIEfZcsZed9CviIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOLcB9cHZ2npB3PCxW1LQt/Dj1uv8fFTvAh3UnQMidZ/38J2T4LdGJM+BfotW8xYHZqAU7QPqtbm8lR/67438KExq1K2lznhMRh32QeuNTTr2jXfTGiBvabbbtWwvDnt9+B3A1UnnM2NLVznFsarp8xMfxyguIxW0JUu1HiO2+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4drzLQ4g7xz9smc;
	Wed, 14 Jan 2026 22:11:10 +0100 (CET)
Date: Wed, 14 Jan 2026 22:11:07 +0100
From: Lukas Timmermann <linux@timmermann.space>
To: Lee Jones <lee@kernel.org>
Cc: pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 0/2] Support for Osram as3668 LED driver
Message-ID: <aWgFmdqGzLldBptR@archstation>
References: <20251201230601.285641-1-linux@timmermann.space>
 <20260108104130.GC302752@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260108104130.GC302752@google.com>

On Thu, Jan 08, 2026 at 10:41:30AM +0000, Lee Jones wrote:
> On Tue, 02 Dec 2025, Lukas Timmermann wrote:
> 
> Running through checkpatch.pl
> total: 0 errors, 0 warnings, 86 lines checked
> 
> "[PATCH v13 1/2] dt-bindings: leds: Add new as3668 support" has no obvious style problems and is ready for submission.
> ERROR: Macros with complex values should be enclosed in parentheses
> #115: FILE: drivers/leds/leds-as3668.c:35:
> +#define AS3668_CURR_MODE_PACK(mode)	((mode) << 0) | \
> +					((mode) << 2) | \
> +					((mode) << 4) | \
> +					((mode) << 6)
> 
> BUT SEE:
> 
>    do {} while (0) advice is over-stated in a few situations:
> 
>    The more obvious case is macros, like MODULE_PARM_DESC, invoked at
>    file-scope, where C disallows code (it must be in functions).  See
>    $exceptions if you have one to add by name.
> 
>    More troublesome is declarative macros used at top of new scope,
>    like DECLARE_PER_CPU.  These might just compile with a do-while-0
>    wrapper, but would be incorrect.  Most of these are handled by
>    detecting struct,union,etc declaration primitives in $exceptions.
> 
>    Theres also macros called inside an if (block), which "return" an
>    expression.  These cannot do-while, and need a ({}) wrapper.
> 
>    Enjoy this qualification while we work to improve our heuristics.
> 
> WARNING: please, no spaces at the start of a line
> #135: FILE: drivers/leds/leds-as3668.c:55:
> +    int ret;$
> 
> WARNING: please, no spaces at the start of a line
> #136: FILE: drivers/leds/leds-as3668.c:56:
> +    u8 channel_modes;$
> 
> WARNING: please, no spaces at the start of a line
> #138: FILE: drivers/leds/leds-as3668.c:58:
> +    ret = i2c_smbus_read_byte_data(led->chip->client, AS3668_CURR_MODE_REG);$
> 
> WARNING: please, no spaces at the start of a line
> #139: FILE: drivers/leds/leds-as3668.c:59:
> +    if (ret < 0) {$
> 
> ERROR: code indent should use tabs where possible
> #140: FILE: drivers/leds/leds-as3668.c:60:
> +        dev_err(led->cdev.dev, "failed to read channel modes\n");$
> 
> WARNING: please, no spaces at the start of a line
> #140: FILE: drivers/leds/leds-as3668.c:60:
> +        dev_err(led->cdev.dev, "failed to read channel modes\n");$
> 
> ERROR: code indent should use tabs where possible
> #141: FILE: drivers/leds/leds-as3668.c:61:
> +        return ret;$
> 
> WARNING: please, no spaces at the start of a line
> #141: FILE: drivers/leds/leds-as3668.c:61:
> +        return ret;$
> 
> WARNING: please, no spaces at the start of a line
> #142: FILE: drivers/leds/leds-as3668.c:62:
> +    }$
> 
> WARNING: please, no spaces at the start of a line
> #143: FILE: drivers/leds/leds-as3668.c:63:
> +    channel_modes = (u8)ret;$
> 
> WARNING: please, no spaces at the start of a line
> #145: FILE: drivers/leds/leds-as3668.c:65:
> +    channel_modes &= ~led->mode_mask;$
> 
> WARNING: please, no spaces at the start of a line
> #146: FILE: drivers/leds/leds-as3668.c:66:
> +    channel_modes |= led->mode_mask & (AS3668_CURR_MODE_PACK(mode));$
> 
> WARNING: please, no spaces at the start of a line
> #148: FILE: drivers/leds/leds-as3668.c:68:
> +    return i2c_smbus_write_byte_data(led->chip->client, AS3668_CURR_MODE_REG, channel_modes);$
> 
> WARNING: line length of 104 exceeds 100 columns
> #247: FILE: drivers/leds/leds-as3668.c:167:
> +		return dev_err_probe(&client->dev, -EIO, "failed to set zero initial current levels\n");
> 
> WARNING: DT compatible string "ams,as3668" appears un-documented -- check ./Documentation/devicetree/bindings/
> #264: FILE: drivers/leds/leds-as3668.c:184:
> +	{ .compatible = "ams,as3668" },
> 
> total: 3 errors, 13 warnings, 235 lines checked
> 
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or --fix-inplace.
> 
> NOTE: Whitespace errors detected.
>       You may wish to use scripts/cleanpatch or scripts/cleanfile
> 
> "[PATCH v13 2/2] leds: as3668: Driver for the ams Osram 4-channel" has style problems, please review.
> 
> NOTE: If any of the errors are false positives, please report
>       them to the maintainer, see CHECKPATCH in MAINTAINERS.
> 
> -- 
> Lee Jones [李琼斯]
> 
Acknowledged. That shouldn't have happened. I apologize.
I had no time to fix this issue since. I will try to make that happen in
the next days.

Best regards,
Lukas Timmermann

