Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 908286A0CCE
	for <lists+linux-leds@lfdr.de>; Thu, 23 Feb 2023 16:23:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234256AbjBWPX1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Feb 2023 10:23:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233562AbjBWPX0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Feb 2023 10:23:26 -0500
X-Greylist: delayed 333 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 23 Feb 2023 07:23:25 PST
Received: from mail.thorsis.com (mail.thorsis.com [92.198.35.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A4571EBE1
        for <linux-leds@vger.kernel.org>; Thu, 23 Feb 2023 07:23:25 -0800 (PST)
Date:   Thu, 23 Feb 2023 16:17:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=default;
        t=1677165470;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DxwZFXlzXmD6Dm3HmtbAMkoyxqZV9XkD2nm6TYdo9F8=;
        b=ahGUnbWpiILI+wFajL22eECh3NdOTHyFeW1a/kcMQ6nOy5ii7SOmx8JqbiQqRCitOGCFF9
        lZU4402bRdqPLQf7aacNpRNaou7pE2nNdONuFAgBvWua1COzjTHi3o56S8j7SOCczZNMeY
        jf1vjEN5/Ded2/A6hP8i+TXYkHwJ1ap8hSza/0CXCGS/3w8cFZ9NSUGC3ZA0cSbGbA+BLP
        rH3BrOOTb3n2yrPGZfUjWMjlkmCu3zoOHjDVhuEXF+j07U6Y6lMoo9rS+E3QuYPxMtjqp+
        snGeW0S3zdFkopiPBN4mogu1kltH7MuT0Yf6V3aKHjsldx5rnfdHc/ZzW8qNvA==
From:   Alexander Dahl <ada@thorsis.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-leds@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] leds: trigger/tty: Add knob to blink only for tx or only
 for rx
Message-ID: <Y/eDeEi1tekYodGW@ada.ifak-system.com>
Mail-Followup-To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
        Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-leds@vger.kernel.org, kernel@pengutronix.de
References: <20220224155655.702255-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220224155655.702255-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hei hei,

Am Thu, Feb 24, 2022 at 04:56:55PM +0100 schrieb Uwe Kleine-König:
> The newly introduced "triggerevent" attribute allows to restrict
> blinking to TX or RX only.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

This patch has not been merged, has it?

What's the state of it?  Fell through the cracks or denied?

I'd have a usecase for it. O:-)

Greets
Alex

> ---
>  .../ABI/testing/sysfs-class-led-trigger-tty   |  9 +++
>  drivers/leds/trigger/ledtrig-tty.c            | 60 ++++++++++++++++++-
>  2 files changed, 67 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-tty b/Documentation/ABI/testing/sysfs-class-led-trigger-tty
> index 2bf6b24e781b..27532f685b0d 100644
> --- a/Documentation/ABI/testing/sysfs-class-led-trigger-tty
> +++ b/Documentation/ABI/testing/sysfs-class-led-trigger-tty
> @@ -4,3 +4,12 @@ KernelVersion:	5.10
>  Contact:	linux-leds@vger.kernel.org
>  Description:
>  		Specifies the tty device name of the triggering tty
> +
> +What:		/sys/class/leds/<led>/triggerevent
> +Date:		Feb 2022
> +KernelVersion:	5.18
> +Contact:	linux-leds@vger.kernel.org
> +Description:
> +		Can contain "tx', "rx" (to only blink on transfers
> +		in the specified direction) or "both" (to blink for
> +		both directions.)
> diff --git a/drivers/leds/trigger/ledtrig-tty.c b/drivers/leds/trigger/ledtrig-tty.c
> index f62db7e520b5..f87877ca48d4 100644
> --- a/drivers/leds/trigger/ledtrig-tty.c
> +++ b/drivers/leds/trigger/ledtrig-tty.c
> @@ -14,6 +14,7 @@ struct ledtrig_tty_data {
>  	const char *ttyname;
>  	struct tty_struct *tty;
>  	int rx, tx;
> +	bool handle_rx, handle_tx;
>  };
>  
>  static void ledtrig_tty_restart(struct ledtrig_tty_data *trigger_data)
> @@ -76,6 +77,57 @@ static ssize_t ttyname_store(struct device *dev,
>  }
>  static DEVICE_ATTR_RW(ttyname);
>  
> +static ssize_t triggerevent_show(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	struct ledtrig_tty_data *trigger_data = led_trigger_get_drvdata(dev);
> +	ssize_t len = 0;
> +
> +	mutex_lock(&trigger_data->mutex);
> +
> +	if (trigger_data->handle_tx && trigger_data->handle_rx)
> +		len = sprintf(buf, "both\n");
> +	else if (trigger_data->handle_tx)
> +		len = sprintf(buf, "tx\n");
> +	else
> +		len = sprintf(buf, "rx\n");
> +
> +	mutex_unlock(&trigger_data->mutex);
> +
> +	return len;
> +}
> +
> +static ssize_t triggerevent_store(struct device *dev,
> +				  struct device_attribute *attr,
> +				  const char *buf, size_t size)
> +{
> +	struct ledtrig_tty_data *trigger_data = led_trigger_get_drvdata(dev);
> +	ssize_t ret = size;
> +
> +	if (size > 0 && buf[size - 1] == '\n')
> +		size -= 1;
> +
> +	mutex_lock(&trigger_data->mutex);
> +
> +	if (!strncmp(buf, "both", size)) {
> +		trigger_data->handle_tx = true;
> +		trigger_data->handle_rx = true;
> +	} else if (!strncmp(buf, "tx", size)) {
> +		trigger_data->handle_tx = true;
> +		trigger_data->handle_rx = false;
> +	} else if (!strncmp(buf, "rx", size)) {
> +		trigger_data->handle_tx = false;
> +		trigger_data->handle_rx = true;
> +	} else {
> +		ret = -EINVAL;
> +	}
> +
> +	mutex_unlock(&trigger_data->mutex);
> +
> +	return ret;
> +}
> +static DEVICE_ATTR_RW(triggerevent);
> +
>  static void ledtrig_tty_work(struct work_struct *work)
>  {
>  	struct ledtrig_tty_data *trigger_data =
> @@ -120,8 +172,8 @@ static void ledtrig_tty_work(struct work_struct *work)
>  		return;
>  	}
>  
> -	if (icount.rx != trigger_data->rx ||
> -	    icount.tx != trigger_data->tx) {
> +	if ((icount.rx != trigger_data->rx && trigger_data->handle_rx) ||
> +	    (icount.tx != trigger_data->tx && trigger_data->handle_tx)) {
>  		led_set_brightness_sync(trigger_data->led_cdev, LED_ON);
>  
>  		trigger_data->rx = icount.rx;
> @@ -137,6 +189,7 @@ static void ledtrig_tty_work(struct work_struct *work)
>  
>  static struct attribute *ledtrig_tty_attrs[] = {
>  	&dev_attr_ttyname.attr,
> +	&dev_attr_triggerevent.attr,
>  	NULL
>  };
>  ATTRIBUTE_GROUPS(ledtrig_tty);
> @@ -155,6 +208,9 @@ static int ledtrig_tty_activate(struct led_classdev *led_cdev)
>  	trigger_data->led_cdev = led_cdev;
>  	mutex_init(&trigger_data->mutex);
>  
> +	trigger_data->handle_tx = true;
> +	trigger_data->handle_rx = true;
> +
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 
