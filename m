Return-Path: <linux-leds+bounces-122-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E3F7F6542
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 18:22:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0D141C20F77
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 17:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489F0405C3;
	Thu, 23 Nov 2023 17:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yJCoIenX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBB53FE28;
	Thu, 23 Nov 2023 17:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459C1C433CA;
	Thu, 23 Nov 2023 17:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700760161;
	bh=szWvQ2xaG1q7ZyMfdMxvBZfMaG124AsSH+NxXcXWP/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yJCoIenXapRryyBsrj7fHwYAWpve/XSh6zQAf5HyOB1XR7sqqlrA6eU+aW0x/ZwjK
	 9UHpSoQTTnhcZCeIS/YYi5YKHyv/6o1LzL7vmUzRcwRg23nZvD8+V+iZNR8BnmL/34
	 kdFqX6LRECw7of24oaiOZLRkh/YsJWb2lROOoNP0=
Date: Thu, 23 Nov 2023 14:06:28 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Florian Eckert <fe@dev.tdt.de>
Cc: Eckert.Florian@googlemail.com, jirislaby@kernel.org, pavel@ucw.cz,
	lee@kernel.org, kabel@kernel.org, u.kleine-koenig@pengutronix.de,
	m.brock@vanmierlo.com, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [Patch v8 2/6] leds: ledtrig-tty: free allocated ttyname buffer
 on deactivate
Message-ID: <2023112356-amount-undertook-cdb2@gregkh>
References: <20231109085038.371977-1-fe@dev.tdt.de>
 <20231109085038.371977-3-fe@dev.tdt.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231109085038.371977-3-fe@dev.tdt.de>

On Thu, Nov 09, 2023 at 09:50:34AM +0100, Florian Eckert wrote:
> The ttyname buffer for the ledtrig_tty_data struct is allocated in the
> sysfs ttyname_store() function. This buffer must be released on trigger
> deactivation. This was missing and is thus a memory leak.
> 
> While we are at it, the tty handler in the ledtrig_tty_data struct should
> also be returned in case of the trigger deactivation call.
> 
> Fixes: fd4a641ac88f ("leds: trigger: implement a tty trigger")
> Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Florian Eckert <fe@dev.tdt.de>
> ---
>  drivers/leds/trigger/ledtrig-tty.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/leds/trigger/ledtrig-tty.c b/drivers/leds/trigger/ledtrig-tty.c
> index 8ae0d2d284af..3e69a7bde928 100644
> --- a/drivers/leds/trigger/ledtrig-tty.c
> +++ b/drivers/leds/trigger/ledtrig-tty.c
> @@ -168,6 +168,10 @@ static void ledtrig_tty_deactivate(struct led_classdev *led_cdev)
>  
>  	cancel_delayed_work_sync(&trigger_data->dwork);
>  
> +	kfree(trigger_data->ttyname);
> +	tty_kref_put(trigger_data->tty);
> +	trigger_data->tty = NULL;
> +

This should be a stand-alone patch with a proper cc: stable tag added as
well so that it can be accepted now, as it is independent of this new
feature you are adding.

thanks,

greg k-h

