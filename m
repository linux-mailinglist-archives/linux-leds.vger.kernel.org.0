Return-Path: <linux-leds+bounces-3922-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBC2A30D08
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 14:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E20B2160995
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 13:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA8924C676;
	Tue, 11 Feb 2025 13:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4Ce1ukP"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A6624C66D;
	Tue, 11 Feb 2025 13:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280845; cv=none; b=QJEd8lV6MkumjaE2yAaOcOUj0JABAzGOF2xMXMrJMjxNNIKry3/a9CNbFEWFqiKk1EDiRe4v3JsQTOJ03jgclGOy6SDSvj/KU/RbDyd57E0L/cfnvP28OjJGVHRsZFyXpbCd4IL65JCYzH1FounOJf25ozofDFW/G2A7lJWn0D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280845; c=relaxed/simple;
	bh=djD99HPyZZd9QRERrXAoAsVzHxEs9BeU4e59sUigE28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pf9GCTnCE/bQkuhI03KBjn0ysYZEnZKtFTNO62dITpumfbUO9frQipox0srofwvZAWUs4iP3hCWrjcNRSNivpM6xlnZkXQK3bMAhlepIH+RYL7mYc9iHVxZ5bSjbzN4cdAVZkbTZi8hzNVpPWeWHGYhSNG5CWsrr/HuA+rKvK4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4Ce1ukP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DBFDC4AF12;
	Tue, 11 Feb 2025 13:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739280844;
	bh=djD99HPyZZd9QRERrXAoAsVzHxEs9BeU4e59sUigE28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E4Ce1ukPxSWDbbnPVotdFjJKt4O64Rffn6857iPgZ4V0BNLlYaNGHp7wOujUbtvne
	 hPVQPJfQvcQzUg5hYGcRu+ktsa5jfT4u0upXdAMdw/cPpV3hADiWh3wVM7X3HvAVeg
	 DK+zqI7tFkqfb7PlYq9z8cTbbBmQj1G9DaU+GpVaemt0oNSIGUpX3trcEI4U+iODpi
	 0jZpNIPHaQdpGv2gzthKbo+2m0ddZlkeq6KgkZe5+b6lr+D0qUGnhbIljuVbHYqGTZ
	 jhQKmkwQqjUOWpkRDTFuuxvO9uuOhFMsYAvN69+V+Zq/NiAB6V1nOSxGZaIY+lJ7Fw
	 hzAQKC2fvKs5Q==
Date: Tue, 11 Feb 2025 13:34:00 +0000
From: Lee Jones <lee@kernel.org>
To: Manuel Fombuena <fombuena@outlook.com>
Cc: pavel@ucw.cz, corbet@lwn.net, linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 3/5] leds: leds-st1202: spacing and proofreading
 editing
Message-ID: <20250211133400.GP1868108@google.com>
References: <CWLP123MB5473933B9B97137828ACC6A6C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
 <CWLP123MB5473057725D7E085EF6091C2C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CWLP123MB5473057725D7E085EF6091C2C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>

On Sat, 01 Feb 2025, Manuel Fombuena wrote:

