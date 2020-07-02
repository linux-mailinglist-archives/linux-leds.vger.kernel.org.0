Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B553E212725
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2020 16:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbgGBO4i (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 2 Jul 2020 10:56:38 -0400
Received: from vps.xff.cz ([195.181.215.36]:47338 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726032AbgGBO4i (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 2 Jul 2020 10:56:38 -0400
X-Greylist: delayed 538 seconds by postgrey-1.27 at vger.kernel.org; Thu, 02 Jul 2020 10:56:36 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1593701490; bh=8Lafhf52OmE2ABPw47gwSdwhTa88IzL7NH6IzBd7nlU=;
        h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
        b=ZabYM9SsVIhnEXhg0pKjt+hSD7xJ761TZV/lRgnGh9WOfjjb7ai8ApCqyPA/l5b/Y
         pcDE9y8mcYqMQQ9rqi6W8dF0hAInrOaZn3PgkNNq31yhNY1l3aQ8l/6G0GPQrKVp5w
         T5uYl5fsq+51tGw4y/USoij2FMcc6mbo2WIRHQ4I=
Date:   Thu, 2 Jul 2020 16:51:29 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     linux-kernel@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH RFC] leds: Add support for per-LED device triggers
Message-ID: <20200702145129.7k5sgvexmze2sktx@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
References: <20200702144712.1994685-1-megous@megous.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200702144712.1994685-1-megous@megous.com>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On Thu, Jul 02, 2020 at 04:47:11PM +0200, megous hlavni wrote:
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

I've prepared this patch based on the note here:

 https://www.kernel.org/doc/html/latest/leds/leds-class.html

  Future Development:
  
  At the moment, a trigger can’t be created specifically for a single LED. There
  are a number of cases where a trigger might only be mappable to a particular
  LED (ACPI?). The addition of triggers provided by the LED driver should cover
  this option and be possible to add without breaking the current interface.

Does it look good?

I plan to use this interface in the axp20x driver I've sent previously,
if this patch is acceptable.

thank you and regards,
	o.

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
> @@ -50,7 +50,8 @@ ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
>  
>  	down_read(&triggers_list_lock);
>  	list_for_each_entry(trig, &trigger_list, next_trig) {
> -		if (sysfs_streq(buf, trig->name)) {
> +		if (sysfs_streq(buf, trig->name) &&
> +		    (!trig->private_led || trig->private_led == led_cdev)) {
>  			down_write(&led_cdev->trigger_lock);
>  			led_trigger_set(led_cdev, trig);
>  			up_write(&led_cdev->trigger_lock);
> @@ -96,6 +97,9 @@ static int led_trigger_format(char *buf, size_t size,
>  		bool hit = led_cdev->trigger &&
>  			!strcmp(led_cdev->trigger->name, trig->name);
>  
> +		if (trig->private_led && trig->private_led != led_cdev)
> +			continue;
> +
>  		len += led_trigger_snprintf(buf + len, size - len,
>  					    " %s%s%s", hit ? "[" : "",
>  					    trig->name, hit ? "]" : "");
> @@ -243,7 +247,8 @@ void led_trigger_set_default(struct led_classdev *led_cdev)
>  	down_read(&triggers_list_lock);
>  	down_write(&led_cdev->trigger_lock);
>  	list_for_each_entry(trig, &trigger_list, next_trig) {
> -		if (!strcmp(led_cdev->default_trigger, trig->name)) {
> +		if (!strcmp(led_cdev->default_trigger, trig->name) &&
> +		    (!trig->private_led || trig->private_led == led_cdev)) {
>  			led_cdev->flags |= LED_INIT_DEFAULT_TRIGGER;
>  			led_trigger_set(led_cdev, trig);
>  			break;
> @@ -280,7 +285,8 @@ int led_trigger_register(struct led_trigger *trig)
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
> index 2451962d1ec5..0d7577c752ad 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -345,6 +345,9 @@ struct led_trigger {
>  	int		(*activate)(struct led_classdev *led_cdev);
>  	void		(*deactivate)(struct led_classdev *led_cdev);
>  
> +	/* LED-private triggers have the LED device set here. */
> +	struct led_classdev *private_led;

I'm not sure what the best descriptive name is here. ^

regards,
	o.

>  	/* LEDs under control by this trigger (for simple triggers) */
>  	rwlock_t	  leddev_list_lock;
>  	struct list_head  led_cdevs;
> -- 
> 2.27.0
> 
