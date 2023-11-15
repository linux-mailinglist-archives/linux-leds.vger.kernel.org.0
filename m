Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B7B67E71DD
	for <lists+linux-leds@lfdr.de>; Thu,  9 Nov 2023 20:03:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbjKITDj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Nov 2023 14:03:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231478AbjKITDj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Nov 2023 14:03:39 -0500
Received: from connect.vanmierlo.com (fieber.vanmierlo.com [84.243.197.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F2522D57;
        Thu,  9 Nov 2023 11:03:35 -0800 (PST)
X-Footer: dmFubWllcmxvLmNvbQ==
Received: from roundcube.vanmierlo.com ([192.168.37.37])
        (authenticated user m.brock@vanmierlo.com)
        by connect.vanmierlo.com (Kerio Connect 10.0.2 patch 1) with ESMTPA;
        Thu, 9 Nov 2023 20:03:31 +0100
MIME-Version: 1.0
Date:   Thu, 09 Nov 2023 20:03:31 +0100
From:   m.brock@vanmierlo.com
To:     Florian Eckert <fe@dev.tdt.de>
Cc:     Eckert.Florian@googlemail.com, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, pavel@ucw.cz, lee@kernel.org,
        kabel@kernel.org, u.kleine-koenig@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [Patch v8 6/6] leds: ledtrig-tty: add additional line state
 evaluation
In-Reply-To: <20231109085038.371977-7-fe@dev.tdt.de>
References: <20231109085038.371977-1-fe@dev.tdt.de>
 <20231109085038.371977-7-fe@dev.tdt.de>
Message-ID: <39e7c892299c74821b1105a0967063ca@vanmierlo.com>
X-Sender: m.brock@vanmierlo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Florian Eckert schreef op 2023-11-09 09:50:
> The serial tty interface also supports additional input signals, that
> can also be evaluated within this trigger. This change is adding the
> following additional input sources, which could be controlled
> via the '/sys/class/<leds>/' sysfs interface.
> 
> Explanation:
> DCE = Data Communication Equipment (Modem)
> DTE = Data Terminal Equipment (Computer)
> 
> - cts:
>   DCE is ready to accept data from the DTE (CTS = Clear To Send). If
>   the line state is detected, the LED is switched on.
>   If set to 0 (default), the LED will not evaluate CTS.
>   If set to 1, the LED will evaluate CTS.
> 
> - dsr:
>   DCE is ready to receive and send data (DSR = Data Set Ready). If the
>   line state is detected, the LED is switched on.
>   If set to 0 (default), the LED will not evaluate DSR.
>   If set to 1, the LED will evaluate DSR.
> 
> - dcd:
>   DTE is receiving a carrier from the DCE (DCD = Data Carrier Detect).
>   If the line state is detected, the LED is switched on.
>   If set to 0 (default), the LED will not evaluate DCD.
>   If set to 1, the LED will evaluate DCD.
> 
> - rng:
>   DCE has detected an incoming ring signal on the telephone line
>   (RNG = Ring Indicator). If the line state is detected, the LED is
>   switched on.
>   If set to 0 (default), the LED will not evaluate RNG.
>   If set to 1, the LED will evaluate RNG.
> 
> Also add an invert flag on LED blink, so that the LED blinks in the
> correct order.
> 
> * If one off the new enabled input signals are evaluatet as 'enabled',
>   and data are transmitted, then the LED should first blink 'off' and
>   then 'on' (invert).
> * If all the new enabled input signals are evaluatet as 'disabled',
>   and data are transmitted, then the LED should first blink 'on' and
>   then 'off'.
> 
> Signed-off-by: Florian Eckert <fe@dev.tdt.de>
> ---
>  .../ABI/testing/sysfs-class-led-trigger-tty   | 40 ++++++++++
>  drivers/leds/trigger/ledtrig-tty.c            | 77 ++++++++++++++++++-
>  2 files changed, 116 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-tty
> b/Documentation/ABI/testing/sysfs-class-led-trigger-tty
> index 504dece151b8..30cef9ac0f49 100644
> --- a/Documentation/ABI/testing/sysfs-class-led-trigger-tty
> +++ b/Documentation/ABI/testing/sysfs-class-led-trigger-tty
> @@ -20,3 +20,43 @@ Description:
>  		Signal transmission (tx) of data on the named tty device.
>  		If set to 0, the LED will not blink on transmission.
>  		If set to 1 (default), the LED will blink on transmission.
> +
> +What:		/sys/class/leds/<led>/cts
> +Date:		February 2024
> +KernelVersion:	6.8
> +Description:
> +		CTS = Clear To Send
> +		DCE is ready to accept data from the DTE.
> +		If the line state is detected, the LED is switched on.
> +		If set to 0 (default), the LED will not evaluate CTS.
> +		If set to 1, the LED will evaluate CTS.
> +
> +What:		/sys/class/leds/<led>/dsr
> +Date:		February 2024
> +KernelVersion:	6.8
> +Description:
> +		DSR = Data Set Ready
> +		DCE is ready to receive and send data.
> +		If the line state is detected, the LED is switched on.
> +		If set to 0 (default), the LED will not evaluate DSR.
> +		If set to 1, the LED will evaluate DSR.
> +
> +What:		/sys/class/leds/<led>/dcd
> +Date:		February 2024
> +KernelVersion:	6.8
> +Description:
> +		DCD = Data Carrier Detect
> +		DTE is receiving a carrier from the DCE.
> +		If the line state is detected, the LED is switched on.
> +		If set to 0 (default), the LED will not evaluate CAR (DCD).
> +		If set to 1, the LED will evaluate CAR (DCD).
> +
> +What:		/sys/class/leds/<led>/rng
> +Date:		February 2024
> +KernelVersion:	6.8
> +Description:
> +		RNG = Ring Indicator
> +		DCE has detected an incoming ring signal on the telephone
> +		line. If the line state is detected, the LED is switched on.
> +		If set to 0 (default), the LED will not evaluate RNG.
> +		If set to 1, the LED will evaluate RNG.
> diff --git a/drivers/leds/trigger/ledtrig-tty.c
> b/drivers/leds/trigger/ledtrig-tty.c
> index 1a40a78bf1ee..7291b2d970c6 100644
> --- a/drivers/leds/trigger/ledtrig-tty.c
> +++ b/drivers/leds/trigger/ledtrig-tty.c
> @@ -19,17 +19,26 @@ struct ledtrig_tty_data {
>  	int rx, tx;
>  	bool mode_rx;
>  	bool mode_tx;
> +	bool mode_cts;
> +	bool mode_dsr;
> +	bool mode_dcd;
> +	bool mode_rng;
>  };
> 
>  /* Indicates which state the LED should now display */
>  enum led_trigger_tty_state {
>  	TTY_LED_BLINK,
> +	TTY_LED_ENABLE,
>  	TTY_LED_DISABLE,
>  };
> 
>  enum led_trigger_tty_modes {
>  	TRIGGER_TTY_RX = 0,
>  	TRIGGER_TTY_TX,
> +	TRIGGER_TTY_CTS,
> +	TRIGGER_TTY_DSR,
> +	TRIGGER_TTY_DCD,
> +	TRIGGER_TTY_RNG,
>  };
> 
>  static int ledtrig_tty_waitforcompletion(struct device *dev)
> @@ -118,6 +127,18 @@ static ssize_t ledtrig_tty_attr_show(struct
> device *dev, char *buf,
>  	case TRIGGER_TTY_TX:
>  		state = trigger_data->mode_tx;
>  		break;
> +	case TRIGGER_TTY_CTS:
> +		state = trigger_data->mode_cts;
> +		break;
> +	case TRIGGER_TTY_DSR:
> +		state = trigger_data->mode_dsr;
> +		break;
> +	case TRIGGER_TTY_DCD:
> +		state = trigger_data->mode_dcd;
> +		break;
> +	case TRIGGER_TTY_RNG:
> +		state = trigger_data->mode_rng;
> +		break;
>  	}
> 
>  	return sysfs_emit(buf, "%u\n", state);
> @@ -147,6 +168,18 @@ static ssize_t ledtrig_tty_attr_store(struct
> device *dev, const char *buf,
>  	case TRIGGER_TTY_TX:
>  		trigger_data->mode_tx = state;
>  		break;
> +	case TRIGGER_TTY_CTS:
> +		trigger_data->mode_cts = state;
> +		break;
> +	case TRIGGER_TTY_DSR:
> +		trigger_data->mode_dsr = state;
> +		break;
> +	case TRIGGER_TTY_DCD:
> +		trigger_data->mode_dcd = state;
> +		break;
> +	case TRIGGER_TTY_RNG:
> +		trigger_data->mode_rng = state;
> +		break;
>  	}
> 
>  	return size;
> @@ -167,6 +200,10 @@ static ssize_t ledtrig_tty_attr_store(struct
> device *dev, const char *buf,
> 
>  DEFINE_TTY_TRIGGER(rx, TRIGGER_TTY_RX);
>  DEFINE_TTY_TRIGGER(tx, TRIGGER_TTY_TX);
> +DEFINE_TTY_TRIGGER(cts, TRIGGER_TTY_CTS);
> +DEFINE_TTY_TRIGGER(dsr, TRIGGER_TTY_DSR);
> +DEFINE_TTY_TRIGGER(dcd, TRIGGER_TTY_DCD);
> +DEFINE_TTY_TRIGGER(rng, TRIGGER_TTY_RNG);
> 
>  static void ledtrig_tty_work(struct work_struct *work)
>  {
> @@ -175,6 +212,8 @@ static void ledtrig_tty_work(struct work_struct 
> *work)
>  	struct led_classdev *led_cdev = trigger_data->led_cdev;
>  	enum led_trigger_tty_state state = TTY_LED_DISABLE;
>  	unsigned long interval = LEDTRIG_TTY_INTERVAL;
> +	bool invert = false;
> +	int status;
>  	int ret;
> 
>  	if (!trigger_data->ttyname)
> @@ -202,6 +241,33 @@ static void ledtrig_tty_work(struct work_struct 
> *work)
>  		trigger_data->tty = tty;
>  	}
> 
> +	status = tty_get_tiocm(trigger_data->tty);
> +	if (status > 0) {
> +		if (trigger_data->mode_cts) {
> +			if (status & TIOCM_CTS)
> +				state = TTY_LED_ENABLE;
> +		}
> +
> +		if (trigger_data->mode_dsr) {
> +			if (status & TIOCM_DSR)
> +				state = TTY_LED_ENABLE;
> +		}
> +
> +		if (trigger_data->mode_dcd) {
> +			if (status & TIOCM_CAR)
> +				state = TTY_LED_ENABLE;
> +		}
> +
> +		if (trigger_data->mode_rng) {
> +			if (status & TIOCM_RNG)
> +				state = TTY_LED_ENABLE;
> +		}
> +	}
> +
> +	/*
> +	 * The evaluation of rx/tx must be done after the evaluation
> +	 * of TIOCM_*, because rx/tx has priority.
> +	 */
>  	if (trigger_data->mode_rx || trigger_data->mode_tx) {
>  		struct serial_icounter_struct icount;
> 
> @@ -211,11 +277,13 @@ static void ledtrig_tty_work(struct work_struct 
> *work)
> 
>  		if (trigger_data->mode_tx && (icount.tx != trigger_data->tx)) {
>  			trigger_data->tx = icount.tx;
> +			invert = state == TTY_LED_ENABLE;
>  			state = TTY_LED_BLINK;
>  		}
> 
>  		if (trigger_data->mode_rx && (icount.rx != trigger_data->rx)) {
>  			trigger_data->rx = icount.rx;
> +			invert = state == TTY_LED_ENABLE;
>  			state = TTY_LED_BLINK;
>  		}
>  	}
> @@ -223,7 +291,10 @@ static void ledtrig_tty_work(struct work_struct 
> *work)
>  out:
>  	switch (state) {
>  	case TTY_LED_BLINK:
> -		led_blink_set_oneshot(led_cdev, &interval, &interval, 0);
> +		led_blink_set_oneshot(led_cdev, &interval, &interval, invert);
> +		break;
> +	case TTY_LED_ENABLE:
> +		led_set_brightness(led_cdev, led_cdev->blink_brightness);
>  		break;
>  	case TTY_LED_DISABLE:
>  		fallthrough;
> @@ -241,6 +312,10 @@ static struct attribute *ledtrig_tty_attrs[] = {
>  	&dev_attr_ttyname.attr,
>  	&dev_attr_rx.attr,
>  	&dev_attr_tx.attr,
> +	&dev_attr_cts.attr,
> +	&dev_attr_dsr.attr,
> +	&dev_attr_dcd.attr,
> +	&dev_attr_rng.attr,
>  	NULL
>  };
>  ATTRIBUTE_GROUPS(ledtrig_tty);

Reviewed-by: Maarten Brock <m.brock@vanmierlo.com>

