Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7643488B9
	for <lists+linux-leds@lfdr.de>; Thu, 25 Mar 2021 07:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbhCYGEz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 25 Mar 2021 02:04:55 -0400
Received: from smtp1.axis.com ([195.60.68.17]:37558 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229533AbhCYGEp (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 25 Mar 2021 02:04:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1616652285;
  x=1648188285;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=KgAikQLc0a+uXf9MpMW7lcoLMvJvsmQiWu5c216iOEU=;
  b=YkOnfD8ctxMyXt5arXrn2Ev3sDRIHh4iGKvg0wX9O++uVdI5o5n+IwGU
   yPoZklOVTmytyHClVO+72rsSO0za4Ljg8HP0i0BwhFTDhaPQkF3HcoZri
   DQV4jHS7BxQQ5jZmPumWtsG1vM1/2Ift4SbcSVoS8T1hlb16GdKVSHH4h
   EnoeFLyn672Gssjq/WNV3WNgoiGlIrR8sFUeSwL9FyfcXdu4Cfb8uMz0E
   is68ketGT7/Ztq62AJuPi8UxdvT6ypTRGfF0z0cFreLwTQNmqwJdT/Vu4
   TpuyUPeWMQfaxLD1YKyloDQxuvJF49hdfGK9TQDzyUAMfPdobW2yyv9pl
   Q==;
From:   Hermes Zhang <Hermes.Zhang@axis.com>
To:     Marek Behun <marek.behun@nic.cz>,
        Hermes Zhang <Hermes.Zhang@axis.com>
CC:     "pavel@ucw.cz" <pavel@ucw.cz>, "dmurphy@ti.com" <dmurphy@ti.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lkml@axis.com" <lkml@axis.com>, kernel <kernel@axis.com>
Subject: Re: [PATCH 1/2] leds: leds-multi-gpio: Add multiple GPIOs LED driver
Thread-Topic: [PATCH 1/2] leds: leds-multi-gpio: Add multiple GPIOs LED driver
Thread-Index: AQHXIINVpz7s49aciUujD1l9rQIjiw==
Date:   Thu, 25 Mar 2021 06:04:43 +0000
Message-ID: <7ea3f7e6ea7a464fa4bb59b94857a755@XBOX01.axis.com>
References: <20210324075631.5004-1-chenhui.zhang@axis.com>
 <20210324075631.5004-2-chenhui.zhang@axis.com>
 <20210324103431.4b945915@thinkpad>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Marek,=0A=
=0A=
On 3/24/21 5:34 PM, Marek Behun wrote:=0A=
>> +#include <linux/err.h>=0A=
>> +#include <linux/gpio.h>=0A=
>> +#include <linux/gpio/consumer.h>=0A=
>> +#include <linux/kernel.h>=0A=
>> +#include <linux/leds.h>=0A=
>> +#include <linux/module.h>=0A=
>> +#include <linux/of.h>=0A=
>> +#include <linux/of_gpio.h>=0A=
>> +#include <linux/platform_device.h>=0A=
>> +#include <linux/property.h>=0A=
>> +#include <linux/slab.h>=0A=
> Why do you include slab.h?=0A=
Yeah, I will clean it in next commit.=0A=
>> +=0A=
>> +=0A=
>> +static void multi_gpio_led_set(struct led_classdev *led_cdev,=0A=
>> +	enum led_brightness value)=0A=
>> +{=0A=
>> +	struct multi_gpio_led_priv *priv;=0A=
>> +	int idx;=0A=
>> +=0A=
>> +	DECLARE_BITMAP(values, MAX_GPIO_NUM);=0A=
>> +=0A=
>> +	priv =3D container_of(led_cdev, struct multi_gpio_led_priv, cdev);=0A=
>> +=0A=
>> +	idx =3D (value - LED_OFF) * priv->nr_states / (LED_FULL + 1);=0A=
> LED_FULL / LED_OFF are deprecated, don't use them.=0A=
=0A=
Then could I use just 0 (instead LED_OFF) and led_cdev->max_brightness=0A=
=0A=
(instead of LED_FULL) here? The idea here is map the states defined in dts=
=0A=
=0A=
to the full brightness range.=0A=
=0A=
> +=0A=
> +	priv->nr_states =3D ret;=0A=
> +	priv->states =3D devm_kzalloc(dev, sizeof(*priv->states) * priv->nr_sta=
tes, GFP_KERNEL);=0A=
> +	if (!priv->states)=0A=
> +		return -ENOMEM;=0A=
> +=0A=
> +	ret =3D of_property_read_u8_array(node, "led-states", priv->states, pri=
v->nr_states);=0A=
> +	if (ret)=0A=
> +		return ret;=0A=
> +=0A=
> +	priv->cdev.max_brightness =3D LED_FULL;=0A=
> ???? max_brightness is not 255 (=3D LED_FULL). max_brightness must be=0A=
> derived from the led-states property.=0A=
=0A=
Yeah, I will fix this. the max-brightness should for the whole LED,=0A=
right? So=0A=
=0A=
it will at same level with led-states.=0A=
=0A=
=0A=
=0A=
