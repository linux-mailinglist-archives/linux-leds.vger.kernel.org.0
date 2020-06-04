Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43A861EE58D
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jun 2020 15:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728337AbgFDNni (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Jun 2020 09:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728323AbgFDNni (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Jun 2020 09:43:38 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02501C08C5C0
        for <linux-leds@vger.kernel.org>; Thu,  4 Jun 2020 06:43:38 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id y17so6141163wrn.11
        for <linux-leds@vger.kernel.org>; Thu, 04 Jun 2020 06:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=8bhbUQijuvZLLqo5Q80GETFl6qJlu+JZB2yZOraSWFA=;
        b=PNj2zv7jKL4P+TkLc0AGpyx6SZ9o1A6ahfiM2unWLZR7aAdxxU0NzvdnLCU4aoLv1t
         P8iNX5gddSHxfozttgvBpRBpgoraFZTLZhKs5KkpK3sChEaE0MyiqPNNPkPDuNsF32oI
         LpUGs9oZ4k4zwQMSu+bM+LFwl6JxbiBfhaGOLAQHf16YAhgmTYf0YBAFf61MbmONu5DL
         cOAhqICJxjBoSdV53S5Iusc+Y7XJmQt9+tz9C8KAcIQY2EoGSyUrjT2ZwTELMiFj3d4+
         xuc0K/DWbs7FD8sDvMTmQd8+uUM6zb9p3WiuholXEyjs2k3sd2zyT5U7776Fj0ukC7tJ
         8RtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=8bhbUQijuvZLLqo5Q80GETFl6qJlu+JZB2yZOraSWFA=;
        b=LXqLiereegFPViiv0bR3iO6VsrTZJbiYLl4/VPzJLsx9GVYTTfAL4qeivyg/1IWUmH
         VvkAFXODWgqU/NPlBUp3RHTYDLGEnyQExKapDjAK2fEkA02M7RP4qJkMmxz44CZvj1Fj
         UZaiHZKCBtKZF/tma6o3cxjTj64YgI5HMDE/pDli3dWUqQWkpAFpQaJjaSuc98PAQMtv
         iPIyTAUCmtVEScfX03X5EBhjsMbmvjqHSuHiPaPsPzedzqDYg+ZQjXBRm/5AIgMLBvn6
         13abwVkfgwIt1f+jdWQIqlIiyT2db2Zoogip/g083BX2uFLau/pGK4MB8knarMzkzrYT
         Z/mw==
X-Gm-Message-State: AOAM532aCbHknWaBKwNxEc6lsHWBiSZK7pIneGHXa12bqSK7sRsulKen
        4J7mZfb/qj1YJswElgMzd5U=
X-Google-Smtp-Source: ABdhPJzXJBsJi0/ZZP3q79v7l9MoBRVs/bqhjL0ey5hmVmkOiC4PQWi+YGtlzshef4kfsmc3nErhTA==
X-Received: by 2002:adf:a51c:: with SMTP id i28mr4505253wrb.78.1591278216537;
        Thu, 04 Jun 2020 06:43:36 -0700 (PDT)
Received: from macbook-pro-alvaro-eth.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id v66sm3975424wme.13.2020.06.04.06.43.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jun 2020 06:43:35 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3] leds-bcm6328: support second hw blinking interval
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <20200604134043.GG7222@duo.ucw.cz>
Date:   Thu, 4 Jun 2020 15:43:35 +0200
Cc:     linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com,
        Jonas Gorski <jonas.gorski@gmail.com>, rpurdie@rpsys.net
Content-Transfer-Encoding: quoted-printable
Message-Id: <CA2F5175-2751-40F2-B38B-61A65C5AFD48@gmail.com>
References: <20200424133243.27303-1-noltari@gmail.com>
 <20200512100136.956872-1-noltari@gmail.com>
 <20200604132406.GD7222@duo.ucw.cz>
 <CE3312E5-8B8C-403D-81D6-B5C893C60586@gmail.com>
 <20200604134043.GG7222@duo.ucw.cz>
To:     Pavel Machek <pavel@ucw.cz>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

> El 4 jun 2020, a las 15:40, Pavel Machek <pavel@ucw.cz> escribi=C3=B3:
>=20
> On Thu 2020-06-04 15:35:06, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
>> HI Pavel,
>>=20
>> Right now, only one hw blinking interval is supported, but up to two =
hw blinking intervals can be configured in the controller.
>> This patch just adds support for the second hw blinking interval.
>>=20
>> BTW, I will send v4 which should clarify that each LED can be =
configured in 4 modes:
>> 0: On
>> 1: HW Blinking (Interval 1)
>> 2: HW Blinking (Interval 2)
>> 3: Off
>>=20
>> Until now we were only using 3 modes:
>> 0: On
>> 1: HW Blinking (Interval 1)
>> 3: Off
>=20
> So the issue is .... there are like 5 LEDs and they can be on or off
> or blinking with at most 2 different intervals?
> 								Pavel

Yes, the controller supports two different blinking delays (intervals), =
and LEDs can either be on, off or assigned to one of the two blinking =
delays.
However, the current upstream controller only supports one blinking =
delay. This patch just adds support for both blinking delays instead of =
just one.

>=20
>>> El 4 jun 2020, a las 15:24, Pavel Machek <pavel@ucw.cz> escribi=C3=B3:=

>>>=20
>>> On Tue 2020-05-12 12:01:36, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
>>>> Add support for both configurable HW blinking intervals.
>>>>=20
>>>=20
>>> The code could use ... better documentation and better changelog. =
What
>>> is the current blinking interval and what other interval does this
>>> add?
>>>=20
>>> Best regards,
>>>                                                               Pavel
>>>=20
>>>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>>>> ---
>>>> v3: add code documentation
>>>> v2: remove LED from the other interval
>>>>=20
>>>> drivers/leds/leds-bcm6328.c | 83 =
++++++++++++++++++++++++++++++-------
>>>> 1 file changed, 67 insertions(+), 16 deletions(-)
>>>>=20
>>>> diff --git a/drivers/leds/leds-bcm6328.c =
b/drivers/leds/leds-bcm6328.c
>>>> index 42e1b7598c3a..050a77591f0b 100644
>>>> --- a/drivers/leds/leds-bcm6328.c
>>>> +++ b/drivers/leds/leds-bcm6328.c
>>>> @@ -24,12 +24,16 @@
>>>>=20
>>>> #define BCM6328_LED_MAX_COUNT		24
>>>> #define BCM6328_LED_DEF_DELAY		500
>>>> +#define BCM6328_LED_INTERVAL_NUM	2
>>>> #define BCM6328_LED_INTERVAL_MS		20
>>>>=20
>>>> #define BCM6328_LED_INTV_MASK		0x3f
>>>> -#define BCM6328_LED_FAST_INTV_SHIFT	6
>>>> -#define BCM6328_LED_FAST_INTV_MASK	(BCM6328_LED_INTV_MASK =
<< \
>>>> -					 BCM6328_LED_FAST_INTV_SHIFT)
>>>> +#define BCM6328_LED_INTV1_SHIFT		0
>>>> +#define BCM6328_LED_INTV1_MASK		(BCM6328_LED_INTV_MASK =
<< \
>>>> +					 BCM6328_LED_INTV1_SHIFT)
>>>> +#define BCM6328_LED_INTV2_SHIFT		6
>>>> +#define BCM6328_LED_INTV2_MASK		(BCM6328_LED_INTV_MASK =
<< \
>>>> +					 BCM6328_LED_INTV2_SHIFT)
>>>> #define BCM6328_SERIAL_LED_EN		BIT(12)
>>>> #define BCM6328_SERIAL_LED_MUX		BIT(13)
>>>> #define BCM6328_SERIAL_LED_CLK_NPOL	BIT(14)
>>>> @@ -45,8 +49,8 @@
>>>>=20
>>>> #define BCM6328_LED_MODE_MASK		3
>>>> #define BCM6328_LED_MODE_ON		0
>>>> -#define BCM6328_LED_MODE_FAST		1
>>>> -#define BCM6328_LED_MODE_BLINK		2
>>>> +#define BCM6328_LED_MODE_INTV1		1
>>>> +#define BCM6328_LED_MODE_INTV2		2
>>>> #define BCM6328_LED_MODE_OFF		3
>>>> #define BCM6328_LED_SHIFT(X)		((X) << 1)
>>>>=20
>>>> @@ -127,12 +131,18 @@ static void bcm6328_led_set(struct =
led_classdev *led_cdev,
>>>> 	unsigned long flags;
>>>>=20
>>>> 	spin_lock_irqsave(led->lock, flags);
>>>> -	*(led->blink_leds) &=3D ~BIT(led->pin);
>>>> +
>>>> +	/* Remove LED from cached HW blinking intervals */
>>>> +	led->blink_leds[0] &=3D ~BIT(led->pin);
>>>> +	led->blink_leds[1] &=3D ~BIT(led->pin);
>>>> +
>>>> +	/* Set LED on/off */
>>>> 	if ((led->active_low && value =3D=3D LED_OFF) ||
>>>> 	    (!led->active_low && value !=3D LED_OFF))
>>>> 		bcm6328_led_mode(led, BCM6328_LED_MODE_ON);
>>>> 	else
>>>> 		bcm6328_led_mode(led, BCM6328_LED_MODE_OFF);
>>>> +
>>>> 	spin_unlock_irqrestore(led->lock, flags);
>>>> }
>>>>=20
>>>> @@ -176,20 +186,59 @@ static int bcm6328_blink_set(struct =
led_classdev *led_cdev,
>>>> 	}
>>>>=20
>>>> 	spin_lock_irqsave(led->lock, flags);
>>>> -	if (*(led->blink_leds) =3D=3D 0 ||
>>>> -	    *(led->blink_leds) =3D=3D BIT(led->pin) ||
>>>> -	    *(led->blink_delay) =3D=3D delay) {
>>>> +	/*
>>>> +	 * Check if any of the two configurable HW blinking intervals is
>>>> +	 * available:
>>>> +	 *   1. No LEDs assigned to the HW blinking interval.
>>>> +	 *   2. LEDs with the same delay assigned.
>>>> +	 */
>>>> +	if (led->blink_leds[0] =3D=3D 0 ||
>>>> +	    led->blink_leds[0] =3D=3D BIT(led->pin) ||
>>>> +	    led->blink_delay[0] =3D=3D delay) {
>>>> +		unsigned long val;
>>>> +
>>>> +		/* Add LED to the first HW blinking interval cache */
>>>> +		led->blink_leds[0] |=3D BIT(led->pin);
>>>> +
>>>> +		/* Remove LED from the second HW blinking interval cache =
*/
>>>> +		led->blink_leds[1] &=3D ~BIT(led->pin);
>>>> +
>>>> +		/* Cache the LED in the first HW blinking interval delay =
*/
>>>> +		led->blink_delay[0] =3D delay;
>>>> +
>>>> +		/* Update the delay for the first HW blinking interval =
*/
>>>> +		val =3D bcm6328_led_read(led->mem + BCM6328_REG_INIT);
>>>> +		val &=3D ~BCM6328_LED_INTV1_MASK;
>>>> +		val |=3D (delay << BCM6328_LED_INTV1_SHIFT);
>>>> +		bcm6328_led_write(led->mem + BCM6328_REG_INIT, val);
>>>> +
>>>> +		/* Set the LED to first HW blinking interval */
>>>> +		bcm6328_led_mode(led, BCM6328_LED_MODE_INTV1);
>>>> +
>>>> +		rc =3D 0;
>>>> +	} else if (led->blink_leds[1] =3D=3D 0 ||
>>>> +		   led->blink_leds[1] =3D=3D BIT(led->pin) ||
>>>> +		   led->blink_delay[1] =3D=3D delay) {
>>>> 		unsigned long val;
>>>>=20
>>>> -		*(led->blink_leds) |=3D BIT(led->pin);
>>>> -		*(led->blink_delay) =3D delay;
>>>> +		/* Remove LED from the first HW blinking interval */
>>>> +		led->blink_leds[0] &=3D ~BIT(led->pin);
>>>> +
>>>> +		/* Add LED to the second HW blinking interval */
>>>> +		led->blink_leds[1] |=3D BIT(led->pin);
>>>>=20
>>>> +		/* Cache the LED in the first HW blinking interval delay =
*/
>>>> +		led->blink_delay[1] =3D delay;
>>>> +
>>>> +		/* Update the delay for the second HW blinking interval =
*/
>>>> 		val =3D bcm6328_led_read(led->mem + BCM6328_REG_INIT);
>>>> -		val &=3D ~BCM6328_LED_FAST_INTV_MASK;
>>>> -		val |=3D (delay << BCM6328_LED_FAST_INTV_SHIFT);
>>>> +		val &=3D ~BCM6328_LED_INTV2_MASK;
>>>> +		val |=3D (delay << BCM6328_LED_INTV2_SHIFT);
>>>> 		bcm6328_led_write(led->mem + BCM6328_REG_INIT, val);
>>>>=20
>>>> -		bcm6328_led_mode(led, BCM6328_LED_MODE_BLINK);
>>>> +		/* Set the LED to second HW blinking interval */
>>>> +		bcm6328_led_mode(led, BCM6328_LED_MODE_INTV2);
>>>> +
>>>> 		rc =3D 0;
>>>> 	} else {
>>>> 		dev_dbg(led_cdev->dev,
>>>> @@ -358,11 +407,13 @@ static int bcm6328_leds_probe(struct =
platform_device *pdev)
>>>> 	if (!lock)
>>>> 		return -ENOMEM;
>>>>=20
>>>> -	blink_leds =3D devm_kzalloc(dev, sizeof(*blink_leds), =
GFP_KERNEL);
>>>> +	blink_leds =3D devm_kcalloc(dev, BCM6328_LED_INTERVAL_NUM,
>>>> +				  sizeof(*blink_leds), GFP_KERNEL);
>>>> 	if (!blink_leds)
>>>> 		return -ENOMEM;
>>>>=20
>>>> -	blink_delay =3D devm_kzalloc(dev, sizeof(*blink_delay), =
GFP_KERNEL);
>>>> +	blink_delay =3D devm_kcalloc(dev, BCM6328_LED_INTERVAL_NUM,
>>>> +				   sizeof(*blink_delay), GFP_KERNEL);
>>>> 	if (!blink_delay)
>>>> 		return -ENOMEM;
>>>>=20
>>>> --=20
>>>> 2.26.2
>>>=20
>>> --=20
>>> (english) http://www.livejournal.com/~pavelmachek
>>> (cesky, pictures) =
http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
>=20
> --=20
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) =
http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

