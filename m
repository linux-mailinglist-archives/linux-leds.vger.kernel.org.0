Return-Path: <linux-leds+bounces-3196-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4149B5310
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2024 21:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D8872844AA
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2024 20:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99F31DBB36;
	Tue, 29 Oct 2024 20:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="UCighNrp"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F3A2038D3;
	Tue, 29 Oct 2024 20:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.89.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730232441; cv=none; b=TIA2XRFgOhXsR87r67Xp520NCYpaJyHYWZ17mGwkeowRU5IHAoqIJFtSLEA/ObnDPRVuHRTeQoE9cDBh8AQZy1+s83/tq+L70o+4vFXiXFy8rzclMFFdHr6Cv+bsSbzz9QMXj+7ZzWopSZhiPi2N7wzG/BDc8afrDxwNSc9eHDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730232441; c=relaxed/simple;
	bh=RnxuaGzteAOrXRoTIbxzr8OKGrlTWJ6640j3aTLYeh4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXhMqWT/Y35E1Ojvj69OiFf+PGo/vjbmPIhXuyf3aPHpFKWxMNPadhgeOsyH2ZNLjtSmLyaxaGU9Oke9Nu5uycSoldaXIUQtsgl3VC5wo4Okf9RT7FGGv8DWe81N+GMkrYgk/0aAvGUrX6j0zpl39SFMXX65UeYK8pwG1kVIwdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=UCighNrp; arc=none smtp.client-ip=45.89.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 156D7120012;
	Tue, 29 Oct 2024 23:07:00 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 156D7120012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1730232420;
	bh=RNaGEaeYTgO0RlXTmxEJ0K4YXTz7mIWuayOKYdwgxKY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=UCighNrpktIezcGZ4gdO0cEfRNT7ryE4EWGqFJAdQoEEbSglxtCw771bz/GE7Gzc0
	 M9vEZ2nHjs2+dfmg2sfex5R7Qo49bxQrGmyGc2pxo4Ot1EuuKfJ73HSmhP6WpGbCjR
	 WcHQJKKf6vfrs3VckjnrRKZTGKqr5Imd5Vvg0GmwkjHs42QyslfbA7CNguc5nvpIu3
	 nvj+prLcVLW0Brn18NymGNPp6cw5HuaQt6naNMoZwOjZPtu2PYtvvrwnmDazaToKGb
	 6P0xc/A8Uiz0Y+iLFB8YFhZngK23k37AcTCNosXH0/pcsXFhQB4c9IwOuCfMymwP+t
	 xDhY0hA+xjiEw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 29 Oct 2024 23:06:59 +0300 (MSK)
Date: Tue, 29 Oct 2024 23:06:59 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Lee Jones <lee@kernel.org>
CC: <pavel@ucw.cz>, <linux-kernel@vger.kernel.org>,
	<linux-leds@vger.kernel.org>, <kernel@salutedevices.com>,
	<rockosov@gmail.com>, Alexey Romanov <avromanov@salutedevices.com>
Subject: Re: [PATCH v2] leds: introduce ordered workqueue for leds events
 instead of system_wq
Message-ID: <20241029200632.chysrb7teyc7dsrq@CAB-WSD-L081021>
References: <20240903223936.21292-1-ddrokosov@salutedevices.com>
 <20240916111733.c5rp4l666rtdz7bt@CAB-WSD-L081021>
 <20240917080412.GB9955@google.com>
 <20241022142248.lzm45fzisrcgtitd@CAB-WSD-L081021>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241022142248.lzm45fzisrcgtitd@CAB-WSD-L081021>
