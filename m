Return-Path: <linux-leds+bounces-123-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ED17F6543
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 18:22:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D3FD281E32
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 17:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C25405C2;
	Thu, 23 Nov 2023 17:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JM/XS73C"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D37405C0;
	Thu, 23 Nov 2023 17:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4322BC433CB;
	Thu, 23 Nov 2023 17:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700760164;
	bh=8Ac62kGm34nPDZ4Gij9LpICrPRR0fXcrEZ8Lpphhg0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JM/XS73CSd8WA8B6a7tOXw57bNzVM7wBYBX8iaXX1M8B+nQ+GfY0drkWC/kepr8i1
	 w65SrflGm9eoI5UAoqNrq2NTG9Pcm9vGCYwtyQIIxVM6L0SzGjeeRuH3g2Az4xuY1k
	 fKF3wRjx6r+lJEqvVodxzpSUHKT1JH9zapCZAPOE=
Date: Thu, 23 Nov 2023 14:08:43 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Florian Eckert <fe@dev.tdt.de>
Cc: Eckert.Florian@googlemail.com, jirislaby@kernel.org, pavel@ucw.cz,
	lee@kernel.org, kabel@kernel.org, u.kleine-koenig@pengutronix.de,
	m.brock@vanmierlo.com, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [Patch v8 3/6] leds: ledtrig-tty: change logging if get icount
 failed
Message-ID: <2023112300-registrar-preface-2225@gregkh>
References: <20231109085038.371977-1-fe@dev.tdt.de>
 <20231109085038.371977-4-fe@dev.tdt.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109085038.371977-4-fe@dev.tdt.de>

On Thu, Nov 09, 2023 at 09:50:35AM +0100, Florian Eckert wrote:
> Change the log level from info to warn, because there is something
> wrong. That is more a warn message than an info message.
> 
> While we are at it, the device prefix is also changed, as this is the
> led device and not the tty device that generates this message.
> 
> Signed-off-by: Florian Eckert <fe@dev.tdt.de>
> ---
>  drivers/leds/trigger/ledtrig-tty.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-tty.c b/drivers/leds/trigger/ledtrig-tty.c
> index 3e69a7bde928..86595add72cd 100644
> --- a/drivers/leds/trigger/ledtrig-tty.c
> +++ b/drivers/leds/trigger/ledtrig-tty.c
> @@ -83,6 +83,7 @@ static void ledtrig_tty_work(struct work_struct *work)
>  	struct ledtrig_tty_data *trigger_data =
>  		container_of(work, struct ledtrig_tty_data, dwork.work);
>  	struct serial_icounter_struct icount;
> +	struct led_classdev *led_cdev = trigger_data->led_cdev;
>  	int ret;
>  
>  	mutex_lock(&trigger_data->mutex);
> @@ -117,7 +118,7 @@ static void ledtrig_tty_work(struct work_struct *work)
>  
>  	ret = tty_get_icount(trigger_data->tty, &icount);
>  	if (ret) {
> -		dev_info(trigger_data->tty->dev, "Failed to get icount, stopped polling\n");
> +		dev_warn(led_cdev->dev, "Failed to get icount, stop polling\n");

You changed the device that is reporting the error here.  It's the tty
device that you failed to get the icount for, not the LED device, so you
just confused the user by saying that a LED now can not get tty data :)

>  		mutex_unlock(&trigger_data->mutex);
>  		return;
>  	}
> @@ -126,8 +127,7 @@ static void ledtrig_tty_work(struct work_struct *work)
>  	    icount.tx != trigger_data->tx) {
>  		unsigned long interval = LEDTRIG_TTY_INTERVAL;
>  
> -		led_blink_set_oneshot(trigger_data->led_cdev, &interval,
> -				      &interval, 0);
> +		led_blink_set_oneshot(led_cdev, &interval, &interval, 0);

This is fine, but not needed if you fix up the above change.

thanks,

greg k-h

