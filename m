Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1223E3ECD
	for <lists+linux-leds@lfdr.de>; Mon,  9 Aug 2021 06:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbhHIEWM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Aug 2021 00:22:12 -0400
Received: from mailgw.kylinos.cn ([123.150.8.42]:3822 "EHLO nksmu.kylinos.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229483AbhHIEWM (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 9 Aug 2021 00:22:12 -0400
X-UUID: 68c7f6f2d1794d9487d91d9de1613079-20210809
X-CPASD-INFO: fc68ffb3077b4d5f849751365bdafc3c@r7NwWJOYkGNcV3mug6eAoFhlaWdlXVO
        Fd5yEkZSTX4OVhH5xTWJsXVKBfG5QZWNdYVN_eGpQYl9gZFB5i3-XblBgXoZgUZB3taVwWJaUkg==
X-CPASD-FEATURE: 0.0
X-CLOUD-ID: fc68ffb3077b4d5f849751365bdafc3c
X-CPASD-SUMMARY: SIP:-1,APTIP:-2.0,KEY:0.0,FROMBLOCK:1,EXT:0.0,OB:0.0,URL:-5,T
        VAL:137.0,ESV:0.0,ECOM:-5.0,ML:0.0,FD:0.0,CUTS:257.0,IP:-2.0,MAL:0.0,ATTNUM:0
        .0,PHF:-5.0,PHC:-5.0,SPF:4.0,EDMS:-3,IPLABEL:4480.0,FROMTO:0,AD:0,FFOB:0.0,CF
        OB:0.0,SPC:0.0,SIG:-5,AUF:1,DUF:7903,ACD:5,DCD:107,SL:0,AG:0,CFC:0.519,CFSR:0
        .078,UAT:0,RAF:2,VERSION:2.3.4
X-CPASD-ID: 68c7f6f2d1794d9487d91d9de1613079-20210809
X-CPASD-BLOCK: 1000
X-CPASD-STAGE: 1, 1
X-UUID: 68c7f6f2d1794d9487d91d9de1613079-20210809
X-User: liuyun01@kylinos.cn
Received: from [172.16.31.99] [(116.128.244.169)] by nksmu.kylinos.cn
        (envelope-from <liuyun01@kylinos.cn>)
        (Generic MTA)
        with ESMTP id 1277910942; Mon, 09 Aug 2021 12:20:06 +0800
Subject: Re: [RFC PATCH v2 05/10] block: Add block device sysfs attribute to
 set/clear/show LED
To:     Ian Pilcher <arequipeno@gmail.com>, linux-block@vger.kernel.org,
        linux-leds@vger.kernel.org
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org
References: <20210809033217.1113444-1-arequipeno@gmail.com>
 <20210809033217.1113444-6-arequipeno@gmail.com>
From:   Jackie Liu <liuyun01@kylinos.cn>
Message-ID: <d2322db3-992a-f9c1-53c4-39efc9d957a4@kylinos.cn>
Date:   Mon, 9 Aug 2021 12:21:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210809033217.1113444-6-arequipeno@gmail.com>
Content-Type: multipart/mixed;
        boundary="Add_By_Label_Mail_Nextpart_001"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

--Add_By_Label_Mail_Nextpart_001
Content-Type: text/plain;
Content-Transfer-Encoding: 8bit




ÔÚ 2021/8/9 ÉÏÎç11:32, Ian Pilcher Ð´µÀ:
> Add show & store functions in blk-ledtrig.c (attributes defined in genhd.c)
> 
> Show function shows all available LEDs (LEDs associated with blkdev trigger);
> currently associated LED is shown in square brackets ([])
> 
> Store function accepts either all whitespace or "none" to clear LED
> 
> Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
> ---
>   block/blk-ledtrig.c | 109 ++++++++++++++++++++++++++++++++++++++++++++
>   block/blk-ledtrig.h |   8 ++++
>   block/genhd.c       |   8 ++++
>   3 files changed, 125 insertions(+)
> 
> diff --git a/block/blk-ledtrig.c b/block/blk-ledtrig.c
> index 280fa9edc2dd..1af94dc7ea51 100644
> --- a/block/blk-ledtrig.c
> +++ b/block/blk-ledtrig.c
> @@ -6,6 +6,7 @@
>    *	Copyright 2021 Ian Pilcher <arequipeno@gmail.com>
>    */
>   
> +#include <linux/ctype.h>
>   #include <linux/genhd.h>
>   #include <linux/leds.h>
>   #include <linux/mutex.h>
> @@ -139,3 +140,111 @@ static int blk_ledtrig_dev_set(struct gendisk *const disk,
>   led_set_exit_return:
>   	return ret;
>   }
> +
> +
> +/*
> + *
> + *	sysfs attribute store function to set or clear device LED
> + *
> + */
> +
> +// Returns a pointer to the first non-whitespace character in s (or a pointer
> +// to the terminating null).
> +static const char *blk_ledtrig_skip_whitespace(const char *s)
> +{
> +	while (*s != 0 && isspace(*s))
> +		++s;
> +
> +	return s;
> +}
> +
> +// Returns a pointer to the first whitespace character in s (or a pointer to
> +// the terminating null), which is effectively a pointer to the position *after*
> +// the last character in the non-whitespace token at the beginning of s.  (s is
> +// expected to be the result of a previous call to blk_ledtrig_skip_whitespace.)

These are not linux kernel style comments.

> +static const char *blk_ledtrig_find_whitespace(const char *s)
> +{
> +	while (*s != 0 && !isspace(*s))
> +		++s;
> +
> +	return s;
> +}
> +
> +static bool blk_ledtrig_name_is_none(const char *const name, const size_t len)
> +{
> +	static const char none[4] = "none";	// no terminating null
> +
> +	return len == sizeof(none) && memcmp(name, none, sizeof(none)) == 0;
> +}
> +
> +ssize_t blk_ledtrig_dev_led_store(struct device *const dev,
> +				  struct device_attribute *const attr,
> +				  const char *const buf, const size_t count)
> +{
> +	struct gendisk *const disk = dev_to_disk(dev);
> +	const char *const led_name = blk_ledtrig_skip_whitespace(buf);
> +	const char *const endp = blk_ledtrig_find_whitespace(led_name);
> +	const ptrdiff_t name_len = endp - led_name;	// always >= 0
> +	int ret;
> +
> +	if (name_len == 0 || blk_ledtrig_name_is_none(led_name, name_len)) {
> +		blk_ledtrig_dev_clear(disk);
> +		ret = 0;
> +	} else {
> +		ret = blk_ledtrig_dev_set(disk, led_name, name_len);
> +	}
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +
> +/*
> + *
> + *	sysfs attribute show function for device LED
> + *
> + */
> +
> +ssize_t blk_ledtrig_dev_led_show(struct device *const dev,
> +				 struct device_attribute *const attr,
> +				 char *const buf)
> +{
> +	struct gendisk *const disk = dev_to_disk(dev);
> +	struct blk_ledtrig_led *bd_led, *disk_led;
> +	int ret, c = 0;
> +
> +	ret = mutex_lock_interruptible(&blk_ledtrig_mutex);
> +	if (ret != 0)
> +		goto led_show_exit_return;
> +
> +	disk_led = rcu_dereference_protected(disk->led,
> +					lockdep_is_held(&blk_ledtrig_mutex));
> +
> +	if (disk_led == NULL)
> +		c += sprintf(buf, "[none]");
> +	else
> +		c += sprintf(buf, "none");
> +
> +	list_for_each_entry(bd_led, &blk_ledtrig_leds, leds_list_node) {
> +
> +		ret = snprintf(buf + c, PAGE_SIZE - c - 1,
> +			       bd_led == disk_led ? " [%s]" : " %s",
> +			       bd_led->led->name);
> +		if (ret >= PAGE_SIZE - c - 1) {
> +			ret = -EOVERFLOW;
> +			goto led_show_exit_unlock;
> +		}
> +
> +		c += ret;
> +	}
> +
> +	buf[c] = '\n';
> +	ret = c + 1;
> +
> +led_show_exit_unlock:
> +	mutex_unlock(&blk_ledtrig_mutex);
> +led_show_exit_return:
> +	return ret;
> +}
> diff --git a/block/blk-ledtrig.h b/block/blk-ledtrig.h
> index 66a1302a4174..771000d43647 100644
> --- a/block/blk-ledtrig.h
> +++ b/block/blk-ledtrig.h
> @@ -18,6 +18,14 @@ static inline void blk_ledtrig_disk_init(struct gendisk *const disk)
>   
>   void blk_ledtrig_dev_clear(struct gendisk *const disk);
>   
> +ssize_t blk_ledtrig_dev_led_store(struct device *const dev,
> +				  struct device_attribute *const attr,
> +				  const char *const buf, const size_t count);
> +
> +ssize_t blk_ledtrig_dev_led_show(struct device *const dev,
> +				 struct device_attribute *const attr,
> +				 char *const buf);
> +
>   #else	// CONFIG_BLK_LED_TRIGGERS
>   
>   static inline void blk_ledtrig_disk_init(const struct gendisk *disk) {}
> diff --git a/block/genhd.c b/block/genhd.c
> index 9fa734aeab0f..d5413a633410 100644
> --- a/block/genhd.c
> +++ b/block/genhd.c
> @@ -1012,6 +1012,11 @@ static struct device_attribute dev_attr_fail_timeout =
>   	__ATTR(io-timeout-fail, 0644, part_timeout_show, part_timeout_store);
>   #endif
>   
> +#ifdef CONFIG_BLK_LED_TRIGGERS
> +static struct device_attribute dev_attr_led =
> +	__ATTR(led, 0644, blk_ledtrig_dev_led_show, blk_ledtrig_dev_led_store);
> +#endif
> +
>   static struct attribute *disk_attrs[] = {
>   	&dev_attr_range.attr,
>   	&dev_attr_ext_range.attr,
> @@ -1033,6 +1038,9 @@ static struct attribute *disk_attrs[] = {
>   #endif
>   #ifdef CONFIG_FAIL_IO_TIMEOUT
>   	&dev_attr_fail_timeout.attr,
> +#endif
> +#ifdef CONFIG_BLK_LED_TRIGGERS
> +	&dev_attr_led.attr,
>   #endif
>   	NULL
>   };
> 

--Add_By_Label_Mail_Nextpart_001

Content-type: Text/plain

No virus found
		Checked by Hillstone Network AntiVirus

--Add_By_Label_Mail_Nextpart_001--
