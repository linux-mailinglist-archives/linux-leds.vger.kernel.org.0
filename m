Return-Path: <linux-leds+bounces-2593-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7BB96A178
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 17:00:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F7541C24256
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 15:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C168155A47;
	Tue,  3 Sep 2024 15:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="Qav+SkTg"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F02D2AE66;
	Tue,  3 Sep 2024 15:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.89.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725375616; cv=none; b=BhAs5aJhuMd7xHpKmuzNhxIXhxYCZZhB9NzDHeJJqEYJpRTRsa4X2Kv/PPisB0N3+hhjG2PwhiA7x4jdMPhqWtD+cHBRtuyeZNg3NSiWvtjaRdMdNhH3PaMDqXyau7yBpUcGeoUx6zoVywiZMxRg+u+MNTnleu36Mii7ZrAg05M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725375616; c=relaxed/simple;
	bh=QueXMqwJNObdj9zptFdqEQjTxnv+XogcLKwP2BGl2NE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NBdR4C5AFVQ28RNQMiIJ4KCXAKu7WWP3/zNhK9xSQ6ykXwg8Gd550cNabZcejy43u7QyhaR/l3vhX3MZ/Cvle15frRs5MBaUGqDZ8HllQ5PTn8940CpuOrYYFQCd6/fsIAoDyl466fW2Bp2yQetcj8VcPQA5Zv8VdCguILKrvBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=Qav+SkTg; arc=none smtp.client-ip=45.89.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id E4FAE120002;
	Tue,  3 Sep 2024 17:59:56 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru E4FAE120002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1725375596;
	bh=SzM3sQPASkUPd9ScTJ/rDSUm2KWQEJGFicMbaAjIBh8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=Qav+SkTgIk1OfnQqlj6KZDG/oiTEbSucIdj4JymdCaaILGGLkgzryg9Bxn7m2fDBw
	 PXxscHMcAPeGikF6/Zi+ugDKYqUirhyvM0e9uE4x3eJUUW94mB9XEjneBSkCLKBqBu
	 8trznOJNBHZIMPd1rAgAa8g/vlBcvWep1ZHLfmjasekmKAvhG3jWDtOW14vbb5xmKF
	 mNg4al+oHhaKs8W1NeuPzvaV7ngKYhPO3bLqjuWKz2rgScvOuYO/zfczkYmuY4xKbO
	 waxYmUpI57KsEyxSbIEvfkJNYWn+aOjICin4bsWUszIur6LYryNunKc81uEHV+OHYD
	 kfSmfWG5Qovng==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  3 Sep 2024 17:59:51 +0300 (MSK)
Date: Tue, 3 Sep 2024 17:59:50 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Lee Jones <lee@kernel.org>
CC: <pavel@ucw.cz>, <linux-kernel@vger.kernel.org>,
	<linux-leds@vger.kernel.org>, <kernel@salutedevices.com>,
	<rockosov@gmail.com>, Alexey Romanov <avromanov@salutedevices.com>
Subject: Re: [PATCH v1] leds: introduce ordered workqueue for leds events
 instead of system_wq
Message-ID: <20240903145828.kk46axjkv22xmkf5@CAB-WSD-L081021>
References: <20240820155407.32729-1-ddrokosov@salutedevices.com>
 <20240903140119.GW6858@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240903140119.GW6858@google.com>
User-Agent: NeoMutt/20220415
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 187504 [Sep 03 2024]
X-KSMG-AntiSpam-Version: 6.1.1.5
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 32 0.3.32 766319f57b3d5e49f2c79a76e7d7087b621090df, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, {Track_Chinese_Simplified, text}, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/09/03 13:56:00 #26514497
X-KSMG-AntiVirus-Status: Clean, skipped

On Tue, Sep 03, 2024 at 03:01:19PM +0100, Lee Jones wrote:
> On Tue, 20 Aug 2024, Dmitry Rokosov wrote:
> 
> > This allows to setup ordered workqueue for leds events. This may be
> > useful, because default 'system_wq' does not guarantee execution order
> > of each work_struct, thus for several brightness update requests (for
> > multiple leds), real brightness switch could be in random order.
> > 
> > Yes, for sysfs-based leds we have flush_work() call inside
> > brightness_store() operation, but it's blocking call, so userspace
> > caller can be blocked at a long time, which means leds animation stream
> > can be broken.
> > 
> > Ordered workqueue has the same behaviour as system_wq + flush_work(),
> > but all scheduled works are async and userspace caller is not blocked,
> > which it better for userspace animation scheduling.
> > 
> > Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> > Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> > ---
> >  drivers/leds/led-class.c | 12 +++++++++++-
> >  drivers/leds/led-core.c  |  6 +++---
> >  include/linux/leds.h     |  1 +
> >  3 files changed, 15 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > index ba1be15cfd8e..fba12471cf1f 100644
> > --- a/drivers/leds/led-class.c
> > +++ b/drivers/leds/led-class.c
> > @@ -25,6 +25,8 @@
> >  static DEFINE_MUTEX(leds_lookup_lock);
> >  static LIST_HEAD(leds_lookup_list);
> >  
> > +static struct workqueue_struct *leds_wq;
> 
> Does this _have_ to be global?
> 

