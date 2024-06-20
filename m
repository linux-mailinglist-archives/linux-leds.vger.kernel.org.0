Return-Path: <linux-leds+bounces-2039-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC54390FFF8
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 11:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56B15B2346C
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 09:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C29176221;
	Thu, 20 Jun 2024 09:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KlJPJEH/"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC4F558A5;
	Thu, 20 Jun 2024 09:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718874576; cv=none; b=n/cnXJoIF1krJv3wscHF0sdUKhTx3W/KZEwz/gWefkXElBTX2xeJPE2gv9LHYYHREELkrEQrSV/RC/nrh7+oCxef/qYMUMUMNQ3mnRl/8rKOlP7jvEkUAcMWWp7AaKOWK3aCIEZBeXC42eMO5hvOvVa6GnwFKmfii72lhBbPbxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718874576; c=relaxed/simple;
	bh=66gyrIipeI+kZfnEWslEEqI7z7Ksf4eHolGiHrxklRY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nO02OdFtjQazEenLVj7CWbXqzaLrbEeBiIyxsTGYfIYhEH5In/Q49BR1j4NcrvoUxmRzjvpi2LuQTaXA8pcmF1kja+IyME6x6rM9GwSwkaVAtE67s3ydGOkKON5QzsAtkridh84A/Q6BJWjG22pilkKAIn322JcM8YkOmY84vlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KlJPJEH/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E7CC32781;
	Thu, 20 Jun 2024 09:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718874576;
	bh=66gyrIipeI+kZfnEWslEEqI7z7Ksf4eHolGiHrxklRY=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=KlJPJEH/7stjURIho0o5YzOzs2+3apAgDeGOPj31iDlHnD4E8gNXxOfJMVojCBuhu
	 Hrdeqp0lBPA/+a9gZU5tfJoQ+3hT4Ll4A4qrRCU+zoPVEe4mR0/tIltxX0gfwO7iW7
	 JujiJtppl0ic8KUv2BFt1D/7QALckqDVTuGWKCrPyt2ScFOA8zyOjzT3MxRdZgiiOU
	 VtRAiOqwYuS2cYWj4PRnrGM50O/DHd61nAoefu8N3dJUx9fcgZ1DRB6OiXcgw4bnGx
	 yHgKO09L5FxNbmveY3KPVlrqzSf5JbVa+07LRI8vnyxK6IlJCrZ5dn6gibRS93ei1n
	 iaaedVUCvvDPg==
Date: Thu, 20 Jun 2024 10:09:32 +0100
From: Lee Jones <lee@kernel.org>
To: linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 1/1] leds: core: Omit set_brightness error message for a
 LED supporting hw trigger only
Message-ID: <20240620090932.GD3029315@google.com>
References: <20240613075712.2479669-1-lee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240613075712.2479669-1-lee@kernel.org>

On Thu, 13 Jun 2024, Lee Jones wrote:

> If both set_brightness functions return -ENOTSUPP, then the LED doesn't
> support setting a fixed brightness value, and the error message isn't
> helpful. This can be the case e.g. for LEDs supporting a specific hw
> trigger only.
> 
> Pinched the subject line and commit message from Heiner:
> Link: https://lore.kernel.org/all/44177e37-9512-4044-8991-bb23b184bf37@gmail.com/
> 
> Reworked the function to provide Heiner's required semantics whilst
> simultaneously increasing readability and flow.
> 
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: linux-leds@vger.kernel.org
> Suggested-by: Heiner Kallweit <hkallweit1@gmail.com>

Heiner, you good with this solution?

A Tested-by or Reviewed-by would be good if you have the time.

> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/leds/led-core.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index ef7d1c6767ca..3b4db39f2326 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -123,15 +123,22 @@ static void led_timer_function(struct timer_list *t)
>  static void set_brightness_delayed_set_brightness(struct led_classdev *led_cdev,
>  						  unsigned int value)
>  {
> -	int ret = 0;
> +	int ret;
>  
>  	ret = __led_set_brightness(led_cdev, value);
> -	if (ret == -ENOTSUPP)
> +	if (ret == -ENOTSUPP) {
>  		ret = __led_set_brightness_blocking(led_cdev, value);
> -	if (ret < 0 &&
> -	    /* LED HW might have been unplugged, therefore don't warn */
> -	    !(ret == -ENODEV && (led_cdev->flags & LED_UNREGISTERING) &&
> -	    (led_cdev->flags & LED_HW_PLUGGABLE)))
> +		if (ret == -ENOTSUPP)
> +			/* No back-end support to set a fixed brightness value */
> +			return;
> +	}
> +
> +	/* LED HW might have been unplugged, therefore don't warn */
> +	if (ret == -ENODEV && led_cdev->flags & LED_UNREGISTERING &&
> +	    led_cdev->flags & LED_HW_PLUGGABLE)
> +		return;
> +
> +	if (ret < 0)
>  		dev_err(led_cdev->dev,
>  			"Setting an LED's brightness failed (%d)\n", ret);
>  }
> -- 
> 2.45.2.505.gda0bf45e8d-goog
> 

-- 
Lee Jones [李琼斯]

