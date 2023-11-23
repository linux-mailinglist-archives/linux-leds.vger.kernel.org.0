Return-Path: <linux-leds+bounces-125-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E454A7F654D
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 18:22:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58A93B20F7F
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 17:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8650405C2;
	Thu, 23 Nov 2023 17:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xKS84AFD"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98D63FE28;
	Thu, 23 Nov 2023 17:22:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0638EC433CA;
	Thu, 23 Nov 2023 17:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700760170;
	bh=BuLWdTTGqavMGDf32PtDBpKYe8ub/X4Dej2UOp9+T6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xKS84AFDEhCJ4KLTKAQityJ+XoUfRTWT5Olu/PDIbLlbvWNXl7XK7rNNwVSHWJU2e
	 4yN56r9yNWBD4t6m8bvYdLd9PT4g1QO1PCefnIFfhhVu/Fmu4FJGo8PnD430ItzxM/
	 cxKfwf9MLnDDFeIPY4zgBief1rMCTiv57ZjYQJEk=
Date: Thu, 23 Nov 2023 14:12:46 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Florian Eckert <fe@dev.tdt.de>
Cc: Eckert.Florian@googlemail.com, jirislaby@kernel.org, pavel@ucw.cz,
	lee@kernel.org, kabel@kernel.org, u.kleine-koenig@pengutronix.de,
	m.brock@vanmierlo.com, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [Patch v8 5/6] leds: ledtrig-tty: make rx tx activitate
 configurable
Message-ID: <2023112334-unquote-robust-15b8@gregkh>
References: <20231109085038.371977-1-fe@dev.tdt.de>
 <20231109085038.371977-6-fe@dev.tdt.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109085038.371977-6-fe@dev.tdt.de>

On Thu, Nov 09, 2023 at 09:50:37AM +0100, Florian Eckert wrote:
> Until now, the LED blinks when data is sent via the tty (rx/tx).
> This is not configurable.
> 
> This change adds the possibility to make the indication for the direction
> of the transmitted data independently controllable via the new rx and
> tx sysfs entries.
> 
> - rx:
>   Signal reception (rx) of data on the named tty device.
>   If set to 0, the LED will not blink on reception.
>   If set to 1 (default), the LED will blink on reception.
> 
> - tx:
>   Signal transmission (tx) of data on the named tty device.
>   If set to 0, the LED will not blink on transmission.
>   If set to 1 (default), the LED will blink on transmission.
> 
> This new sysfs entry are on by default. Thus the trigger behaves as
> before this change.
> 
> Signed-off-by: Florian Eckert <fe@dev.tdt.de>
> ---
>  .../ABI/testing/sysfs-class-led-trigger-tty   |  16 +++
>  drivers/leds/trigger/ledtrig-tty.c            | 124 ++++++++++++++++--
>  2 files changed, 130 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-tty b/Documentation/ABI/testing/sysfs-class-led-trigger-tty
> index 2bf6b24e781b..504dece151b8 100644
> --- a/Documentation/ABI/testing/sysfs-class-led-trigger-tty
> +++ b/Documentation/ABI/testing/sysfs-class-led-trigger-tty
> @@ -4,3 +4,19 @@ KernelVersion:	5.10
>  Contact:	linux-leds@vger.kernel.org
>  Description:
>  		Specifies the tty device name of the triggering tty
> +
> +What:		/sys/class/leds/<led>/rx
> +Date:		February 2024
> +KernelVersion:	6.8
> +Description:
> +		Signal reception (rx) of data on the named tty device.
> +		If set to 0, the LED will not blink on reception.
> +		If set to 1 (default), the LED will blink on reception.
> +
> +What:		/sys/class/leds/<led>/tx
> +Date:		February 2024
> +KernelVersion:	6.8
> +Description:
> +		Signal transmission (tx) of data on the named tty device.
> +		If set to 0, the LED will not blink on transmission.
> +		If set to 1 (default), the LED will blink on transmission.
> diff --git a/drivers/leds/trigger/ledtrig-tty.c b/drivers/leds/trigger/ledtrig-tty.c
> index 3badf74fa420..1a40a78bf1ee 100644
> --- a/drivers/leds/trigger/ledtrig-tty.c
> +++ b/drivers/leds/trigger/ledtrig-tty.c
> @@ -17,6 +17,19 @@ struct ledtrig_tty_data {
>  	const char *ttyname;
>  	struct tty_struct *tty;
>  	int rx, tx;
> +	bool mode_rx;
> +	bool mode_tx;
> +};
> +
> +/* Indicates which state the LED should now display */
> +enum led_trigger_tty_state {
> +	TTY_LED_BLINK,
> +	TTY_LED_DISABLE,
> +};
> +
> +enum led_trigger_tty_modes {
> +	TRIGGER_TTY_RX = 0,
> +	TRIGGER_TTY_TX,
>  };
>  
>  static int ledtrig_tty_waitforcompletion(struct device *dev)
> @@ -86,12 +99,82 @@ static ssize_t ttyname_store(struct device *dev,
>  }
>  static DEVICE_ATTR_RW(ttyname);
>  
> +static ssize_t ledtrig_tty_attr_show(struct device *dev, char *buf,
> +				     enum led_trigger_tty_modes attr)
> +{
> +	struct ledtrig_tty_data *trigger_data = led_trigger_get_drvdata(dev);
> +	int completion;
> +	bool state;
> +
> +	reinit_completion(&trigger_data->sysfs);
> +	completion = ledtrig_tty_waitforcompletion(dev);
> +	if (completion < 0)
> +		return completion;

Why do you need to wait for anything just to read the sysfs file?  What
does that sync up with?  And why would it matter?

> +
> +	switch (attr) {
> +	case TRIGGER_TTY_RX:
> +		state = trigger_data->mode_rx;
> +		break;
> +	case TRIGGER_TTY_TX:
> +		state = trigger_data->mode_tx;
> +		break;
> +	}
> +
> +	return sysfs_emit(buf, "%u\n", state);
> +}
> +
> +static ssize_t ledtrig_tty_attr_store(struct device *dev, const char *buf,
> +				      size_t size, enum led_trigger_tty_modes attr)
> +{
> +	struct ledtrig_tty_data *trigger_data = led_trigger_get_drvdata(dev);
> +	int completion;
> +	bool state;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &state);
> +	if (ret)
> +		return ret;
> +
> +	reinit_completion(&trigger_data->sysfs);
> +	completion = ledtrig_tty_waitforcompletion(dev);
> +	if (completion < 0)
> +		return completion;

Same here, why sync anything?

What am I missing as to why a completion is needed?

thanks,

greg k-h

