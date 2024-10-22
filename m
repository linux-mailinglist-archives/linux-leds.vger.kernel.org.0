Return-Path: <linux-leds+bounces-3141-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF259AB0BA
	for <lists+linux-leds@lfdr.de>; Tue, 22 Oct 2024 16:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 274031F236E3
	for <lists+linux-leds@lfdr.de>; Tue, 22 Oct 2024 14:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6CB1A072A;
	Tue, 22 Oct 2024 14:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="BbQWkyNA"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F3F1A08B8;
	Tue, 22 Oct 2024 14:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.18.73.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729606994; cv=none; b=jzZjuNkba0mG2hV7kCiw79eXFtWOIdknGXrmXoZyth0oSqgmOxoheCXl7qnqrJmMverMHxXrmhqX3I6U2bdIaUjyRxnH2GYSQeDSGoHNM4LQHZAhhXM6Mn3+lScXudDB6D4OCJiz0zn1frbUNSvjkqhEj5VSzu5ZDlx2oArMGlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729606994; c=relaxed/simple;
	bh=Ad0YIBgT8a4XBjr9QwbT4YDHymoOo59VtJa/LIQQ0JI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XpOC2ixqWJgwSxpWGOGsYoIIQtNpaPxyshqs8gara14MEyy7mrM1mlMp3XjyhJGEVc7OmHT7fdV9OIEbAjnHZgBIbAG+1vmPZMo206y8Lf58KqVPJWtX1mUugQmKVY+9eDvjh5oik0PeKDJdZreNIbKTxvn/judMRU3Hp370+Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=BbQWkyNA; arc=none smtp.client-ip=37.18.73.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id A9836100002;
	Tue, 22 Oct 2024 17:22:49 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru A9836100002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1729606969;
	bh=R/ZBEBlMFFXwAeR/41ouwU/0n/oT+PT0C3FpAtWGODs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=BbQWkyNAqKkbxybXY5d0zQrT4YKJyYXrQ7XojB4rva2y8/ENfEgWoB8tpkmps1eo1
	 n+RCRDexeBdBMUi/zB+BG0QMm2dNk1egnq//1m0InYW18edWEVm/oYI9actR06Nmig
	 l6H++aAaR6LlCHg+sMnO3gXc5VyzuICYiw68OhDjx7E/KbKZ988cU4FqMKO5+MHWqN
	 tVtOacteCdSIFvLhAThEt8Vq1K6n0hBYQClTpzUlWbIKIOSKmpSAhbdhsxI5LXZYB7
	 Rez/aMpMf3uz1kNQMjZY0cZF+KSEAlley0he/xMVJwqjyMu9I7kjpvpx92j7GxB+6j
	 XFyibxmTHqOtA==
