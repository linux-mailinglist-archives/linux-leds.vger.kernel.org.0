Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6D121385D
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jul 2020 12:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725810AbgGCKGI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Jul 2020 06:06:08 -0400
Received: from mail.nic.cz ([217.31.204.67]:51698 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725796AbgGCKGI (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 3 Jul 2020 06:06:08 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTPSA id D4A0E14078D;
        Fri,  3 Jul 2020 12:06:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1593770762; bh=kV4j8O4Cdf60Mymne/xK8E9dxp4Yx5R0Zj2sfcDUqYY=;
        h=Date:From:To;
        b=pwoywm1MWjdIqRQvClsSnxw5czhMCeyDm/cJkvitVhOHOK7T8mdUx8NcW3RnKtY7d
         CYl4K0Wm8ZN9Q8VOKZz+RumyVvt4BC/MQ9alz84VXEAmdmzkq57RpfuatvlRBdL7Cb
         7bb20LzWCpEfofCh6aTyx6Put4Pii8Ue1LTzJPGw=
Date:   Fri, 3 Jul 2020 12:06:02 +0200
From:   Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
To:     Ondrej Jirman <megous@megous.com>
Cc:     linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org (open list:LED SUBSYSTEM)
Subject: Re: [PATCH RFC] leds: Add support for per-LED device triggers
Message-ID: <20200703120602.457cff1a@dellmb.labs.office.nic.cz>
In-Reply-To: <20200702144712.1994685-1-megous@megous.com>
References: <20200702144712.1994685-1-megous@megous.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WHITELIST shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu,  2 Jul 2020 16:47:11 +0200
Ondrej Jirman <megous@megous.com> wrote:

> Some LED controllers may come with an internal HW triggering mechanism
> for the LED and an ability to switch between user control of the LED,
> or the internal control. One such example is AXP20X PMIC, that allows
> wither for user control of the LED, or for internal control based on
> the state of the battery charger.
> 
> Add support for registering per-LED device trigger.
> 
> Names of private triggers need to be globally unique, but may clash
> with other private triggers. This is enforced during trigger
> registration. Developers can register private triggers just like
> the normal triggers, by setting private_led to a classdev
> of the LED the trigger is associated with.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  drivers/leds/led-triggers.c | 12 +++++++++---
>  include/linux/leds.h        |  3 +++
>  2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index 79e30d2cb7a5..3011e2658404 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -50,7 +50,8 @@ ssize_t led_trigger_write(struct file *filp, struct
> kobject *kobj, 
>  	down_read(&triggers_list_lock);
>  	list_for_each_entry(trig, &trigger_list, next_trig) {
> -		if (sysfs_streq(buf, trig->name)) {
> +		if (sysfs_streq(buf, trig->name) &&
> +		    (!trig->private_led || trig->private_led ==
> led_cdev)) { down_write(&led_cdev->trigger_lock);
>  			led_trigger_set(led_cdev, trig);
>  			up_write(&led_cdev->trigger_lock);
> @@ -96,6 +97,9 @@ static int led_trigger_format(char *buf, size_t
> size, bool hit = led_cdev->trigger &&
>  			!strcmp(led_cdev->trigger->name, trig->name);
>  
> +		if (trig->private_led && trig->private_led !=
> led_cdev)
> +			continue;
> +
>  		len += led_trigger_snprintf(buf + len, size - len,
>  					    " %s%s%s", hit ? "[" :
> "", trig->name, hit ? "]" : "");
> @@ -243,7 +247,8 @@ void led_trigger_set_default(struct led_classdev
> *led_cdev) down_read(&triggers_list_lock);
>  	down_write(&led_cdev->trigger_lock);
>  	list_for_each_entry(trig, &trigger_list, next_trig) {
> -		if (!strcmp(led_cdev->default_trigger, trig->name)) {
> +		if (!strcmp(led_cdev->default_trigger, trig->name) &&
> +		    (!trig->private_led || trig->private_led ==
> led_cdev)) { led_cdev->flags |= LED_INIT_DEFAULT_TRIGGER;
>  			led_trigger_set(led_cdev, trig);
>  			break;
> @@ -280,7 +285,8 @@ int led_trigger_register(struct led_trigger *trig)
>  	down_write(&triggers_list_lock);
>  	/* Make sure the trigger's name isn't already in use */
>  	list_for_each_entry(_trig, &trigger_list, next_trig) {
> -		if (!strcmp(_trig->name, trig->name)) {
> +		if (!strcmp(_trig->name, trig->name) &&
> +		    (!_trig->private_led || _trig->private_led ==
> trig->private_led)) { up_write(&triggers_list_lock);
>  			return -EEXIST;
>  		}
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 2451962d1ec5..0d7577c752ad 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -345,6 +345,9 @@ struct led_trigger {
>  	int		(*activate)(struct led_classdev
> *led_cdev); void		(*deactivate)(struct led_classdev
> *led_cdev); 
> +	/* LED-private triggers have the LED device set here. */
> +	struct led_classdev *private_led;
> +
>  	/* LEDs under control by this trigger (for simple triggers)
> */ rwlock_t	  leddev_list_lock;
>  	struct list_head  led_cdevs;

Hi Ondrej,

Some criticism to this approach to HW triggers:
- every hw trigger for each LED has to be registered via current trigger
  API. This will grow code size and memory footprint once this API is
  widely used
- one HW trigger can only master one LED device (via private_led
  member). So if I have, for example an ethernet switch with 8 ports,
  and each port has 2 LEDs, and each LED has 10 possible HW triggering
  mechanisms, with your proposed API one would need to register 8*2*10
  = 160 triggers

I too have been thinking about an API for HW LED triggers, and I
tinkered with it a little. Some time ago I sent some emails, with
subjects:
  "RFC: LED hw triggering API"
  "about my trigger-sources work"

My current thoughts about how HW LED triggers could work nicely is as
such:
  - these members (maybe with different names) shall be added to struct
    led_classdev:
      available_hw_triggers()
        - shall return a NULL terminated list of HW trigger names
          available for this LED
      set_hw_trigger()
        - sets HW trigger for this LED. The LED triggering API shall
          call this method after previous LED trigger is unset. If
          called with NULL parameter, unsets HW trigger
      current_hw_trigger
        - name of the currently set HW LED trigger for this LED
  - the driver registering the LED cdev informs abouth the LED being
    capable of HW triggering - members available_hw_triggers and
    set_hw_trigger must be set
  - SW LED trigger and HW LED trigger are mutualy exclusive on one LED
  - the trigger file in sysfs (/sys/class/leds/LED/trigger) shall first
    list the available SW triggers, and then available hw triggers for
    this LED, prefixed with "hw:"
    When written, if the written trigger name starts with "hw:",
    instead of setting SW trigger, a HW trigger is set via
    set_hw_trigger() method

This could also nicely work with trigger-source DTS property - when the
driver registers a LED, it can determine what other device is
triggering the LED (for example a netdevice), and correspondingly set
the correct name for the LED. Code for that could be shared between HW
and SW triggering API.

Marek
