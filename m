Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42CEE106D1
	for <lists+linux-leds@lfdr.de>; Wed,  1 May 2019 12:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbfEAKMi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 May 2019 06:12:38 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33310 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbfEAKMi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 May 2019 06:12:38 -0400
Received: by mail-lf1-f65.google.com with SMTP id j11so12856690lfm.0
        for <linux-leds@vger.kernel.org>; Wed, 01 May 2019 03:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZLRQXFqnSHgERdYtPAD334b352Bd9spB6EnItZfR5z8=;
        b=almM/YUdwIr/alfrdRfac0ro90Xn0cmaW2eeTgcG0oBVl2EM4NMqr/0AkvFVziOPFG
         lmHV0CKyek9zm9nlNbdlPhnxBYBeKY2d51uO4Up8gKrrvzNjYH4zkCZxOkH/S+AHG0hb
         P7x1MG9Sir9HZRoCIdvYeOoH33g2bdGoDOkhLLEMWUs7GS79mrMjOvuGRI/Rr1Vc6Q98
         zMiblAeZnsAr9CE5loenupxpFMYJOa+t2gUPn19SpmWSmn3yVtHTJ9l7+yXcHp4sX3LL
         xpKQSVNkicjT5bII+OXISHUu3AXFZEeWQc2bhUMcVf4t+Nz4oNmTgGmSife3gXx4QyU4
         jXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZLRQXFqnSHgERdYtPAD334b352Bd9spB6EnItZfR5z8=;
        b=gElXkOZgfkLEyVsuFU/I7zoUtOjtqbtAiex56Rlhk03Q90tN81oRZ1aW9IP58v/HTD
         Uxka/Z+h8tbjsBTVDDiLKgCYhr47i2NvLQfhFyuNqHTnZ2zbysBs9Tw9pD5wv42DBFoy
         LERVO27a8fzpCWs/drQqVLgGNE7G9eQa3mzfGOttp9YMp0bYkKBIXw0YeWQyLA96wiky
         l2u8G9k7eAboAzgFZehsVswEwds+rpuHgnnLSVQB9INaAgEDzwMD2L8ZwVHgX3NAtmr3
         Ur1WusgGWIaj32Yo1RzCnAbykjDW8pxjF6jlJ0zgls2N8xWO1snM8KwKtEs5g8YtDfMq
         bUJw==
X-Gm-Message-State: APjAAAXYZPPdDkvLtv13fmA0am7qeN33OZqutijocln0UgOlCFgDRBXf
        JTeLevzjbNkvgg72J19Wg7QJxhvk
X-Google-Smtp-Source: APXvYqzJFnTZS90pODL5nOQjIUBByj8ZPUwrdWhBCrP8bTIzY06CVf0FXhVmGirdClHmW5cCHGLYzw==
X-Received: by 2002:ac2:518b:: with SMTP id u11mr6734740lfi.46.1556705556358;
        Wed, 01 May 2019 03:12:36 -0700 (PDT)
Received: from [192.168.1.19] (chf176.neoplus.adsl.tpnet.pl. [83.31.3.176])
        by smtp.gmail.com with ESMTPSA id v26sm8023910lja.60.2019.05.01.03.12.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 03:12:35 -0700 (PDT)
Subject: Re: [PATCH leds/for-next v2 2/2] leds: turris-omnia: Add support for
 256 brightness values
To:     Marek Behun <marek.behun@nic.cz>, Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org
References: <20190429212944.15643-1-marek.behun@nic.cz>
 <20190429212944.15643-3-marek.behun@nic.cz>
 <d2a11183-896c-679f-27c9-4abbba1cb087@gmail.com> <20190430230215.GF20410@amd>
 <20190501024153.643f86f9@nic.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <6e22f510-c105-35af-d424-a641714318b8@gmail.com>
Date:   Wed, 1 May 2019 12:12:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501024153.643f86f9@nic.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Marek,

On 5/1/19 2:41 AM, Marek Behun wrote:
> On Wed, 1 May 2019 01:02:15 +0200
> Pavel Machek <pavel@ucw.cz> wrote:
> 
>> Hi!
>>
>>>> @@ -166,10 +174,19 @@ static int omnia_leds_probe(struct i2c_client *client,
>>>>   static int omnia_leds_remove(struct i2c_client *client)
>>>>   {
>>>> +	u8 buf[5];
>>>> +
>>>>   	/* put all LEDs into default (HW triggered) mode */
>>>>   	i2c_smbus_write_byte_data(client, CMD_LED_MODE,
>>>>   				  CMD_LED_MODE_LED(OMNIA_BOARD_LEDS));
>>>> +	/* set all LEDs color to [255, 255, 255] */
>>>> +	buf[0] = CMD_LED_COLOR;
>>>> +	buf[1] = OMNIA_BOARD_LEDS;
>>>> +	buf[2] = buf[3] = buf[4] = 255;
>>>> +
>>>> +	i2c_master_send(client, buf, 5);
>>>> +
>>>>   	return 0;
>>>>   }
>>>
>>> I wonder if we're doing right merging this driver in this form.
>>> We break the rule one-led-class-device-per-one-channel.
>>> We don't have LED multi color support yet, so this should support
>>> RGB LEDs in the old manner. Or switch to using LED multi color
>>>   class.
>>
>> Fair point.
>>
>> We treat it as a white LED instead of RGB LED at this
>> point. One-led-per-channel would be problematic, as hardware
>> "triggers" are common for all three channels.
>>
>> So I thought we could go from "white" led to multicolor, when it
>> becomes available, without going through One-led-per-channel...
>>
>> I agree this is not quite standard.
>>
>> 									Pavel
> 
> Hi,
> I am aware of this issue. I plan to change the driver to multicolor led
> class as soon as it is available. But from the discussions I have read
> it does not seem it will be available in the next kernel release. I
> would like at least full brigthness for the next release and maybe hw
> triggering, for which the first version I plan to send this week...

If you used led-sources property in your DT bindings it would be all
fine. It will justify having three channels controlled by single LED
class device.

-- 
Best regards,
Jacek Anaszewski
