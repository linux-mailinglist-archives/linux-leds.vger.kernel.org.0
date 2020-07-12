Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF24C21CBEB
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2020 00:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgGLWiY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Jul 2020 18:38:24 -0400
Received: from vps.xff.cz ([195.181.215.36]:60010 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727795AbgGLWiX (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 12 Jul 2020 18:38:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1594593502; bh=Xigmr0d8RiWHpj+rKd7rR7nm7Mkg5Q6RCUpm13dySSE=;
        h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
        b=HxXwcjYsfwgeupqtWRr40RLGElsrT1XB/Kjjl5ZhqBYAX3qVkyG/fSz7S7EKQpD3m
         5jv77JnR9NfCnZbU0bqk4iGcEQm8WMqKqJRg1dnewNqGHR21Em/PcHQ4hgWKpKZR9P
         g29V4+OxVTHKS5PIF1mGn7rJwsxY8VYtzXTZ+IKg=
Date:   Mon, 13 Jul 2020 00:38:21 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>,
        marek.behun@nic.cz
Subject: Re: [PATCH RFC] leds: Add support for per-LED device triggers
Message-ID: <20200712223821.742ljr4qxdrx3aqv@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>,
        marek.behun@nic.cz
References: <20200702144712.1994685-1-megous@megous.com>
 <20200711100409.GA18901@amd>
 <20200711210111.5ysijhexgyzyr7u7@core.my.home>
 <20200712072554.GC4721@duo.ucw.cz>
 <20200712134911.r3lig4hgyqhmslth@core.my.home>
 <20200712191111.GA20592@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200712191111.GA20592@amd>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello,

On Sun, Jul 12, 2020 at 09:11:11PM +0200, Pavel Machek wrote:
> Hi!
> 

[....]

>  		}
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 2451962d1ec5..cba52714558f 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -57,6 +57,10 @@ struct led_init_data {
>  	bool devname_mandatory;
>  };
>  
> +struct led_hw_trigger_type {
> +	int dummy;
> +}
> +
>  struct led_classdev {
>  	const char		*name;
>  	enum led_brightness	 brightness;
> @@ -150,6 +154,8 @@ struct led_classdev {
>  
>  	/* Ensures consistent access to the LED Flash Class device */
>  	struct mutex		led_access;
> +
> +	struct led_hw_trigger_type *trigger_type;
>  };
>  
>  /**
> @@ -345,6 +351,9 @@ struct led_trigger {
>  	int		(*activate)(struct led_classdev *led_cdev);
>  	void		(*deactivate)(struct led_classdev *led_cdev);
>  
> +	/* LED-private triggers have this set. */
> +	struct led_hw_trigger_type *trigger_type;
> +
>  	/* LEDs under control by this trigger (for simple triggers) */
>  	rwlock_t	  leddev_list_lock;
>  	struct list_head  led_cdevs;

So after trying to use this, this seems to disallow the use of multiple HW
triggers per LED. That's fine by me, because using one HW sysfs configured
trigger per LED that use case is my proposal, but is it desireable in general?

Drivers would be forced to use just one HW trigger + sysfs config, instead
of having freedom between choosing either that or expressing multiple hw
triggering modes via multiple differently named HW triggers.

regards,
	o.

> -- 
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html


