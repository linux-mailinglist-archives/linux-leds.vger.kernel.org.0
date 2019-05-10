Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7262E1A2E6
	for <lists+linux-leds@lfdr.de>; Fri, 10 May 2019 20:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727535AbfEJSUA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 10 May 2019 14:20:00 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46971 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727453AbfEJST7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 10 May 2019 14:19:59 -0400
Received: by mail-lf1-f65.google.com with SMTP id k18so4783935lfj.13
        for <linux-leds@vger.kernel.org>; Fri, 10 May 2019 11:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GOfE5TcBaRd7H5P1DboVwIMVeDugvNSLUM2rmpzEpwQ=;
        b=rltr32xd3scRDMNdb9/+hfFhvlbzkGlOwLiCv0wSwaXJR0n5ld+V2STro7RTTWP8mj
         y2vSV9X/IO0c6JMD+/J0BiG/dULG8K4g0rFaOyD9iBgMNjEEfaGAzQVPt0ksaaoDw0OG
         0CriDQkyTCTk6Z8mrtHIQvKNt+GSFTISGlNF/530QgEiUriS84lHie+BsFQ1k2QWaZbQ
         tV+5R23K171eI0aZbddFgLfAUzBEPPrfINbJ7JsaROOOP2oB12gQUjgJHp9kWQkfhDZ5
         m2A2bFy/RLquHj858MWrpW5bfkPewL/IVDae1nsc2EqGyAYwgTz/rw2X4TiSQVq6lfDU
         o7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GOfE5TcBaRd7H5P1DboVwIMVeDugvNSLUM2rmpzEpwQ=;
        b=VTBFyk/iZQE2jW8b7Nhh6WGnDXnH3/2RRkmrBtkF6R2DHp0Emj71avFIUM/sNicBlB
         8T3rKZ90KGn6NV2HT8/+047UYwrHwmcJvhXjafZt+5ihBoKYNGNXuRz+XGL2Yz5AHDL3
         vWphRUArULn9X7uHagFR8b8wszUEhkeUH1HH4u651bwI+dY4u/0BmbCnBOULSo4foDUx
         K6OtYwHBpoE5fDseGU5KVLfwjUPFcJOUNeDO/4v+8geWhDuOWQ/lIOQ0yBZNDMoy6ECL
         oE09XVjE70J4RJLYY5YJtUo8D7PuSU8JGAhbmeKN4gMvwyA6ucxHmliu/B2H0pnCkYKr
         cUVQ==
X-Gm-Message-State: APjAAAXjFwl2xfa633xPOUofwTbntcH7yhmKj5JMryWAffhTtn0G1VQA
        14zwbakmlljF/OPwvEdoXoc=
X-Google-Smtp-Source: APXvYqxKPQkgwHVkKnsWKYilVfsFr+mjW+nI/sGcF05E+fMGVgXGom8ivhDoB4H2HaZnNAL+16hfnQ==
X-Received: by 2002:a19:3f4f:: with SMTP id m76mr6781748lfa.17.1557512396094;
        Fri, 10 May 2019 11:19:56 -0700 (PDT)
Received: from [192.168.1.19] (bgp193.neoplus.adsl.tpnet.pl. [83.28.79.193])
        by smtp.gmail.com with ESMTPSA id o76sm1838346lfo.7.2019.05.10.11.19.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 May 2019 11:19:55 -0700 (PDT)
Subject: Re: [PATCH leds-next RFC 1/1] led: triggers: add HW LED triggers
 functionality
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
References: <20190502005447.11919-1-marek.behun@nic.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <efdbfcb3-f484-bd83-7830-82df291384a3@gmail.com>
Date:   Fri, 10 May 2019 20:19:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502005447.11919-1-marek.behun@nic.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Marek,

Thank you for the proposal.

I wonder what will be the gain of having hw triggers incorporated
into LED trigger mechanism, if they are meant not be generic
by design? Only the LED class driver exposing a hw trigger
will know how to set it up, and will define protocol via which
the settings will be passed from sysfs to the trigger (const char*
parameter in the hw_trigger_set() op).

And it has to be that way because hardware triggers are hardware
specific. LED class driver will have to create trigger specific
sysfs files regardless of whether they are to be shown on
trigger avtivation, or will persist for the whole LED class device
lifetime.

Maybe I'm missing some vital details from the previous discussions,
but this is what's come to my mind now, after analyzing the proposed
design.

