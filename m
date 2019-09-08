Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADD8AACED4
	for <lists+linux-leds@lfdr.de>; Sun,  8 Sep 2019 15:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727766AbfIHNKF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Sep 2019 09:10:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:55594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725947AbfIHNKE (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 8 Sep 2019 09:10:04 -0400
Received: from localhost (unknown [62.28.240.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EA451218AC;
        Sun,  8 Sep 2019 13:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567948203;
        bh=wsE18uqe+Sg9sX1ALTDPi25Ay/TQw1tQFJ/E+0K4qsc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XcrVqISRC7RRFuStdVf5sMR1RbWzRGiEIMpLsMXODQRtoeK0OJHc0ZlOq6vscTxaH
         NCwJNrgZH0J26dXwxr6xl2OHESAsNpoVV0/yOEnmXad0XjZP2pi6B2Ohfw1gfdM1o6
         824nUjJBlVmwuDC/QolHOqD7m3RW6aulxoFWdE1U=
Date:   Sun, 8 Sep 2019 14:10:01 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 5/5] leds: add /sys/class/leds/<led>/current-trigger
Message-ID: <20190908131001.GC9466@kroah.com>
References: <1567946472-10075-1-git-send-email-akinobu.mita@gmail.com>
 <1567946472-10075-6-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567946472-10075-6-git-send-email-akinobu.mita@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Sep 08, 2019 at 09:41:12PM +0900, Akinobu Mita wrote:
> Reading /sys/class/leds/<led>/trigger returns all available LED triggers.
> However, this violates the "one value per file" rule of sysfs.
> 
> This provides /sys/class/leds/<led>/current-trigger which is almost
> identical to /sys/class/leds/<led>/trigger.  The only difference is that
> 'current-trigger' only shows the current trigger name.
> 
> This new file follows the "one value per file" rule of sysfs.
> We can use the /sys/class/triggers directory to get the list of available
> LED triggers.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> ---
>  Documentation/ABI/testing/sysfs-class-led | 13 +++++++++++
>  drivers/leds/led-class.c                  |  7 ++++++
>  drivers/leds/led-triggers.c               | 38 +++++++++++++++++++++++++++----
>  drivers/leds/leds.h                       |  5 ++++
>  4 files changed, 59 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
> index 14d91af..1a1be10 100644
> --- a/Documentation/ABI/testing/sysfs-class-led
> +++ b/Documentation/ABI/testing/sysfs-class-led
> @@ -70,3 +70,16 @@ Description:
>  		This directory contains a number of sub-directories, each
>  		representing an LED trigger. The name of the sub-directory
>  		matches the LED trigger name.
> +
> +What:		/sys/class/leds/<led>/current-trigger
> +Date:		September 2019
> +KernelVersion:	5.5
> +Contact:	linux-leds@vger.kernel.org
> +Description:
> +		Set the trigger for this LED. A trigger is a kernel based source
> +		of LED events.
> +		Writing the trigger name to this file will change the current
> +		trigger. Trigger specific parameters can appear in
> +		/sys/class/leds/<led> once a given trigger is selected. For
> +		their documentation see sysfs-class-led-trigger-*.
> +		Reading this file will return the current LED trigger name.
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 04e6c14..388500b 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -73,12 +73,19 @@ static ssize_t max_brightness_show(struct device *dev,
>  static DEVICE_ATTR_RO(max_brightness);
>  
>  #ifdef CONFIG_LEDS_TRIGGERS
> +static DEVICE_ATTR(current_trigger, 0644, led_current_trigger_show,
> +		   led_current_trigger_store);

DEVICE_ATTR_RW()?


> +static struct attribute *led_current_trigger_attrs[] = {
> +	&dev_attr_current_trigger.attr,
> +	NULL,
> +};
>  static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);

BIN_ATTR_RW()?

And no whitespace?

thanks,

gre gk-h