> Minor edits regarding use of spacing and proofreading.
> 
> Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
> ---
>  drivers/leds/leds-st1202.c | 48 +++++++++++++++++++-------------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index 927874f20839..cb4797ea8f3a 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
> @@ -16,27 +16,27 @@
>  #include <linux/slab.h>
>  #include <linux/string.h>
>  
> -#define ST1202_CHAN_DISABLE_ALL            0x00
> -#define ST1202_CHAN_ENABLE_HIGH            0x03
> -#define ST1202_CHAN_ENABLE_LOW             0x02
> -#define ST1202_CONFIG_REG                  0x04
> +#define ST1202_CHAN_DISABLE_ALL				0x00
> +#define ST1202_CHAN_ENABLE_HIGH				0x03
> +#define ST1202_CHAN_ENABLE_LOW				0x02
> +#define ST1202_CONFIG_REG					0x04
>  /* PATS: Pattern sequence feature enable */
> -#define ST1202_CONFIG_REG_PATS             BIT(7)
> +#define ST1202_CONFIG_REG_PATS				BIT(7)
>  /* PATSR: Pattern sequence runs (self-clear when sequence is finished) */
> -#define ST1202_CONFIG_REG_PATSR            BIT(6)
> -#define ST1202_CONFIG_REG_SHFT             BIT(3)
> -#define ST1202_DEV_ENABLE                  0x01
> -#define ST1202_DEV_ENABLE_ON               BIT(0)
> -#define ST1202_DEV_ENABLE_RESET            BIT(7)
> -#define ST1202_DEVICE_ID                   0x00
> -#define ST1202_ILED_REG0                   0x09
> -#define ST1202_MAX_LEDS                    12
> -#define ST1202_MAX_PATTERNS                8
> -#define ST1202_MILLIS_PATTERN_DUR_MAX      5660
> -#define ST1202_MILLIS_PATTERN_DUR_MIN      22
> -#define ST1202_PATTERN_DUR                 0x16
> -#define ST1202_PATTERN_PWM                 0x1E
> -#define ST1202_PATTERN_REP                 0x15
> +#define ST1202_CONFIG_REG_PATSR				BIT(6)
> +#define ST1202_CONFIG_REG_SHFT				BIT(3)
> +#define ST1202_DEV_ENABLE					0x01
> +#define ST1202_DEV_ENABLE_ON				BIT(0)
> +#define ST1202_DEV_ENABLE_RESET				BIT(7)
> +#define ST1202_DEVICE_ID					0x00
> +#define ST1202_ILED_REG0					0x09
> +#define ST1202_MAX_LEDS						12
> +#define ST1202_MAX_PATTERNS					8
> +#define ST1202_MILLIS_PATTERN_DUR_MAX		5660
> +#define ST1202_MILLIS_PATTERN_DUR_MIN		22
> +#define ST1202_PATTERN_DUR					0x16
> +#define ST1202_PATTERN_PWM					0x1E
> +#define ST1202_PATTERN_REP					0x15

Why are you making this change?

The spacings went from being okay to too large.

>  struct st1202_led {
>  	struct fwnode_handle *fwnode;
> @@ -99,9 +99,9 @@ static int st1202_pwm_pattern_write(struct st1202_chip *chip, int led_num,
>  	value_h = (u8)(value >> 8);
>  
>  	/*
> -	 *  Datasheet: Register address low = 1Eh + 2*(xh) + 18h*(yh),
> -	 *  where x is the channel number (led number) in hexadecimal (x = 00h .. 0Bh)
> -	 *  and y is the pattern number in hexadecimal (y = 00h .. 07h)
> +	 * Datasheet: Register address low = 1Eh + 2*(xh) + 18h*(yh),
> +	 * where x is the channel number (led number) in hexadecimal (x = 00h .. 0Bh)
> +	 * and y is the pattern number in hexadecimal (y = 00h .. 07h)
>  	 */
>  	ret = st1202_write_reg(chip, (ST1202_PATTERN_PWM + (led_num * 2) + 0x18 * pattern),
>  				value_l);
> @@ -288,8 +288,8 @@ static int st1202_setup(struct st1202_chip *chip)
>  	guard(mutex)(&chip->lock);
>  
>  	/*
> -	 * Once the supply voltage is applied, the LED1202 executes some internal checks,
> -	 * afterwords it stops the oscillator and puts the internal LDO in quiescent mode.
> +	 * Once the supply voltage is applied, the LED1202 executes some internal checks.
> +	 * Afterwards, it stops the oscillator and puts the internal LDO in quiescent mode.
>  	 * To start the device, EN bit must be set inside the “Device Enable” register at
>  	 * address 01h. As soon as EN is set, the LED1202 loads the adjustment parameters
>  	 * from the internal non-volatile memory and performs an auto-calibration procedure
> -- 
> 2.48.1
> 

-- 
Lee Jones [李琼斯]