The question is: what problem we solve by exposing non-generic
hw trigger, whose implementation will be in the driver anyway,
instead of just bypassing the trigger mechanism and exposing
the required interface directly?

Best regards,
Jacek Anaszewski

On 5/2/19 2:54 AM, Marek Behún wrote:
> This patch adds HW LED triggering functionality.
> 
> HW triggers can be selected by the same sysfs file as regular triggers,
> /sys/class/leds/<led>/trigger, the difference is that HW triggers names
> are prefixed with "hw:".
> 
> Reading sysfs trigger file returns available HW triggers at the end of
> the list.
> 
> Each LED class device can have different HW triggers available,
> therefore this commit changes the sysfs trigger API in such a way that
> for different LED class devices reading the trigger file can return
> different results.
> 
> Internally the code works by adding three properties to struct
> led_classdev:
>    const char * const *available_hw_triggers;
>      this is a NULL-terminated list of available HW triggers for this LED
>      class device
> 
>    const char *hw_trigger;
>      currently selected HW trigger
> 
>    int (*hw_trigger_set)(struct led_classdev *, const char *);
>      pointer to a function by which HW trigger can be set
> 
> These properties must be set by the LED driver when registering LEDs,
> if the driver wants to support HW triggering.
> 
> HW triggers are internally represented as strings, not as objects of
> struct led_trigger or something like that. Because HW LED triggering is
> only enabled if CONFIG_LEDS_HW_TRIGGERS is, and most of the changes are
> in led-triggers.c file, this file has now several #ifdefs inside
> function code. Should this be moved into one #ifdef by using static
> inline functions and callbacks?
> 
> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> ---
>   drivers/leds/Kconfig        |   8 ++
>   drivers/leds/led-triggers.c | 165 +++++++++++++++++++++++++++++++-----
>   include/linux/leds.h        |  18 ++++
>   3 files changed, 170 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index f3000ccb8d35..85637e073de7 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -780,4 +780,12 @@ config LEDS_NIC78BX
>   comment "LED Triggers"
>   source "drivers/leds/trigger/Kconfig"
>   
> +config LEDS_HW_TRIGGERS
> +	bool "LED Hardware Trigger support"
> +	depends on LEDS_TRIGGERS
> +	help
> +	  This option enables hardware LED triggers. Some devices have LEDs
> +	  wired to hardware which has outputs dedicated to LED control, for
> +	  example network PHYs.
> +
>   endif # NEW_LEDS
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index 2d451b6c24af..ca555f2118ce 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -30,6 +30,11 @@ LIST_HEAD(trigger_list);
>   
>    /* Used by LED Class */
>   
> +#ifdef CONFIG_LEDS_HW_TRIGGERS
> +static int led_hw_trigger_set(struct led_classdev *led_cdev,
> +			      const char *hwtrig);
> +#endif
> +
>   ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
>   		const char *buf, size_t count)
>   {
> @@ -49,6 +54,29 @@ ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
>   		goto unlock;
>   	}
>   
> +#ifdef CONFIG_LEDS_HW_TRIGGERS
> +	/* check if a hardware LED trigger was selected */
> +	if (!strncmp(buf, "hw:", 3)) {
> +		const char * const *hwtrig;
> +
> +		if (!led_cdev->hw_triggers) {
> +			ret = -EINVAL;
> +			goto unlock;
> +		}
> +
> +		for (hwtrig = led_cdev->available_hw_triggers;
> +		     *hwtrig; ++hwtrig) {
> +			/* skip "hw:" in comparison */
> +			if (sysfs_streq(buf + 3, hwtrig)) {
> +				down_write(&led_cdev->trigger_lock);
> +				ret = led_hw_trigger_set(led_cdev, buf);
> +				up_write(&led_cdev->trigger_lock);
> +				goto unlock;
> +			}
> +		}
> +	}
> +#endif
> +
>   	down_read(&triggers_list_lock);
>   	list_for_each_entry(trig, &trigger_list, next_trig) {
>   		if (sysfs_streq(buf, trig->name)) {
> @@ -70,21 +98,33 @@ ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
>   }
>   EXPORT_SYMBOL_GPL(led_trigger_store);
>   
> +static bool _led_has_trigger_set(struct led_classdev *led_cdev)
> +{
> +#ifdef CONFIG_LEDS_HW_TRIGGERS
> +	return !!led_cdev->trigger || !!led_cdev->hw_trigger;
> +#else
> +	return !!led_cdev->trigger;
> +#endif
> +}
> +
>   ssize_t led_trigger_show(struct device *dev, struct device_attribute *attr,
>   		char *buf)
>   {
>   	struct led_classdev *led_cdev = dev_get_drvdata(dev);
>   	struct led_trigger *trig;
> +#ifdef CONFIG_LEDS_HW_TRIGGERS
> +	const char * const *hwtrig;
> +#endif
>   	int len = 0;
>   
>   	down_read(&triggers_list_lock);
> -	down_read(&led_cdev->trigger_lock);
>   
> -	if (!led_cdev->trigger)
> +	if (!_led_has_trigger_set(led_cdev))
>   		len += scnprintf(buf+len, PAGE_SIZE - len, "[none] ");
>   	else
>   		len += scnprintf(buf+len, PAGE_SIZE - len, "none ");
>   
> +	down_read(&led_cdev->trigger_lock);
>   	list_for_each_entry(trig, &trigger_list, next_trig) {
>   		if (led_cdev->trigger && !strcmp(led_cdev->trigger->name,
>   							trig->name))
> @@ -95,6 +135,20 @@ ssize_t led_trigger_show(struct device *dev, struct device_attribute *attr,
>   					 trig->name);
>   	}
>   	up_read(&led_cdev->trigger_lock);
> +
> +#ifdef CONFIG_LEDS_HW_TRIGGERS
> +	for (hwtrig = led_cdev->available_hw_triggers;
> +	     *hwtrig; ++hwtrig) {
> +		if (led_cdev->hw_trigger && !strcmp(led_cdev->hw_trigger,
> +						    hwtrig))
> +			len += scnprintf(buf+len, PAGE_SIZE - len, "[hw:%s] ",
> +					 hwtrig);
> +		else
> +			len += scnprintf(buf+len, PAGE_SIZE - len, "hw:%s ",
> +					 hwtrig);
> +	}
> +#endif
> +
>   	up_read(&triggers_list_lock);
>   
>   	len += scnprintf(len+buf, PAGE_SIZE - len, "\n");
> @@ -102,22 +156,24 @@ ssize_t led_trigger_show(struct device *dev, struct device_attribute *attr,
>   }
>   EXPORT_SYMBOL_GPL(led_trigger_show);
>   
> -/* Caller must ensure led_cdev->trigger_lock held */
> -int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
> +/* removes any existing trigger or HW trigger */
> +static int _led_trigger_remove((struct led_classdev *led_cdev)
>   {
>   	unsigned long flags;
> -	char *event = NULL;
> -	char *envp[2];
> -	const char *name;
>   	int ret;
>   
> -	if (!led_cdev->trigger && !trig)
> -		return 0;
> -
> -	name = trig ? trig->name : "none";
> -	event = kasprintf(GFP_KERNEL, "TRIGGER=%s", name);
> +#ifdef CONFIG_LEDS_HW_TRIGGERS
> +	if (led_cdev->hw_trigger) {
> +		ret = led_cdev->hw_trigger_set(led_cdev, NULL);
> +		if (ret < 0) {
> +			dev_err(led_cdev->dev, "Failed to unset HW trigger!\n");
> +			return ret;
> +		}
>   
> -	/* Remove any existing trigger */
> +		kfree(led_cdev->hw_trigger);
> +		led_cdev->hw_trigger = NULL;
> +	} else
> +#endif
>   	if (led_cdev->trigger) {
>   		write_lock_irqsave(&led_cdev->trigger->leddev_list_lock, flags);
>   		list_del(&led_cdev->trig_list);
> @@ -133,6 +189,73 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
>   		led_cdev->activated = false;
>   		led_set_brightness(led_cdev, LED_OFF);
>   	}
> +
> +	return 0;
> +}
> +
> +static void _led_trigger_event(struct led_classdev *led_cdev, const char *name)
> +{
> +	char *event = NULL;
> +	char *envp[2];
> +
> +	event = kasprintf(GFP_KERNEL, "TRIGGER=%s", name);
> +
> +	if (event) {
> +		envp[0] = event;
> +		envp[1] = NULL;
> +		if (kobject_uevent_env(&led_cdev->dev->kobj, KOBJ_CHANGE, envp))
> +			dev_err(led_cdev->dev,
> +				"%s: Error sending uevent\n", __func__);
> +		kfree(event);
> +	}
> +}
> +
> +#ifdef CONFIG_LEDS_HW_TRIGGERS
> +/*
> + * Sets HW trigger of @led_cdev to @hwtrig.
> + * @hwtrig must be non-null and prefixed by "hw:".
> + * Caller must ensure led_cdev->trigger_lock held.
> + * To remove HW trigger use led_trigger_remove.
> + */
> +static int led_hw_trigger_set(struct led_classdev *led_cdev, const char *hwtrig)
> +{
> +	int ret;
> +	const char *trig;
> +
> +	/* skip "hw:" */
> +	trig = hwtrig + 3;
> +
> +	/* Remove any existing trigger */
> +	ret = _led_trigger_remove(led_cdev))
> +	if (ret)
> +		return ret;
> +
> +	ret = led_cdev->hw_trigger_set(led_cdev, trig);
> +	if (ret)
> +		return ret;
> +
> +	led_cdev->hw_trigger = kstrdup_const(trig, GFP_KERNEL);
> +
> +	_led_trigger_event(led_cdev, hwtrig);
> +
> +	return 0;
> +}
> +#endif
> +
> +/* Caller must ensure led_cdev->trigger_lock held */
> +int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
> +{
> +	unsigned long flags;
> +	int ret;
> +
> +	if (!_led_has_trigger_set(led_cdev) && !trig)
> +		return 0;
> +
> +	/* Remove any existing trigger */
> +	ret = _led_trigger_remove(led_cdev);
> +	if (ret)
> +		return ret;
> +
>   	if (trig) {
>   		write_lock_irqsave(&trig->leddev_list_lock, flags);
>   		list_add_tail(&led_cdev->trig_list, &trig->led_cdevs);
> @@ -154,14 +277,7 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
>   		}
>   	}
>   
> -	if (event) {
> -		envp[0] = event;
> -		envp[1] = NULL;
> -		if (kobject_uevent_env(&led_cdev->dev->kobj, KOBJ_CHANGE, envp))
> -			dev_err(led_cdev->dev,
> -				"%s: Error sending uevent\n", __func__);
> -		kfree(event);
> -	}
> +	_led_trigger_event(led_cdev, trig ? trig->name : "none");
>   
>   	return 0;
>   
> @@ -216,6 +332,9 @@ void led_trigger_rename_static(const char *name, struct led_trigger *trig)
>   	/* new name must be on a temporary string to prevent races */
>   	BUG_ON(name == trig->name);
>   
> +	/* trigger name beginning with "hw:" is reserved for HW triggers */
> +	BUG_ON(!strncmp(name, "hw:", 3));
> +
>   	down_write(&triggers_list_lock);
>   	/* this assumes that trig->name was originaly allocated to
>   	 * non constant storage */
> @@ -231,6 +350,10 @@ int led_trigger_register(struct led_trigger *trig)
>   	struct led_classdev *led_cdev;
>   	struct led_trigger *_trig;
>   
> +	/* trigger name beginning with "hw:" is reserved for HW triggers */
> +	if (!strncmp(trig->name, "hw:", 3))
> +		return -EINVAL;
> +
>   	rwlock_init(&trig->leddev_list_lock);
>   	INIT_LIST_HEAD(&trig->led_cdevs);
>   
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 78204650fe2a..df500b85e945 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -118,6 +118,13 @@ struct led_classdev {
>   	void			*trigger_data;
>   	/* true if activated - deactivate routine uses it to do cleanup */
>   	bool			activated;
> +
> +#ifdef CONFIG_LEDS_HW_TRIGGERS
> +	const char		*hw_trigger;
> +	int			(*hw_trigger_set)(struct led_classdev *led_cdev,
> +						  const char *trigger);
> +	const char * const	*available_hw_triggers;
> +#endif
>   #endif
>   
>   #ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
> @@ -129,6 +136,17 @@ struct led_classdev {
>   	struct mutex		led_access;
>   };
>   
> +#ifdef CONFIG_LEDS_TRIGGERS
> +static inline bool _led_has_trigger_set(struct led_classdev *led_cdev)
> +{
> +#ifdef CONFIG_LEDS_HW_TRIGGERS
> +	return !!led_cdev->trigger || !!led_cdev->hw_trigger;
> +#else
> +	return !!led_cdev->trigger;
> +#endif
> +}
> +#endif
> +
>   extern int of_led_classdev_register(struct device *parent,
>   				    struct device_node *np,
>   				    struct led_classdev *led_cdev);
> 
