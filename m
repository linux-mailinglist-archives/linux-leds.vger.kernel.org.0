Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D83FB6B0AF
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jul 2019 22:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388756AbfGPU6B (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Jul 2019 16:58:01 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39939 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728575AbfGPU6B (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 16 Jul 2019 16:58:01 -0400
Received: by mail-wr1-f68.google.com with SMTP id r1so22391737wrl.7;
        Tue, 16 Jul 2019 13:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Vj1yKcrOw7MzUHsBldLA6/A7pqcsUZuhfBnAzkgFtaY=;
        b=OtmKObDL5ypu+BN7i8Eg2aqn99K4ri251Wh3NXG9JQIhp/4zjm4PGN9y1qCYzzZBp3
         RmFq6U2ELyGP6ZBj3jv16wpKfVTDO1ne4Mr0uq/wITemn21Tx6BwCqIX8iXIIMOHT2Xt
         yII98dhvlLsWViJ2igRov14ETHA4CAUnc85nuqUQJTVnPnN+YSgwgBFT950DsNmf/Voc
         T6kJSj4DyA7ooiJT3wgVQ+Jfhunjfpv/5YJhNX6godtolVtp1frVtZwWd4CkGAQYZjqJ
         803/dc1dwtii2ep6tFaZDCJFGs+F0qddHyjb8Q/m9wB/+XZ1Wi/95cwAAi9RYLwx/ADd
         TMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Vj1yKcrOw7MzUHsBldLA6/A7pqcsUZuhfBnAzkgFtaY=;
        b=ECkrh1ZlWd0M5v0JWdNXggFzurWxtIyaPA2AzyxanHsi6S6K0nTQbXeDjFm4l8HMfi
         xUQHV80m/k0cqEGnl+K3zuY8Gasy7JNP6W6LrfHMz/dGSV0/dtr+PNlfu1ftNw1/8r6l
         igXwPZAVfXe3LUXoyEXGc4HhA3yOQG2G3ajzckuh4eZ+dIfxHFkLDwh2RyIN3odeyna0
         9rPAuWTyc+SB3yGE1f8DQoueBxS+IJXGnLKmkoCYonpqx0pSahI3Vvsq+LwW8q9pW6eo
         5KUV/DCOB+V7eTufKKF4aY4/NVb7xR0N2ZlgmyeNM4IRj4WqWZtjXmChwNeb93v7i1hp
         ZmBQ==
X-Gm-Message-State: APjAAAUmZPTJXLWF5kDLVIAbTcYpjX1xACazjFaXcOchfRdZYdQuYLn5
        S4utDnBSeaLXYlgjD+ZXYxw=
X-Google-Smtp-Source: APXvYqzV2M5Q5EjaoGfP6jVPew/ygyrFwtkcOke1fh7NPX4wopPltCYtuDm03rxfxceNUhQE8OP16Q==
X-Received: by 2002:adf:ed04:: with SMTP id a4mr35249849wro.86.1563310677477;
        Tue, 16 Jul 2019 13:57:57 -0700 (PDT)
Received: from [192.168.1.19] (chm81.neoplus.adsl.tpnet.pl. [83.31.10.81])
        by smtp.gmail.com with ESMTPSA id y6sm15520649wrp.12.2019.07.16.13.57.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 13:57:56 -0700 (PDT)
Subject: Re: [PATCH 2/2] block: introduce LED block device activity trigger
To:     Akinobu Mita <akinobu.mita@gmail.com>, linux-block@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-nvme@lists.infradead.org
Cc:     Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jens Axboe <axboe@kernel.dk>
References: <1562435939-15466-1-git-send-email-akinobu.mita@gmail.com>
 <1562435939-15466-3-git-send-email-akinobu.mita@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 mQINBFWjfaEBEADd66EQbd6yd8YjG0kbEDT2QIkx8C7BqMXR8AdmA1OMApbfSvEZFT1D/ECR
 eWFBS8XtApKQx1xAs1j5z70k3zebk2eeNs5ahxi6vM4Qh89vBM46biSKeeX5fLcv7asmGb/a
 FnHPAfQaKFyG/Bj9V+//ef67hpjJWR3s74C6LZCFLcbZM0z/wTH+baA5Jwcnqr4h/ygosvhP
 X3gkRzJLSFYekmEv+WHieeKXLrJdsUPUvPJTZtvi3ELUxHNOZwX2oRJStWpmL2QGMwPokRNQ
 29GvnueQdQrIl2ylhul6TSrClMrKZqOajDFng7TLgvNfyVZE8WQwmrkTrdzBLfu3kScjE14Q
 Volq8OtQpTsw5570D4plVKh2ahlhrwXdneSot0STk9Dh1grEB/Jfw8dknvqkdjALUrrM45eF
 FM4FSMxIlNV8WxueHDss9vXRbCUxzGw37Ck9JWYo0EpcpcvwPf33yntYCbnt+RQRjv7vy3w5
 osVwRR4hpbL/fWt1AnZ+RvbP4kYSptOCPQ+Pp1tCw16BOaPjtlqSTcrlD2fo2IbaB5D21SUa
 IsdZ/XkD+V2S9jCrN1yyK2iKgxtDoUkWiqlfRgH2Ep1tZtb4NLF/S0oCr7rNLO7WbqLZQh1q
 ShfZR16h7YW//1/NFwnyCVaG1CP/L/io719dPWgEd/sVSKT2TwARAQABtC1KYWNlayBBbmFz
 emV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT6JAj4EEwEIACgCGwMHCwkIBwMC
 AQYVCAIJCgsDFgIBAh4BAheABQJVo39tBQkJZgNMAAoJEL1qUBy3i3wmxLQQAK8QEQ0JqZEv
 5hrxiwT+Qtkx1TULYriK9sYcY9zbi18YxbKB0C4Znh5iP5o7k26WnPGLM+w4qWvTAkHjuAI7
 aBrvb4nGRvE5s14PQ9IHgL7iL3zAAHT1azIZng9dUCCSontB+vQZu1x/Un0lVlVCvsvO7QVt
 hAZUlT3iucNMO0jpCiS3raZkNfab8M+JWP/iplaV0Kn+O7LX3A/RdLmx5ZhuT+zvyHwl2c3K
 T56UHaQnjkuHB2Ytk8HtOjNXGNYnm4nLx3ok3jEN1nWDRV/DeiPn8zz4Zebsp686OH9vvX/0
 R4dk2YEjUCY/S7CbJxXzUnLjboUAGmtTVOu/uJ7y11iS9XEoJ09HEzijQwWctJXLojcTXCFw
 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
 eGGiEQ==
Message-ID: <89262967-667f-80cc-0fd5-ba480e879fe0@gmail.com>
Date:   Tue, 16 Jul 2019 22:57:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1562435939-15466-3-git-send-email-akinobu.mita@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Akinobu,

Thank you for the patch set. It looks nice in general, but I'd like
to maintain it under LED subsystem. See my below comments.

On 7/6/19 7:58 PM, Akinobu Mita wrote:
> This allows LEDs to be controlled by block device activity.
> 
> We already have ledtrig-disk (LED disk activity trigger), but the lower
> level disk drivers need to utilize ledtrig_disk_activity() to make the
> LED blink.
> 
> The LED block device trigger doesn't require the lower level drivers to
> have any instrumentation. The activity is collected by polling the disk
> stats.
> 
> Example:
> 
> echo block-nvme0n1 > /sys/class/leds/diy/trigger
> 
> Cc: Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: Jens Axboe <axboe@kernel.dk>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> ---
>  block/Makefile        |   1 +
>  block/blk-ledtrig.c   | 219 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  block/blk.h           |  13 +++
>  block/genhd.c         |   2 +
>  include/linux/genhd.h |   4 +
>  5 files changed, 239 insertions(+)
>  create mode 100644 block/blk-ledtrig.c
> 
> diff --git a/block/Makefile b/block/Makefile
> index eee1b4c..c74d84e6 100644
> --- a/block/Makefile
> +++ b/block/Makefile
> @@ -35,3 +35,4 @@ obj-$(CONFIG_BLK_DEBUG_FS)	+= blk-mq-debugfs.o
>  obj-$(CONFIG_BLK_DEBUG_FS_ZONED)+= blk-mq-debugfs-zoned.o
>  obj-$(CONFIG_BLK_SED_OPAL)	+= sed-opal.o
>  obj-$(CONFIG_BLK_PM)		+= blk-pm.o
> +obj-$(CONFIG_LEDS_TRIGGERS)	+= blk-ledtrig.o
> diff --git a/block/blk-ledtrig.c b/block/blk-ledtrig.c

Please move the whole trigger implementation to
drivers/leds/trigger and rename the file to ledtrig-blk.c

> new file mode 100644
> index 0000000..da93b06
> --- /dev/null
> +++ b/block/blk-ledtrig.c
> @@ -0,0 +1,219 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// LED Kernel Blockdev Trigger
> +// Derived from ledtrig-netdev.c
> +
> +#include <linux/atomic.h>
> +#include <linux/genhd.h>
> +#include <linux/leds.h>
> +#include <linux/workqueue.h>
> +
> +struct blk_ledtrig_data {
> +	struct delayed_work work;
> +	struct led_classdev *led_cdev;
> +
> +	atomic_t interval;
> +	u64 last_activity;
> +
> +	unsigned long mode;
> +#define BLK_LEDTRIG_READ BIT(0)
> +#define BLK_LEDTRIG_WRITE BIT(1)
> +#define BLK_LEDTRIG_DISCARD BIT(2)

s/BLK_LEDTRIG/LEDTRIG_BLK/

> +};
> +
> +static ssize_t blk_ledtrig_attr_show(struct device *dev, char *buf,
> +				     unsigned long blk_ledtrig)
> +{
> +	struct blk_ledtrig_data *trig_data = led_trigger_get_drvdata(dev);
> +
> +	return sprintf(buf, "%u\n", test_bit(blk_ledtrig, &trig_data->mode));
> +}
> +
> +static ssize_t blk_ledtrig_attr_store(struct device *dev, const char *buf,
> +				      size_t size, unsigned long blk_ledtrig)
> +{
> +	struct blk_ledtrig_data *trig_data = led_trigger_get_drvdata(dev);
> +	unsigned long state;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 0, &state);
> +	if (ret)
> +		return ret;
> +
> +	if (state)
> +		set_bit(blk_ledtrig, &trig_data->mode);
> +	else
> +		clear_bit(blk_ledtrig, &trig_data->mode);
> +
> +	return size;
> +}
> +
> +static ssize_t read_show(struct device *dev, struct device_attribute *attr,
> +			 char *buf)
> +{
> +	return blk_ledtrig_attr_show(dev, buf, BLK_LEDTRIG_READ);
> +}
> +static ssize_t read_store(struct device *dev, struct device_attribute *attr,
> +			  const char *buf, size_t size)
> +{
> +	return blk_ledtrig_attr_store(dev, buf, size, BLK_LEDTRIG_READ);
> +}
> +static DEVICE_ATTR_RW(read);
> +
> +static ssize_t write_show(struct device *dev, struct device_attribute *attr,
> +			  char *buf)
> +{
> +	return blk_ledtrig_attr_show(dev, buf, BLK_LEDTRIG_WRITE);
> +}
> +static ssize_t write_store(struct device *dev, struct device_attribute *attr,
> +			   const char *buf, size_t size)
> +{
> +	return blk_ledtrig_attr_store(dev, buf, size, BLK_LEDTRIG_WRITE);
> +}
> +static DEVICE_ATTR_RW(write);
> +
> +static ssize_t discard_show(struct device *dev, struct device_attribute *attr,
> +			    char *buf)
> +{
> +	return blk_ledtrig_attr_show(dev, buf, BLK_LEDTRIG_DISCARD);
> +}
> +static ssize_t discard_store(struct device *dev, struct device_attribute *attr,
> +			     const char *buf, size_t size)
> +{
> +	return blk_ledtrig_attr_store(dev, buf, size, BLK_LEDTRIG_DISCARD);
> +}
> +static DEVICE_ATTR_RW(discard);
> +
> +static ssize_t interval_show(struct device *dev, struct device_attribute *attr,
> +			     char *buf)
> +{
> +	struct blk_ledtrig_data *trig_data = led_trigger_get_drvdata(dev);
> +
> +	return sprintf(buf, "%u\n",
> +		       jiffies_to_msecs(atomic_read(&trig_data->interval)));
> +}
> +static ssize_t interval_store(struct device *dev, struct device_attribute *attr,
> +			      const char *buf, size_t size)
> +{
> +	struct blk_ledtrig_data *trig_data = led_trigger_get_drvdata(dev);
> +	unsigned long value;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 0, &value);
> +	if (ret)
> +		return ret;
> +
> +	/* impose some basic bounds on the timer interval */
> +	if (value >= 5 && value <= 10000) {
> +		cancel_delayed_work_sync(&trig_data->work);
> +		atomic_set(&trig_data->interval, msecs_to_jiffies(value));
> +		schedule_delayed_work(&trig_data->work,
> +				      atomic_read(&trig_data->interval) * 2);
> +	}
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(interval);
> +
> +static struct attribute *blk_ledtrig_attrs[] = {
> +	&dev_attr_read.attr,
> +	&dev_attr_write.attr,
> +	&dev_attr_discard.attr,
> +	&dev_attr_interval.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(blk_ledtrig);
> +
> +static void blk_ledtrig_work(struct work_struct *work)
> +{
> +	struct blk_ledtrig_data *trig_data =
> +		container_of(work, struct blk_ledtrig_data, work.work);
> +	struct gendisk *disk = container_of(trig_data->led_cdev->trigger,
> +					    struct gendisk, led_trig);
> +	u64 activity = 0;
> +
> +	if (test_bit(BLK_LEDTRIG_READ, &trig_data->mode))
> +		activity += part_stat_read(&disk->part0, ios[STAT_READ]);
> +	if (test_bit(BLK_LEDTRIG_WRITE, &trig_data->mode))
> +		activity += part_stat_read(&disk->part0, ios[STAT_WRITE]);
> +	if (test_bit(BLK_LEDTRIG_DISCARD, &trig_data->mode))
> +		activity += part_stat_read(&disk->part0, ios[STAT_DISCARD]);
> +
> +	if (trig_data->last_activity != activity) {
> +		unsigned long interval;
> +
> +		led_stop_software_blink(trig_data->led_cdev);
> +		interval = jiffies_to_msecs(atomic_read(&trig_data->interval));
> +		led_blink_set_oneshot(trig_data->led_cdev, &interval, &interval,
> +				      0);
> +
> +		trig_data->last_activity = activity;
> +	}
> +
> +	schedule_delayed_work(&trig_data->work,
> +			      atomic_read(&trig_data->interval) * 2);
> +}
> +
> +static int blk_ledtrig_activate(struct led_classdev *led_cdev)
> +{
> +	struct blk_ledtrig_data *trig_data;
> +
> +	trig_data = kzalloc(sizeof(*trig_data), GFP_KERNEL);
> +	if (!trig_data)
> +		return -ENOMEM;
> +
> +	trig_data->mode = BLK_LEDTRIG_READ | BLK_LEDTRIG_WRITE |
> +			  BLK_LEDTRIG_DISCARD;
> +
> +	atomic_set(&trig_data->interval, msecs_to_jiffies(50));
> +	trig_data->last_activity = 0;
> +	trig_data->led_cdev = led_cdev;
> +
> +	INIT_DELAYED_WORK(&trig_data->work, blk_ledtrig_work);
> +
> +	led_set_trigger_data(led_cdev, trig_data);
> +
> +	schedule_delayed_work(&trig_data->work,
> +			      atomic_read(&trig_data->interval) * 2);
> +
> +	return 0;
> +}
> +
> +static void blk_ledtrig_deactivate(struct led_classdev *led_cdev)
> +{
> +	struct blk_ledtrig_data *trig_data = led_get_trigger_data(led_cdev);
> +
> +	cancel_delayed_work_sync(&trig_data->work);
> +	kfree(trig_data);
> +}
> +
> +int blk_ledtrig_register(struct gendisk *disk)
> +{
> +	int ret;
> +
> +	disk->led_trig.name = kasprintf(GFP_KERNEL, "block-%s",
> +					disk->disk_name);
> +	if (!disk->led_trig.name)
> +		return -ENOMEM;
> +
> +	disk->led_trig.activate = blk_ledtrig_activate;
> +	disk->led_trig.deactivate = blk_ledtrig_deactivate;
> +	disk->led_trig.groups = blk_ledtrig_groups;
> +
> +	ret = led_trigger_register(&disk->led_trig);
> +	if (ret) {
> +		kfree(disk->led_trig.name);
> +		disk->led_trig.name = NULL;
> +	}
> +
> +	return ret;
> +}
> +
> +void blk_ledtrig_unregister(struct gendisk *disk)
> +{
> +	if (!disk->led_trig.name)
> +		return;
> +
> +	led_trigger_unregister(&disk->led_trig);
> +	kfree(disk->led_trig.name);
> +	disk->led_trig.name = NULL;
> +}
> diff --git a/block/blk.h b/block/blk.h
> index 7814aa2..dd4c230a 100644
> --- a/block/blk.h
> +++ b/block/blk.h
> @@ -331,4 +331,17 @@ void blk_queue_free_zone_bitmaps(struct request_queue *q);
>  static inline void blk_queue_free_zone_bitmaps(struct request_queue *q) {}
>  #endif
>  
> +#ifdef CONFIG_LEDS_TRIGGERS
> +int blk_ledtrig_register(struct gendisk *disk);
> +void blk_ledtrig_unregister(struct gendisk *disk);
> +#else
> +static inline int blk_ledtrig_register(struct gendisk *disk)
> +{
> +	return 0;
> +}
> +static inline void blk_ledtrig_unregister(struct gendisk *disk)
> +{
> +}
> +#endif /* CONFIG_LEDS_TRIGGERS */

Please move this part to include/linux/leds.h, next to the other
triggers' facilities.

>  #endif /* BLK_INTERNAL_H */
> diff --git a/block/genhd.c b/block/genhd.c
> index 24654e1..dfd210c 100644
> --- a/block/genhd.c
> +++ b/block/genhd.c
> @@ -745,6 +745,7 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
>  
>  	disk_add_events(disk);
>  	blk_integrity_add(disk);
> +	blk_ledtrig_register(disk);
>  }
>  
>  void device_add_disk(struct device *parent, struct gendisk *disk,
> @@ -766,6 +767,7 @@ void del_gendisk(struct gendisk *disk)
>  	struct disk_part_iter piter;
>  	struct hd_struct *part;
>  
> +	blk_ledtrig_unregister(disk);
>  	blk_integrity_del(disk);
>  	disk_del_events(disk);
>  
> diff --git a/include/linux/genhd.h b/include/linux/genhd.h
> index 8b5330d..9250e9c 100644
> --- a/include/linux/genhd.h
> +++ b/include/linux/genhd.h
> @@ -17,6 +17,7 @@
>  #include <linux/percpu-refcount.h>
>  #include <linux/uuid.h>
>  #include <linux/blk_types.h>
> +#include <linux/leds.h>
>  #include <asm/local.h>
>  
>  #ifdef CONFIG_BLOCK
> @@ -219,6 +220,9 @@ struct gendisk {
>  	int node_id;
>  	struct badblocks *bb;
>  	struct lockdep_map lockdep_map;
> +#ifdef CONFIG_LEDS_TRIGGERS
> +	struct led_trigger led_trig;
> +#endif
>  };
>  
>  static inline struct gendisk *part_to_disk(struct hd_struct *part)
> 

-- 
Best regards,
Jacek Anaszewski