Received: from smtp.sberdevices.ru (unknown [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 22 Oct 2024 17:22:49 +0300 (MSK)
Date: Tue, 22 Oct 2024 17:22:48 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Lee Jones <lee@kernel.org>
CC: <pavel@ucw.cz>, <linux-kernel@vger.kernel.org>,
	<linux-leds@vger.kernel.org>, <kernel@salutedevices.com>,
	<rockosov@gmail.com>, Alexey Romanov <avromanov@salutedevices.com>
Subject: Re: [PATCH v2] leds: introduce ordered workqueue for leds events
 instead of system_wq
Message-ID: <20241022142248.lzm45fzisrcgtitd@CAB-WSD-L081021>
References: <20240903223936.21292-1-ddrokosov@salutedevices.com>
 <20240916111733.c5rp4l666rtdz7bt@CAB-WSD-L081021>
 <20240917080412.GB9955@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240917080412.GB9955@google.com>
User-Agent: NeoMutt/20220415
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 188624 [Oct 22 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 40 0.3.40 cefee68357d12c80cb9cf2bdcf92256b1d238d22, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;lore.kernel.org:7.1.1;127.0.0.199:7.1.2, {Track_Chinese_Simplified, text}, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/10/22 08:29:00
X-KSMG-LinksScanning: Clean, bases: 2024/10/22 08:30:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/10/22 10:03:00 #26785789
X-KSMG-AntiVirus-Status: Clean, skipped

Hello Lee,

I hope this message finds you well.
I wanted to ask for your thoughts on whether there was enough time for
testing and if we can proceed with merging this patchset.

I appreciate any feedback about it.

On Tue, Sep 17, 2024 at 09:04:12AM +0100, Lee Jones wrote:
> On Mon, 16 Sep 2024, Dmitry Rokosov wrote:
> 
> > Hello Lee!
> > 
> > What are the next steps? Should I make any changes, or are we waiting
> > for test results from the mailing list members?
> 
> This is an intrusive core change that was submitted during -rc6.
> 
> It's going to need some time on the list for people to respond.
> 
> > Sorry for the ping.
> > 
> > On Wed, Sep 04, 2024 at 01:39:30AM +0300, Dmitry Rokosov wrote:
> > > This allows to setup ordered workqueue for leds events. This may be
> > > useful, because default 'system_wq' does not guarantee execution order
> > > of each work_struct, thus for several brightness update requests (for
> > > multiple leds), real brightness switch could be in random order.
> > > 
> > > Yes, for sysfs-based leds we have flush_work() call inside
> > > brightness_store() operation, but it's blocking call, so userspace
> > > caller can be blocked at a long time, which means leds animation stream
> > > can be broken.
> > > 
> > > Ordered workqueue has the same behaviour as system_wq + flush_work(),
> > > but all scheduled works are async and userspace caller is not blocked,
> > > which it better for userspace animation scheduling.
> > > 
> > > Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> > > Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> > > ---
> > > Changes v2 since v1 at [1]:
> > >     - replace "leds" with "LEDs" in the log message
> > > 
> > > Links:
> > >     [1] https://lore.kernel.org/all/20240820155407.32729-1-ddrokosov@salutedevices.com/
> > > ---
> > >  drivers/leds/led-class.c | 12 +++++++++++-
> > >  drivers/leds/led-core.c  |  6 +++---
> > >  include/linux/leds.h     |  1 +
> > >  3 files changed, 15 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > > index c66d1bead0a4..b5e28ad54f7f 100644
> > > --- a/drivers/leds/led-class.c
> > > +++ b/drivers/leds/led-class.c
> > > @@ -25,6 +25,8 @@
> > >  static DEFINE_MUTEX(leds_lookup_lock);
> > >  static LIST_HEAD(leds_lookup_list);
> > >  
> > > +static struct workqueue_struct *leds_wq;
> > > +
> > >  static ssize_t brightness_show(struct device *dev,
> > >  		struct device_attribute *attr, char *buf)
> > >  {
> > > @@ -57,7 +59,6 @@ static ssize_t brightness_store(struct device *dev,
> > >  	if (state == LED_OFF)
> > >  		led_trigger_remove(led_cdev);
> > >  	led_set_brightness(led_cdev, state);
> > > -	flush_work(&led_cdev->set_brightness_work);
> > >  
> > >  	ret = size;
> > >  unlock:
> > > @@ -548,6 +549,8 @@ int led_classdev_register_ext(struct device *parent,
> > >  
> > >  	led_update_brightness(led_cdev);
> > >  
> > > +	led_cdev->wq = leds_wq;
> > > +
> > >  	led_init_core(led_cdev);
> > >  
> > >  #ifdef CONFIG_LEDS_TRIGGERS
> > > @@ -666,12 +669,19 @@ EXPORT_SYMBOL_GPL(devm_led_classdev_unregister);
> > >  
> > >  static int __init leds_init(void)
> > >  {
> > > +	leds_wq = alloc_ordered_workqueue("leds", 0);
> > > +	if (!leds_wq) {
> > > +		pr_err("failed to create LEDs ordered workqueue\n");
> > > +		return -ENOMEM;
> > > +	}
> > > +
> > >  	return class_register(&leds_class);
> > >  }
> > >  
> > >  static void __exit leds_exit(void)
> > >  {
> > >  	class_unregister(&leds_class);
> > > +	destroy_workqueue(leds_wq);
> > >  }
> > >  
> > >  subsys_initcall(leds_init);
> > > diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> > > index 89c9806cc97f..9769ac49be20 100644
> > > --- a/drivers/leds/led-core.c
> > > +++ b/drivers/leds/led-core.c
> > > @@ -266,7 +266,7 @@ void led_blink_set_nosleep(struct led_classdev *led_cdev, unsigned long delay_on
> > >  		led_cdev->delayed_delay_on = delay_on;
> > >  		led_cdev->delayed_delay_off = delay_off;
> > >  		set_bit(LED_SET_BLINK, &led_cdev->work_flags);
> > > -		schedule_work(&led_cdev->set_brightness_work);
> > > +		queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
> > >  		return;
> > >  	}
> > >  
> > > @@ -297,7 +297,7 @@ void led_set_brightness(struct led_classdev *led_cdev, unsigned int brightness)
> > >  		 */
> > >  		if (!brightness) {
> > >  			set_bit(LED_BLINK_DISABLE, &led_cdev->work_flags);
> > > -			schedule_work(&led_cdev->set_brightness_work);
> > > +			queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
> > >  		} else {
> > >  			set_bit(LED_BLINK_BRIGHTNESS_CHANGE,
> > >  				&led_cdev->work_flags);
> > > @@ -333,7 +333,7 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value)
> > >  		set_bit(LED_SET_BRIGHTNESS_OFF, &led_cdev->work_flags);
> > >  	}
> > >  
> > > -	schedule_work(&led_cdev->set_brightness_work);
> > > +	queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
> > >  }
> > >  EXPORT_SYMBOL_GPL(led_set_brightness_nopm);
> > >  
> > > diff --git a/include/linux/leds.h b/include/linux/leds.h
> > > index 6300313c46b7..7c9f1cb12ab9 100644
> > > --- a/include/linux/leds.h
> > > +++ b/include/linux/leds.h
> > > @@ -169,6 +169,7 @@ struct led_classdev {
> > >  	int			 new_blink_brightness;
> > >  	void			(*flash_resume)(struct led_classdev *led_cdev);
> > >  
> > > +	struct workqueue_struct *wq; /* LED workqueue */
> > >  	struct work_struct	set_brightness_work;
> > >  	int			delayed_set_value;
> > >  	unsigned long		delayed_delay_on;
> > > -- 
> > > 2.43.0
> > > 
> > 
> > -- 
> > Thank you,
> > Dmitry
> 
> -- 
> Lee Jones [李琼斯]

-- 
Thank you,
Dmitry

