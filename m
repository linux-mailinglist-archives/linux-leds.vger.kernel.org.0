Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66F6C64300
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2019 09:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbfGJHoj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 10 Jul 2019 03:44:39 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:52246 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbfGJHoj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 10 Jul 2019 03:44:39 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6A7iY4C038946;
        Wed, 10 Jul 2019 02:44:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1562744674;
        bh=KqOX5GKrtxsX6vmTiOa6nM4rOWB6IU6WDwN21PLg08w=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=FYbMRpLE64yppi2sX24VhkY/mDTKMiuG/k7EYDomU9rPd3JejLVyXpf9x1D9yb8gB
         u2RbmTiLmuBte0VLHE6isiVd09vShS6U7Ocobvc4T3BljX8FGNUEGhdtF/6MXUqDG0
         tQDNYu+vrJcEt1BxN+sm9FlKdUDByK82Slsz1izk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6A7iY6a005936
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 10 Jul 2019 02:44:34 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 10
 Jul 2019 02:44:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 10 Jul 2019 02:44:34 -0500
Received: from [10.250.97.31] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6A7iWj1122857;
        Wed, 10 Jul 2019 02:44:32 -0500
Subject: Re: [PATCH v2 1/2] leds: tlc591xx: simplify driver by using the
 managed led API
To:     Dan Murphy <dmurphy@ti.com>, <jacek.anaszewski@gmail.com>,
        <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tomi.valkeinen@ti.com>
References: <20190708100620.22388-1-jjhiblot@ti.com>
 <20190708100620.22388-2-jjhiblot@ti.com>
 <127551c1-d642-0603-f2f2-6fd4cc43bb93@ti.com>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <6242726a-ddb9-ab87-a28e-a1fa0ecbf87e@ti.com>
Date:   Wed, 10 Jul 2019 09:44:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <127551c1-d642-0603-f2f2-6fd4cc43bb93@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

On 08/07/2019 20:08, Dan Murphy wrote:
> JJ
>
> On 7/8/19 5:06 AM, Jean-Jacques Hiblot wrote:
>> Use the managed API of the LED class (devm_led_classdev_register()
>> instead of led_classdev_register()).
>> This allows us to remove the code used to track-and-destroy the LED 
>> devices
>
> What changed from v1?

What changed is a bug fix in the loop: replaced led = &priv->leds[idx] 
with led = &priv->leds[reg];


>
> I don't see any changes especially the bounds on the reg property.

It is not quite apparent in the diff, but there is such a check. Here is 
what we have in the probe():

     for_each_child_of_node(np, child) {
         struct tlc591xx_led *led;

         err = of_property_read_u32(child, "reg", &reg);
         if (err) {
             of_node_put(child);
             return err;
         }
         if (reg < 0 || reg >= tlc591xx->max_leds ||
             priv->leds[reg].active) {
             of_node_put(child);
             return -EINVAL;
         }
         led = &priv->leds[reg];

[...]
         }
     }

>
> Dan
>
>
>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>> ---
>>   drivers/leds/leds-tlc591xx.c | 79 +++++++++---------------------------
>>   1 file changed, 20 insertions(+), 59 deletions(-)
>>
>> diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
>> index 59ff088c7d75..3d5a4b92f016 100644
>> --- a/drivers/leds/leds-tlc591xx.c
>> +++ b/drivers/leds/leds-tlc591xx.c
>> @@ -128,51 +128,6 @@ tlc591xx_brightness_set(struct led_classdev 
>> *led_cdev,
>>       return err;
>>   }
>>   -static void
>> -tlc591xx_destroy_devices(struct tlc591xx_priv *priv, unsigned int j)
>> -{
>> -    int i = j;
>> -
>> -    while (--i >= 0) {
>> -        if (priv->leds[i].active)
>> - led_classdev_unregister(&priv->leds[i].ldev);
>> -    }
>> -}
>> -
>> -static int
>> -tlc591xx_configure(struct device *dev,
>> -           struct tlc591xx_priv *priv,
>> -           const struct tlc591xx *tlc591xx)
>> -{
>> -    unsigned int i;
>> -    int err = 0;
>> -
>> -    tlc591xx_set_mode(priv->regmap, MODE2_DIM);
>> -    for (i = 0; i < TLC591XX_MAX_LEDS; i++) {
>> -        struct tlc591xx_led *led = &priv->leds[i];
>> -
>> -        if (!led->active)
>> -            continue;
>> -
>> -        led->priv = priv;
>> -        led->led_no = i;
>> -        led->ldev.brightness_set_blocking = tlc591xx_brightness_set;
>> -        led->ldev.max_brightness = LED_FULL;
>> -        err = led_classdev_register(dev, &led->ldev);
>> -        if (err < 0) {
>> -            dev_err(dev, "couldn't register LED %s\n",
>> -                led->ldev.name);
>> -            goto exit;
>> -        }
>> -    }
>> -
>> -    return 0;
>> -
>> -exit:
>> -    tlc591xx_destroy_devices(priv, i);
>> -    return err;
>> -}
>> -
>>   static const struct regmap_config tlc591xx_regmap = {
>>       .reg_bits = 8,
>>       .val_bits = 8,
>> @@ -225,7 +180,11 @@ tlc591xx_probe(struct i2c_client *client,
>>         i2c_set_clientdata(client, priv);
>>   +    tlc591xx_set_mode(priv->regmap, MODE2_DIM);
>> +
>>       for_each_child_of_node(np, child) {
>> +        struct tlc591xx_led *led;
>> +
>>           err = of_property_read_u32(child, "reg", &reg);
>>           if (err) {
>>               of_node_put(child);
>> @@ -236,22 +195,25 @@ tlc591xx_probe(struct i2c_client *client,
>>               of_node_put(child);
>>               return -EINVAL;
>>           }
>> -        priv->leds[reg].active = true;
>> -        priv->leds[reg].ldev.name =
>> +        led = &priv->leds[reg];
>> +
>> +        led->active = true;
>> +        led->ldev.name =
>>               of_get_property(child, "label", NULL) ? : child->name;
>> -        priv->leds[reg].ldev.default_trigger =
>> +        led->ldev.default_trigger =
>>               of_get_property(child, "linux,default-trigger", NULL);
>> -    }
>> -    return tlc591xx_configure(dev, priv, tlc591xx);
>> -}
>> -
>> -static int
>> -tlc591xx_remove(struct i2c_client *client)
>> -{
>> -    struct tlc591xx_priv *priv = i2c_get_clientdata(client);
>> -
>> -    tlc591xx_destroy_devices(priv, TLC591XX_MAX_LEDS);
>>   +        led->priv = priv;
>> +        led->led_no = reg;
>> +        led->ldev.brightness_set_blocking = tlc591xx_brightness_set;
>> +        led->ldev.max_brightness = LED_FULL;
>> +        err = devm_led_classdev_register(dev, &led->ldev);
>> +        if (err < 0) {
>> +            dev_err(dev, "couldn't register LED %s\n",
>> +                led->ldev.name);
>> +            return err;
>> +        }
>> +    }
>>       return 0;
>>   }
>>   @@ -268,7 +230,6 @@ static struct i2c_driver tlc591xx_driver = {
>>           .of_match_table = of_match_ptr(of_tlc591xx_leds_match),
>>       },
>>       .probe = tlc591xx_probe,
>> -    .remove = tlc591xx_remove,
>>       .id_table = tlc591xx_id,
>>   };
