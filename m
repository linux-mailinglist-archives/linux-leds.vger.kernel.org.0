Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F00DE21C647
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2020 23:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbgGKVBO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 11 Jul 2020 17:01:14 -0400
Received: from vps.xff.cz ([195.181.215.36]:42424 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727092AbgGKVBN (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 11 Jul 2020 17:01:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1594501272; bh=vaSU6vP72+flrmguR0y2gyS7TY57zxYCjCx6+xDJP9Q=;
        h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
        b=tPdFbdEh1c6HH4mAkuCnSK2TW9LDbhk/v+KR+ulVLtaqPKpfzc43ATxafwkWjzTTl
         ZFHB5JP9+hMbOdqKPHatJUy/TqSlXRmpN8R8JTdsmk5vok2uihWbqZpFabXYNZUFmQ
         NWr600CHcy/I7oK7fc88/8L7eQPi7Nq+5eAll8Sk=
Date:   Sat, 11 Jul 2020 23:01:11 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH RFC] leds: Add support for per-LED device triggers
Message-ID: <20200711210111.5ysijhexgyzyr7u7@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
References: <20200702144712.1994685-1-megous@megous.com>
 <20200711100409.GA18901@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200711100409.GA18901@amd>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Pavel,

On Sat, Jul 11, 2020 at 12:04:09PM +0200, Pavel Machek wrote:
> Hi!
> 
> > Some LED controllers may come with an internal HW triggering mechanism
> > for the LED and an ability to switch between user control of the LED,
> > or the internal control. One such example is AXP20X PMIC, that allows
> > wither for user control of the LED, or for internal control based on
> > the state of the battery charger.
> > 
> > Add support for registering per-LED device trigger.
> > 
> > Names of private triggers need to be globally unique, but may clash
> > with other private triggers. This is enforced during trigger
> > registration. Developers can register private triggers just like
> > the normal triggers, by setting private_led to a classdev
> > of the LED the trigger is associated with.
> 
> What about this? Should address Marek's concerns about resource use...

What concerns? Marek's concerns seem to be about case where we register
a trigger for (each led * self-working configuration) which I admit
can be quite a lot of triggers if there are many functions. But that's
not my proposal.

My proposal is to only register on trigger per LED at most. So on my
system that's 1 extra trigger and on Marek's system that'd be 48 new
triggers. Neither seems like a meaningful problem from resource
use perspective.

regards,
	o.

> Best regards,
>      	   	 				       		Pavel
> 
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index 79e30d2cb7a5..e8333675959c 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -27,6 +27,12 @@ LIST_HEAD(trigger_list);
>  
>   /* Used by LED Class */
>  
> +static inline bool
> +trigger_relevant(struct led_classdev *led_cdev, struct led_trigger *trig)
> +{
> +	return !trig->trigger_type || trig->trigger_type == led_cdev->trigger_type;
> +}
> +
>  ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
>  			  struct bin_attribute *bin_attr, char *buf,
>  			  loff_t pos, size_t count)
> @@ -50,7 +56,8 @@ ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
>  
>  	down_read(&triggers_list_lock);
>  	list_for_each_entry(trig, &trigger_list, next_trig) {
> -		if (sysfs_streq(buf, trig->name)) {
> +		if (sysfs_streq(buf, trig->name) &&
> +		    trigger_relevant(led_cdev, trig)) {
>  			down_write(&led_cdev->trigger_lock);
>  			led_trigger_set(led_cdev, trig);
>  			up_write(&led_cdev->trigger_lock);
> @@ -96,6 +103,9 @@ static int led_trigger_format(char *buf, size_t size,
>  		bool hit = led_cdev->trigger &&
>  			!strcmp(led_cdev->trigger->name, trig->name);
>  
> +		if (!trigger_relevant(led_cdev, trig))
> +			continue;
> +
>  		len += led_trigger_snprintf(buf + len, size - len,
>  					    " %s%s%s", hit ? "[" : "",
>  					    trig->name, hit ? "]" : "");
> @@ -243,7 +253,8 @@ void led_trigger_set_default(struct led_classdev *led_cdev)
>  	down_read(&triggers_list_lock);
>  	down_write(&led_cdev->trigger_lock);
>  	list_for_each_entry(trig, &trigger_list, next_trig) {
> -		if (!strcmp(led_cdev->default_trigger, trig->name)) {
> +		if (!strcmp(led_cdev->default_trigger, trig->name) &&
> +		    trigger_relevant(led_cdev, trig)) {
>  			led_cdev->flags |= LED_INIT_DEFAULT_TRIGGER;
>  			led_trigger_set(led_cdev, trig);
>  			break;
> @@ -280,7 +291,8 @@ int led_trigger_register(struct led_trigger *trig)
>  	down_write(&triggers_list_lock);
>  	/* Make sure the trigger's name isn't already in use */
>  	list_for_each_entry(_trig, &trigger_list, next_trig) {
> -		if (!strcmp(_trig->name, trig->name)) {
> +		if (!strcmp(_trig->name, trig->name) &&
> +		    (!_trig->private_led || _trig->private_led == trig->private_led)) {
>  			up_write(&triggers_list_lock);
>  			return -EEXIST;
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
> 
> -- 
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html