User-Agent: NeoMutt/20220415
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 188799 [Oct 29 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 40 0.3.40 cefee68357d12c80cb9cf2bdcf92256b1d238d22, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, lore.kernel.org:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/10/29 19:11:00
X-KSMG-LinksScanning: Clean, bases: 2024/10/29 19:12:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/10/29 15:51:00 #26800612
X-KSMG-AntiVirus-Status: Clean, skipped

Hello Lee,

Kindly reminder.

On Tue, Oct 22, 2024 at 05:22:48PM +0300, Dmitry Rokosov wrote:
> Hello Lee,
> 
> I hope this message finds you well.
> I wanted to ask for your thoughts on whether there was enough time for
> testing and if we can proceed with merging this patchset.
> 
> I appreciate any feedback about it.
> 
> On Tue, Sep 17, 2024 at 09:04:12AM +0100, Lee Jones wrote:
> > On Mon, 16 Sep 2024, Dmitry Rokosov wrote:
> > 
> > > Hello Lee!
> > > 
> > > What are the next steps? Should I make any changes, or are we waiting
> > > for test results from the mailing list members?
> > 
> > This is an intrusive core change that was submitted during -rc6.
> > 
> > It's going to need some time on the list for people to respond.
> > 
> > > Sorry for the ping.
> > > 
> > > On Wed, Sep 04, 2024 at 01:39:30AM +0300, Dmitry Rokosov wrote:
> > > > This allows to setup ordered workqueue for leds events. This may be
> > > > useful, because default 'system_wq' does not guarantee execution order
> > > > of each work_struct, thus for several brightness update requests (for
> > > > multiple leds), real brightness switch could be in random order.
> > > > 
> > > > Yes, for sysfs-based leds we have flush_work() call inside
> > > > brightness_store() operation, but it's blocking call, so userspace
> > > > caller can be blocked at a long time, which means leds animation stream
> > > > can be broken.
> > > > 
> > > > Ordered workqueue has the same behaviour as system_wq + flush_work(),
> > > > but all scheduled works are async and userspace caller is not blocked,
> > > > which it better for userspace animation scheduling.
> > > > 
> > > > Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> > > > Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> > > > ---
> > > > Changes v2 since v1 at [1]:
> > > >     - replace "leds" with "LEDs" in the log message
> > > > 
> > > > Links:
> > > >     [1] https://lore.kernel.org/all/20240820155407.32729-1-ddrokosov@salutedevices.com/
> > > > ---
> > > >  drivers/leds/led-class.c | 12 +++++++++++-
> > > >  drivers/leds/led-core.c  |  6 +++---
> > > >  include/linux/leds.h     |  1 +
> > > >  3 files changed, 15 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > > > index c66d1bead0a4..b5e28ad54f7f 100644
> > > > --- a/drivers/leds/led-class.c
> > > > +++ b/drivers/leds/led-class.c
> > > > @@ -25,6 +25,8 @@
> > > >  static DEFINE_MUTEX(leds_lookup_lock);
> > > >  static LIST_HEAD(leds_lookup_list);
> > > >  
> > > > +static struct workqueue_struct *leds_wq;
> > > > +
> > > >  static ssize_t brightness_show(struct device *dev,
> > > >  		struct device_attribute *attr, char *buf)
> > > >  {
> > > > @@ -57,7 +59,6 @@ static ssize_t brightness_store(struct device *dev,
> > > >  	if (state == LED_OFF)
> > > >  		led_trigger_remove(led_cdev);
> > > >  	led_set_brightness(led_cdev, state);
> > > > -	flush_work(&led_cdev->set_brightness_work);
> > > >  
> > > >  	ret = size;
> > > >  unlock:
> > > > @@ -548,6 +549,8 @@ int led_classdev_register_ext(struct device *parent,
> > > >  
> > > >  	led_update_brightness(led_cdev);
> > > >  
> > > > +	led_cdev->wq = leds_wq;
> > > > +
> > > >  	led_init_core(led_cdev);
> > > >  
> > > >  #ifdef CONFIG_LEDS_TRIGGERS
> > > > @@ -666,12 +669,19 @@ EXPORT_SYMBOL_GPL(devm_led_classdev_unregister);
> > > >  
> > > >  static int __init leds_init(void)
> > > >  {
> > > > +	leds_wq = alloc_ordered_workqueue("leds", 0);
> > > > +	if (!leds_wq) {
> > > > +		pr_err("failed to create LEDs ordered workqueue\n");
> > > > +		return -ENOMEM;
> > > > +	}
> > > > +
> > > >  	return class_register(&leds_class);
> > > >  }
> > > >  
> > > >  static void __exit leds_exit(void)
> > > >  {
> > > >  	class_unregister(&leds_class);
> > > > +	destroy_workqueue(leds_wq);
> > > >  }
> > > >  
> > > >  subsys_initcall(leds_init);
> > > > diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> > > > index 89c9806cc97f..9769ac49be20 100644
> > > > --- a/drivers/leds/led-core.c
> > > > +++ b/drivers/leds/led-core.c
> > > > @@ -266,7 +266,7 @@ void led_blink_set_nosleep(struct led_classdev *led_cdev, unsigned long delay_on
> > > >  		led_cdev->delayed_delay_on = delay_on;
> > > >  		led_cdev->delayed_delay_off = delay_off;
> > > >  		set_bit(LED_SET_BLINK, &led_cdev->work_flags);
> > > > -		schedule_work(&led_cdev->set_brightness_work);
> > > > +		queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
> > > >  		return;
> > > >  	}
> > > >  
> > > > @@ -297,7 +297,7 @@ void led_set_brightness(struct led_classdev *led_cdev, unsigned int brightness)
> > > >  		 */
> > > >  		if (!brightness) {
> > > >  			set_bit(LED_BLINK_DISABLE, &led_cdev->work_flags);
> > > > -			schedule_work(&led_cdev->set_brightness_work);
> > > > +			queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
> > > >  		} else {
> > > >  			set_bit(LED_BLINK_BRIGHTNESS_CHANGE,
> > > >  				&led_cdev->work_flags);
> > > > @@ -333,7 +333,7 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value)
> > > >  		set_bit(LED_SET_BRIGHTNESS_OFF, &led_cdev->work_flags);
> > > >  	}
> > > >  
> > > > -	schedule_work(&led_cdev->set_brightness_work);
> > > > +	queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(led_set_brightness_nopm);
> > > >  
> > > > diff --git a/include/linux/leds.h b/include/linux/leds.h
> > > > index 6300313c46b7..7c9f1cb12ab9 100644
> > > > --- a/include/linux/leds.h
> > > > +++ b/include/linux/leds.h
> > > > @@ -169,6 +169,7 @@ struct led_classdev {
> > > >  	int			 new_blink_brightness;
> > > >  	void			(*flash_resume)(struct led_classdev *led_cdev);
> > > >  
> > > > +	struct workqueue_struct *wq; /* LED workqueue */
> > > >  	struct work_struct	set_brightness_work;
> > > >  	int			delayed_set_value;
> > > >  	unsigned long		delayed_delay_on;
> > > > -- 
> > > > 2.43.0

-- 
Thank you,
Dmitry

