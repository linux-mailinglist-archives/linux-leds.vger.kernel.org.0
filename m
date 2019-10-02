Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FFC4C8CD6
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2019 17:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbfJBP1Y (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Oct 2019 11:27:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:37540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727756AbfJBP1Y (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 2 Oct 2019 11:27:24 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 85DC821920;
        Wed,  2 Oct 2019 15:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570030043;
        bh=N6nCtFyy4PN0zLmYzEpPNNT1Qk905Tislp/fIPFBW6c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LvckY60fpe1emInbuIWvc5DVgeT+jL3mgKoV0W1Pf3rwj8AsI/9Vwg/ZY/ImdWY3N
         u7U/dUAnTKFeaxkscPilExUZDukBvYJnkoxWJJyD6ojNtDUCwQN/aoJPkd8ohLqR1H
         vvulgk4GJJ/A2akUDQQkRpoQEf4j1Lf8bIDcnB2A=
Date:   Wed, 2 Oct 2019 17:27:20 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH -next 1/2] leds: add /sys/devices/virtual/led-trigger/
Message-ID: <20191002152720.GB1748000@kroah.com>
References: <1570029181-11102-1-git-send-email-akinobu.mita@gmail.com>
 <1570029181-11102-2-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1570029181-11102-2-git-send-email-akinobu.mita@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Oct 03, 2019 at 12:13:00AM +0900, Akinobu Mita wrote:
> Reading /sys/class/leds/<led>/trigger returns all available LED triggers.
> However, this violates the "one value per file" rule of sysfs.
> 
> This makes led_triggers "real" devices and provides an
> /sys/devices/virtual/led-trigger/ directory that contains a sub-directoriy
> for each LED trigger device. The name of the sub-directory matches the LED
> trigger name.
> 
> We can find all available LED triggers by listing this directory contents.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> ---
>  .../ABI/testing/sysfs-devices-virtual-led-trigger  |  8 +++
>  drivers/leds/led-triggers.c                        | 57 ++++++++++++++++++++++
>  include/linux/leds.h                               |  3 ++
>  3 files changed, 68 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-devices-virtual-led-trigger
> 
> diff --git a/Documentation/ABI/testing/sysfs-devices-virtual-led-trigger b/Documentation/ABI/testing/sysfs-devices-virtual-led-trigger
> new file mode 100644
> index 0000000..b8eb8f3
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-devices-virtual-led-trigger
> @@ -0,0 +1,8 @@
> +What:		/sys/devices/virtual/leds-trigger/
> +Date:		September 2019
> +KernelVersion:	5.5
> +Contact:	linux-leds@vger.kernel.org
> +Description:
> +		This directory contains a sub-directoriy for each LED trigger
> +		device. The name of the sub-directory matches the LED trigger
> +		name.
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index 79e30d2..0b810cf 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -267,21 +267,76 @@ void led_trigger_rename_static(const char *name, struct led_trigger *trig)
>  }
>  EXPORT_SYMBOL_GPL(led_trigger_rename_static);
>  
> +struct ledtrig_device {
> +	struct device dev;
> +};
> +
> +static void ledtrig_device_release(struct device *dev)
> +{
> +	struct ledtrig_device *trig_dev =
> +		container_of(dev, struct ledtrig_device, dev);
> +
> +	kfree(trig_dev);
> +}
> +
> +static struct bus_type led_trigger_subsys = {
> +	.name = "led-trigger",
> +};
> +
> +static int led_trigger_subsys_init(void)
> +{
> +	static DEFINE_MUTEX(init_mutex);
> +	static bool init_done;
> +	int ret = 0;
> +
> +	mutex_lock(&init_mutex);
> +	if (!init_done) {

a test and set of an atomic would solve the issue of having both a mutex
and a boolean, right?

thanks,

greg k-h
