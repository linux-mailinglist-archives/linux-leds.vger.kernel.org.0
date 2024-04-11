Return-Path: <linux-leds+bounces-1456-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A47B58A171A
	for <lists+linux-leds@lfdr.de>; Thu, 11 Apr 2024 16:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 593CB1F2134E
	for <lists+linux-leds@lfdr.de>; Thu, 11 Apr 2024 14:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C14149C7F;
	Thu, 11 Apr 2024 14:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDMO1eEw"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE6E14D70F
	for <linux-leds@vger.kernel.org>; Thu, 11 Apr 2024 14:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712845593; cv=none; b=JrhHH58tZhSwHFRXOnoGXbFGhCnEvHkPx6/Gt6+hhOeUjvnbe2jmQMjuJzhG7afV+ATTeMjXW7bGNr0ao2Qtqw95ASPloYJN1undugyGXm+dT/YGSgt1Oo2ZgQJ4JbQaQz5r1HGwa5Uz1qexX+dKGT5brZ4E3i1aBt2U8BRva4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712845593; c=relaxed/simple;
	bh=QliNjNihClqNOB+8vSd4x8EPwDtCJK7mLitQtGmRGcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hjH+HkEjDRWzSnKJTVyX/MEhiF4KrdOe+QEe8JsfdAJuthMwDQ1Iy48cWS6t2zSe6KUU6MhS3lB52JvUWXSYUzK1qzRT63rkK912dXXCJA1lPFYAsb1VYOPeY24bJ1yTZ4qUC+AzVwDsRzfQncqy/aeyzJH37sf2cZEX552+gCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDMO1eEw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32AAC113CD;
	Thu, 11 Apr 2024 14:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712845591;
	bh=QliNjNihClqNOB+8vSd4x8EPwDtCJK7mLitQtGmRGcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aDMO1eEwKMByoIKkOKR1sTGy2tbAq4/WPIfokS4J7ibCAZd9L1FYKJ8Xo6LS+G4Zu
	 Mu+D4yoResW8MwtGVsZxQNrcfZg+5EGZAjZKCy7nhtV6We2e3oQsYBbq8lnKFH8Hrs
	 BpQ0wKyHlPEZh4YtZ/HhcUqs26KSqtscFLYN1rTidJ/17cbBTT790F/s8SBFuDWeaX
	 77UfUA/QJOBmG7cIkUnqz4lI+L9EfA6SfD+7EGHozYWChhAd4CG3XLhjVfdCbX97bs
	 5A51NiHunPW9L8kS6Lo4+9GEDCOIS2nTmkxFINuP3Rf/kNi+oua1kAlYCZrltnVQGV
	 GaNkKCWovkPZA==
Date: Thu, 11 Apr 2024 15:26:28 +0100
From: Lee Jones <lee@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH] leds: core: Omit set_brightness error message for a LED
 supporting hw trigger only
Message-ID: <20240411142628.GB2399047@google.com>
References: <44177e37-9512-4044-8991-bb23b184bf37@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44177e37-9512-4044-8991-bb23b184bf37@gmail.com>

On Fri, 05 Apr 2024, Heiner Kallweit wrote:

> If both set_brightness functions return -ENOTSUPP, then the LED doesn't
> support setting a fixed brightness value, and the error message isn't
> helpful. This can be the case e.g. for LEDs supporting a specific hw
> trigger only.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/leds/led-core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index 89c9806cc..9485f799f 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -127,7 +127,8 @@ static void set_brightness_delayed_set_brightness(struct led_classdev *led_cdev,
>  	ret = __led_set_brightness(led_cdev, value);
>  	if (ret == -ENOTSUPP)
>  		ret = __led_set_brightness_blocking(led_cdev, value);
> -	if (ret < 0 &&
> +	/* Don't emit error message if LED supports a hw trigger like netdev only */
> +	if (ret < 0 && ret != -ENOTSUPP &&
>  	    /* LED HW might have been unplugged, therefore don't warn */
>  	    !(ret == -ENODEV && (led_cdev->flags & LED_UNREGISTERING) &&
>  	    (led_cdev->flags & LED_HW_PLUGGABLE)))

This function is already pretty messy.

How about something like:

static void set_brightness_delayed_set_brightness(struct led_classdev *led_cdev,
                                                  unsigned int value)
{
        int ret;

        ret = __led_set_brightness(led_cdev, value);
        if (ret == -ENOTSUPP) {
                ret = __led_set_brightness_blocking(led_cdev, value);
                if (ret == -ENOTSUPP)
                        /* No back-end support to set a fixed brightness value */
                        return;
        }

        if (ret == -ENODEV && (led_cdev->flags & LED_UNREGISTERING))
                /* LED HW might have been unplugged, therefore don't warn */
                return;

        if (ret < 0 && led_cdev->flags & LED_HW_PLUGGABLE)
                dev_err(led_cdev->dev, "Setting an LED's brightness failed (%d)\n", ret);
 }

-- 
Lee Jones [李琼斯]

