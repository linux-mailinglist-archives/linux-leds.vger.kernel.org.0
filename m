Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2389FBD45A
	for <lists+linux-leds@lfdr.de>; Tue, 24 Sep 2019 23:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731710AbfIXVaP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Sep 2019 17:30:15 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37512 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728980AbfIXVaP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 Sep 2019 17:30:15 -0400
Received: by mail-wr1-f68.google.com with SMTP id i1so3719171wro.4;
        Tue, 24 Sep 2019 14:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E7Mha1NoRjN8EbkILeu/xMHK3yWGNSQvglgYQtw7CH8=;
        b=cc/0dNMj4Be0MuGC4RrWPQoxP7vRn5GJktrvs5aSiiNSq4KvFWsviGHNVEHUj/Uznm
         c/Ku5Q+gWZyPSHt7EnrNWhYNhqUGgkfLMfMo9HBPPqAO+KuPfj1n3ONyhZCR77ji+an1
         iXp704bRR+CqGkuaFE7JipilteLn7TEboM5Z3maHJ/trXpR+tYbSlLwxv2oYnt6OCkda
         G14MOfU0tCa2uaEdjUUONcZODXdMWr9euHrBIKbZehKkbLEzY54V4UqecsTb84xCTjlO
         bWN9tGM1Uc6b1nefdfrEoBVh2Aa4Wo4raoLc4ImgH//wILrqkujiYjlQUOXSR93f5loW
         bmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=E7Mha1NoRjN8EbkILeu/xMHK3yWGNSQvglgYQtw7CH8=;
        b=mUP/h6ZwjAphTr+Jw7oJG8gLbJG2eWwfn/GzLQJ2cUTcDNFmerm2elqNgiGi5I9akQ
         n5DKfH5gMi/Vojtqi6/c1KBsykjaqphCXNahEYaOgVdWug/uT4tUC2qwqdj1QlVwcPlb
         6MkttJ8IYHMbiEdhdPSw8N+CwigCvRp7t6MBP1mDXP5ALF1fbNJlKtqQuNHKBuAXE1wF
         RlIyqAE+NGnBJOQx1SnkPshPwNo3q6EQ8bLVH8RNGiN3Oi9x15i+jERaiWeqGwQ7jixa
         6Jgz0L0caDFUIAvn3l8jEihruMbOzrwHzSdQ9bo9jk94toVzcsB1aHcrLGFFBdO7pr9t
         oPSQ==
X-Gm-Message-State: APjAAAVwwTgAEcUWPxxvvVpEr41gVoW6qjgiTiaTDix2YG8sVZufkinX
        inGMrJRyiZpvL/Yd2eBBrGbKKLlv
X-Google-Smtp-Source: APXvYqwSu3nlN1qniQ7awiMez5TCRjXkCdPmoVmS1w0aUl94O0OCUuEfdjoqa8ntpQvNbNB/fjbCRw==
X-Received: by 2002:a5d:408c:: with SMTP id o12mr4988616wrp.312.1569360611138;
        Tue, 24 Sep 2019 14:30:11 -0700 (PDT)
Received: from [192.168.1.19] (bfw157.neoplus.adsl.tpnet.pl. [83.28.60.157])
        by smtp.gmail.com with ESMTPSA id a3sm2053981wmc.3.2019.09.24.14.30.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 14:30:10 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] leds: remove PAGE_SIZE limit of
 /sys/class/leds/<led>/trigger
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Akinobu Mita <akinobu.mita@gmail.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
References: <1568387004-3802-1-git-send-email-akinobu.mita@gmail.com>
 <1568387004-3802-2-git-send-email-akinobu.mita@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <54d4debc-470a-86f6-e43c-f51f1c7913e0@gmail.com>
Date:   Tue, 24 Sep 2019 23:30:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1568387004-3802-2-git-send-email-akinobu.mita@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Greg,

Akinobu seems to have addressed all issues that have been
raised regarding this patch. I'd be happy to have your ack before
applying it.

Best regards,
Jacek Anaszewski

