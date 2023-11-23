Return-Path: <linux-leds+bounces-124-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4577F6549
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 18:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A37D7B20FA7
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 17:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBF73FE5B;
	Thu, 23 Nov 2023 17:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ll49BDTS"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9AD3FE28;
	Thu, 23 Nov 2023 17:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CBBEC433CB;
	Thu, 23 Nov 2023 17:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700760167;
	bh=4297UUYd2y99yNrz1B47l1NxhhE7aZJo2hPif4wzTU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ll49BDTSDAAA9FwoEwJc+oYmPkeIkJV2lLEDdIBkGrzG5LzK3UDffB/1Q2E/qIY3E
	 GHLLx/lDh91ODzy2fgWmPIFhaJnGL67ypjsTCBZmjaMryAKu86NqwNohY/z809XRXo
	 55r8G53SCFfGD+sdt5DBsUn73PS7Jb5kYX7qW5IY=
Date: Thu, 23 Nov 2023 14:10:44 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Florian Eckert <fe@dev.tdt.de>
Cc: Eckert.Florian@googlemail.com, jirislaby@kernel.org, pavel@ucw.cz,
	lee@kernel.org, kabel@kernel.org, u.kleine-koenig@pengutronix.de,
	m.brock@vanmierlo.com, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [Patch v8 4/6] leds: ledtrig-tty: replace mutex with completion
Message-ID: <2023112310-salaried-shower-bc76@gregkh>
References: <20231109085038.371977-1-fe@dev.tdt.de>
 <20231109085038.371977-5-fe@dev.tdt.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109085038.371977-5-fe@dev.tdt.de>

On Thu, Nov 09, 2023 at 09:50:36AM +0100, Florian Eckert wrote:
> With this commit, the mutex handling is replaced by the completion
> handling. When handling mutex, it must always be ensured that the held
> mutex is also released again. This is more error-prone should the number
> of code paths increase.
> 
> This is a preparatory commit to make the trigger more configurable via
> additional sysfs parameters. With this change, the worker always runs and
> is no longer stopped if no ttyname is set.
> 
> Signed-off-by: Florian Eckert <fe@dev.tdt.de>
> ---
>  drivers/leds/trigger/ledtrig-tty.c | 60 +++++++++++++++---------------
>  1 file changed, 31 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-tty.c b/drivers/leds/trigger/ledtrig-tty.c
> index 86595add72cd..3badf74fa420 100644
> --- a/drivers/leds/trigger/ledtrig-tty.c
> +++ b/drivers/leds/trigger/ledtrig-tty.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
> +#include <linux/completion.h>
>  #include <linux/delay.h>
>  #include <linux/leds.h>
>  #include <linux/module.h>
> @@ -12,15 +13,24 @@
>  struct ledtrig_tty_data {
>  	struct led_classdev *led_cdev;
>  	struct delayed_work dwork;
> -	struct mutex mutex;
> +	struct completion sysfs;
>  	const char *ttyname;
>  	struct tty_struct *tty;
>  	int rx, tx;
>  };
>  
> -static void ledtrig_tty_restart(struct ledtrig_tty_data *trigger_data)
> +static int ledtrig_tty_waitforcompletion(struct device *dev)

Nit, you might want to add a few more '_' characters, right:
	ledtrig_tty_wait_for_completion()
to match up with the call to wait_for_completion_timeout() it makes.

>  {
> -	schedule_delayed_work(&trigger_data->dwork, 0);
> +	struct ledtrig_tty_data *trigger_data = led_trigger_get_drvdata(dev);
> +	int ret;
> +
> +	ret = wait_for_completion_timeout(&trigger_data->sysfs,
> +					  msecs_to_jiffies(LEDTRIG_TTY_INTERVAL * 20));
> +

Nit, no blank line needed here, if you happen to redo this patch.

thanks,

greg "naming is hard" k-h