Unfortunately, yes, it has. Each LED described in the DTS, for example,
is represented as led_cdev. We do not have a led_device or a similar
structure to represent the entire LED device (the controller that
integrates all LEDs and manages them).

One option is to move leds_wq to the driver’s private data. However,
from my perspective, this is a more complicated solution, especially
considering that we have the ability to create a global leds_wq variable
in the core implementation, which can resolve the described issue
entirely.

> Isn't there a suitable data structure that we can store it in?
> 

> >  static ssize_t brightness_show(struct device *dev,
> >  		struct device_attribute *attr, char *buf)
> >  {
> > @@ -57,7 +59,6 @@ static ssize_t brightness_store(struct device *dev,
> >  	if (state == LED_OFF)
> >  		led_trigger_remove(led_cdev);
> >  	led_set_brightness(led_cdev, state);
> > -	flush_work(&led_cdev->set_brightness_work);
> >  
> >  	ret = size;
> >  unlock:
> > @@ -549,6 +550,8 @@ int led_classdev_register_ext(struct device *parent,
> >  
> >  	led_update_brightness(led_cdev);
> >  
> > +	led_cdev->wq = leds_wq;
> > +
> >  	led_init_core(led_cdev);
> >  
> >  #ifdef CONFIG_LEDS_TRIGGERS
> > @@ -667,12 +670,19 @@ EXPORT_SYMBOL_GPL(devm_led_classdev_unregister);
> >  
> >  static int __init leds_init(void)
> >  {
> > +	leds_wq = alloc_ordered_workqueue("leds", 0);
> > +	if (!leds_wq) {
> > +		pr_err("failed to create leds ordered workqueue\n");
> 
> Nit: "LEDs"
> 

Okay, I will send v2 patch today with fixed this line.

> > +		return -ENOMEM;
> > +	}
> > +
> >  	return class_register(&leds_class);
> >  }
> >  
> >  static void __exit leds_exit(void)
> >  {
> >  	class_unregister(&leds_class);
> > +	destroy_workqueue(leds_wq);
> >  }
> >  
> >  subsys_initcall(leds_init);
> > diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> > index 89c9806cc97f..9769ac49be20 100644
> > --- a/drivers/leds/led-core.c
> > +++ b/drivers/leds/led-core.c
> > @@ -266,7 +266,7 @@ void led_blink_set_nosleep(struct led_classdev *led_cdev, unsigned long delay_on
> >  		led_cdev->delayed_delay_on = delay_on;
> >  		led_cdev->delayed_delay_off = delay_off;
> >  		set_bit(LED_SET_BLINK, &led_cdev->work_flags);
> > -		schedule_work(&led_cdev->set_brightness_work);
> > +		queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
> >  		return;
> >  	}
> >  
> > @@ -297,7 +297,7 @@ void led_set_brightness(struct led_classdev *led_cdev, unsigned int brightness)
> >  		 */
> >  		if (!brightness) {
> >  			set_bit(LED_BLINK_DISABLE, &led_cdev->work_flags);
> > -			schedule_work(&led_cdev->set_brightness_work);
> > +			queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
> >  		} else {
> >  			set_bit(LED_BLINK_BRIGHTNESS_CHANGE,
> >  				&led_cdev->work_flags);
> > @@ -333,7 +333,7 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value)
> >  		set_bit(LED_SET_BRIGHTNESS_OFF, &led_cdev->work_flags);
> >  	}
> >  
> > -	schedule_work(&led_cdev->set_brightness_work);
> > +	queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
> >  }
> >  EXPORT_SYMBOL_GPL(led_set_brightness_nopm);
> >  
> > diff --git a/include/linux/leds.h b/include/linux/leds.h
> > index 6300313c46b7..7c9f1cb12ab9 100644
> > --- a/include/linux/leds.h
> > +++ b/include/linux/leds.h
> > @@ -169,6 +169,7 @@ struct led_classdev {
> >  	int			 new_blink_brightness;
> >  	void			(*flash_resume)(struct led_classdev *led_cdev);
> >  
> > +	struct workqueue_struct *wq; /* LED workqueue */
> >  	struct work_struct	set_brightness_work;
> >  	int			delayed_set_value;
> >  	unsigned long		delayed_delay_on;
> > -- 
> > 2.43.0
> > 
> > 
> 
> -- 
> Lee Jones [李琼斯]

-- 
Thank you,
Dmitry