On 9/13/19 5:03 PM, Akinobu Mita wrote:
> Reading /sys/class/leds/<led>/trigger returns all available LED triggers.
> However, the size of this file is limited to PAGE_SIZE because of the
> limitation for sysfs attribute.
> 
> Enabling LED CPU trigger on systems with thousands of CPUs easily hits
> PAGE_SIZE limit, and makes it impossible to see all available LED triggers
> and which trigger is currently activated.
> 
> We work around it here by converting /sys/class/leds/<led>/trigger to
> binary attribute, which is not limited by length. This is _not_ good
> design, do not copy it.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> ---
>  drivers/leds/led-class.c    |  8 ++--
>  drivers/leds/led-triggers.c | 90 ++++++++++++++++++++++++++++++++++-----------
>  drivers/leds/leds.h         |  6 +++
>  include/linux/leds.h        |  5 ---
>  4 files changed, 79 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 4793e77..8b5a1d1 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -73,13 +73,13 @@ static ssize_t max_brightness_show(struct device *dev,
>  static DEVICE_ATTR_RO(max_brightness);
>  
>  #ifdef CONFIG_LEDS_TRIGGERS
> -static DEVICE_ATTR(trigger, 0644, led_trigger_show, led_trigger_store);
> -static struct attribute *led_trigger_attrs[] = {
> -	&dev_attr_trigger.attr,
> +static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);
> +static struct bin_attribute *led_trigger_bin_attrs[] = {
> +	&bin_attr_trigger,
>  	NULL,
>  };
>  static const struct attribute_group led_trigger_group = {
> -	.attrs = led_trigger_attrs,
> +	.bin_attrs = led_trigger_bin_attrs,
>  };
>  #endif
>  
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index 8d11a5e..ed5a311 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -16,6 +16,7 @@
>  #include <linux/rwsem.h>
>  #include <linux/leds.h>
>  #include <linux/slab.h>
> +#include <linux/mm.h>
>  #include "leds.h"
>  
>  /*
> @@ -26,9 +27,11 @@ LIST_HEAD(trigger_list);
>  
>   /* Used by LED Class */
>  
> -ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
> -		const char *buf, size_t count)
> +ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
> +			  struct bin_attribute *bin_attr, char *buf,
> +			  loff_t pos, size_t count)
>  {
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct led_classdev *led_cdev = dev_get_drvdata(dev);
>  	struct led_trigger *trig;
>  	int ret = count;
> @@ -64,39 +67,84 @@ ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
>  	mutex_unlock(&led_cdev->led_access);
>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(led_trigger_store);
> +EXPORT_SYMBOL_GPL(led_trigger_write);
>  
> -ssize_t led_trigger_show(struct device *dev, struct device_attribute *attr,
> -		char *buf)
> +__printf(4, 5)
> +static int led_trigger_snprintf(char *buf, size_t size, bool query,
> +				const char *fmt, ...)
> +{
> +	va_list args;
> +	int i;
> +
> +	va_start(args, fmt);
> +	if (query)
> +		i = vsnprintf(NULL, 0, fmt, args);
> +	else
> +		i = vscnprintf(buf, size, fmt, args);
> +	va_end(args);
> +
> +	return i;
> +}
> +
> +static int led_trigger_format(char *buf, size_t size, bool query,
> +			      struct led_classdev *led_cdev)
>  {
> -	struct led_classdev *led_cdev = dev_get_drvdata(dev);
>  	struct led_trigger *trig;
> -	int len = 0;
> +	int len = led_trigger_snprintf(buf, size, query, "%s",
> +				       led_cdev->trigger ? "none" : "[none]");
> +
> +	list_for_each_entry(trig, &trigger_list, next_trig) {
> +		bool hit = led_cdev->trigger &&
> +			!strcmp(led_cdev->trigger->name, trig->name);
> +
> +		len += led_trigger_snprintf(buf + len, size - len, query,
> +					    " %s%s%s", hit ? "[" : "",
> +					    trig->name, hit ? "]" : "");
> +	}
> +
> +	len += led_trigger_snprintf(buf + len, size - len, query, "\n");
> +
> +	return len;
> +}
> +
> +/*
> + * It was stupid to create 10000 cpu triggers, but we are stuck with it now.
> + * Don't make that mistake again. We work around it here by creating binary
> + * attribute, which is not limited by length. This is _not_ good design, do not
> + * copy it.
> + */
> +ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
> +			struct bin_attribute *attr, char *buf,
> +			loff_t pos, size_t count)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	void *data;
> +	int len;
>  
>  	down_read(&triggers_list_lock);
>  	down_read(&led_cdev->trigger_lock);
>  
> -	if (!led_cdev->trigger)
> -		len += scnprintf(buf+len, PAGE_SIZE - len, "[none] ");
> +	len = led_trigger_format(NULL, 0, true, led_cdev);
> +	data = kvmalloc(len + 1, GFP_KERNEL);
> +	if (data)
> +		len = led_trigger_format(data, len + 1, false, led_cdev);
>  	else
> -		len += scnprintf(buf+len, PAGE_SIZE - len, "none ");
> +		len = -ENOMEM;
>  
> -	list_for_each_entry(trig, &trigger_list, next_trig) {
> -		if (led_cdev->trigger && !strcmp(led_cdev->trigger->name,
> -							trig->name))
> -			len += scnprintf(buf+len, PAGE_SIZE - len, "[%s] ",
> -					 trig->name);
> -		else
> -			len += scnprintf(buf+len, PAGE_SIZE - len, "%s ",
> -					 trig->name);
> -	}
>  	up_read(&led_cdev->trigger_lock);
>  	up_read(&triggers_list_lock);
>  
> -	len += scnprintf(len+buf, PAGE_SIZE - len, "\n");
> +	if (len < 0)
> +		return len;
> +
> +	len = memory_read_from_buffer(buf, count, &pos, data, len);
> +
> +	kvfree(data);
> +
>  	return len;
>  }
> -EXPORT_SYMBOL_GPL(led_trigger_show);
> +EXPORT_SYMBOL_GPL(led_trigger_read);
>  
>  /* Caller must ensure led_cdev->trigger_lock held */
>  int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
> diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
> index 47b2294..a0ee33c 100644
> --- a/drivers/leds/leds.h
> +++ b/drivers/leds/leds.h
> @@ -23,6 +23,12 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev,
>  				enum led_brightness value);
>  void led_set_brightness_nosleep(struct led_classdev *led_cdev,
>  				enum led_brightness value);
> +ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
> +			struct bin_attribute *attr, char *buf,
> +			loff_t pos, size_t count);
> +ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
> +			struct bin_attribute *bin_attr, char *buf,
> +			loff_t pos, size_t count);
>  
>  extern struct rw_semaphore leds_list_lock;
>  extern struct list_head leds_list;
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index fd2eb7c..33ae825 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -290,11 +290,6 @@ struct led_trigger {
>  #define led_trigger_get_led(dev)	((struct led_classdev *)dev_get_drvdata((dev)))
>  #define led_trigger_get_drvdata(dev)	(led_get_trigger_data(led_trigger_get_led(dev)))
>  
> -ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
> -			const char *buf, size_t count);
> -ssize_t led_trigger_show(struct device *dev, struct device_attribute *attr,
> -			char *buf);
> -
>  /* Registration functions for complex triggers */
>  extern int led_trigger_register(struct led_trigger *trigger);
>  extern void led_trigger_unregister(struct led_trigger *trigger);
> 

