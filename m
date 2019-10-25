Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FAB4E5404
	for <lists+linux-leds@lfdr.de>; Fri, 25 Oct 2019 20:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbfJYS4f (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 25 Oct 2019 14:56:35 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44596 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbfJYS4f (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Oct 2019 14:56:35 -0400
Received: by mail-wr1-f67.google.com with SMTP id z11so3483739wro.11;
        Fri, 25 Oct 2019 11:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bL9RvK4Bbx/tHsfNCPFMwbh2KGibGJJHBNHGgCM8ryo=;
        b=fVkUP3PsANHiPz/aanWiA7kft6DXhmU4MplV6DHdzzGzMeejJ5ItpqADixEVwCvL6Z
         RoiEreeIOWvXh8CMJ4KLgo6SvUrqWdhstJ7rspHy2rv5HxROEoem6hilpMBI06uenIlJ
         5VJey5uOFSXm7m2XK/3SI5+fFaM6epr6C8QC+4Mhv/Z42a+iffnjEyzsl7P8rGE5swA/
         Q1wRh8dq1P+V3EcohbcQNiNR1ygGE+scNfYcFul8bDygjU+r6ITaPR8+0NZ0jKwqns/k
         6EkiVCpqUjhC3wQM3x3I7vDOXEZamtuu58SpG/KCTo+yy6stLzBdrRNlhsn01CGpbC9d
         hLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=bL9RvK4Bbx/tHsfNCPFMwbh2KGibGJJHBNHGgCM8ryo=;
        b=T6EkJCU5zJHHF1uQUvoxsY8tTI+aWrhAOwjLtjK/7IpUHFUzM18yyWC53RYu8f7zE0
         PUyDCMYPvwFZWJVEefaAADds+T/YBH8wRD9JjeUw5stJRfoDDzLY+gSSElwnD4QK+d4q
         w+/OmCVLjl628sy8ze33H+HeqXk65HbTOMdljddmm0v4dGq5GljDD4EVzsDjjnPv2cmo
         sOJj9ZyDcO7EgYnCbH6q4RFW9K+hB5hj9/z1+0HVaHk1Fc2q0S2vugykq7gouZYZwPrZ
         hLJLLU+W2ZFSdKEg0NzjpksO1VjB7Cj0QluZl1+T/cO3Nhp9E4l08NrCjjqHYUZKC+wv
         71iQ==
X-Gm-Message-State: APjAAAWdWSvMFnK3Wf6JVlAXXJhuV3ocK/mqCAddH9OO3N8b4idCS8Q/
        b2FEIt7O3c83soQYBzxWwpt2DbLB
X-Google-Smtp-Source: APXvYqzGMYOC0hu+B7xaNcckTpxWHaWr+NoS3HP8a/44b6OlQnrnSyEFPdpYI5E/UO6rNvZU+McyqA==
X-Received: by 2002:adf:f90f:: with SMTP id b15mr4432321wrr.76.1572029791892;
        Fri, 25 Oct 2019 11:56:31 -0700 (PDT)
Received: from [192.168.1.19] (cjk163.neoplus.adsl.tpnet.pl. [83.31.60.163])
        by smtp.gmail.com with ESMTPSA id f8sm2840689wmb.37.2019.10.25.11.56.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Oct 2019 11:56:31 -0700 (PDT)
Subject: Re: [PATCH v14 13/19] leds: lp55xx: Add multicolor framework support
 to lp55xx
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191018122521.6757-1-dmurphy@ti.com>
 <20191018122521.6757-14-dmurphy@ti.com>
 <a24832d9-1c3d-b3ea-4326-2ef4937d5a59@gmail.com>
 <c9a704d4-b411-59f1-02bf-3ea7b219c4b4@gmail.com>
 <e1b84d15-d670-9393-aa65-85120e522a35@ti.com>
 <0cd2082a-16d7-c414-7bd2-708a97885da1@gmail.com>
 <b469d35b-ca39-2a99-1e86-420edcabf1ac@ti.com>
 <bfcae4c2-aa4d-8460-528f-6029d7a87b4d@gmail.com>
 <74868064-6a40-172e-ce28-94722e1f1aaf@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <7814c28c-ed38-24f0-6ff2-d89c918b617e@gmail.com>
Date:   Fri, 25 Oct 2019 20:56:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <74868064-6a40-172e-ce28-94722e1f1aaf@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 10/25/19 8:18 PM, Dan Murphy wrote:
> Jacek
> 
> On 10/25/19 1:13 PM, Jacek Anaszewski wrote:
>> Dan,
>>
>> On 10/25/19 7:57 PM, Dan Murphy wrote:
>>> Jacek
>>>
>>> On 10/22/19 12:41 PM, Jacek Anaszewski wrote:
>>>> Dan,
>>>>
>>>> On 10/22/19 6:37 PM, Dan Murphy wrote:
>>>>> Jacek
>>>>>
>>>>> On 10/18/19 4:56 PM, Jacek Anaszewski wrote:
>>>>>> On 10/18/19 11:48 PM, Jacek Anaszewski wrote:
>>>>>>> Dan,
>>>>>> +        ret = lp5xx_parse_channel_child(child, cfg, i);
>>>>>>> I went into details of this parsing and finally came up with
>>>>>>> the code which is a bit greater in size, but IMHO cleaner.
>>>>>>> Note changes in variable naming. It is not even compile-tested.
>>>>>>>
>>>>>>> static int lp55xx_parse_common_child(struct device_node *np,
>>>>>>>                                        struct lp55xx_led_config
>>>>>>> *cfg,
>>>>>>>                                        int led_number, int *chan_nr)
>>>>>>> {
>>>>>>>            int ret;
>>>>>>>
>>>>>>>            of_property_read_string(np, "chan-name",
>>>>>>>                                    &cfg[led_number].name);
>>>>>>>            of_property_read_u8(np, "led-cur",
>>>>>>>                                &cfg[led_number].led_current);
>>>>>>>            of_property_read_u8(np, "max-cur",
>>>>>>>                                &cfg[led_number].max_current);
>>>>>>>
>>>>>>>            ret = of_property_read_u32(np, "reg", chan_nr);
>>>>>>>            if (ret)
>>>>>>>                    return ret;
>>>>>>>
>>>>>>>            if (chan_nr < 0 || chan_nr > cfg->max_chan_nr) /* side
>>>>>>> note:
>>>>>>> new
>>>>>>> max_chan_nr property needed in cfg */
>>>>>>>                    return -EINVAL;
>>>>>>>
>>>>>>>            return 0;
>>>>>>> }
>>>>>>>
>>>>>>> static int lp55xx_parse_mutli_led_child(struct device_node *np,
>>>>>>>                                            struct lp55xx_led_config
>>>>>>> *cfg,
>>>>>>>                                            int child_number,
>>>>>>>                                            int color_number)
>>>>>>> {
>>>>>>>            int chan_nr, color_id;
>>>>>>>
>>>>>>>            ret = lp55xx_parse_common_child(child, cfg, child_number,
>>>>>>> color_number,
>>>>>>>                                            &chan_nr);
>>>>>>>            if (ret)
>>>>>>>                    return ret;
>>>>>>>
>>>>>>>            ret = of_property_read_u32(child, "color", &color_id);
>>>>>>>            if (ret)
>>>>>>>                   return ret;
>>>>>>>
>>>>>>>           
>>>>>>> cfg[child_number].color_components[color_number].color_id =
>>>>>>> color_id;
>>>>>>>          
>>>>>>> cfg[child_number].color_components[color_number].output_num =
>>>>>>> chan_nr;
>>>>>>>            set_bit(color_id, &cfg[child_number].available_colors);
>>>>>>>
>>>>>>>            return 0;
>>>>>>> }
>>>>>>>
>>>>>>> staitc int lp55xx_parse_mutli_led(struct device_node *np,
>>>>>>>                                      struct lp55xx_led_config *cfg,
>>>>>>>                                      int child_number)
>>>>>>> {
>>>>>>>            struct device_node *child;
>>>>>>>            int num_colors = 0, i = 0;
>>>>>> s/, i = 0//
>>>>>>
>>>>>>>            for_each_child_of_node(np, child) {
>>>>>>>                    ret = lp55xx_parse_mutli_led_child(child, cfg,
>>>>>>> num_colors,
>>>>>>>                                                      
>>>>>>> child_number, i))
>>>>>> Replace above call with below:
>>>>>>
>>>>>> ret = lp55xx_parse_mutli_led_child(child, cfg, child_number,
>>>>>> num_colors);
>>>>>>
>>>>> I applied your DT parser patch from the v13 series.  Which eliminates
>>>>> this comment correct?
>>>> Yes, it contains this fix.
>>>>
>>> OK I added your patch and it broke a lot of the DT parsing for the
>>> LP55xx.
>>>
>>> I would prefer to stick with the original code without having to
>>> re-write this again.
>> Let me test that with Qemu first.
>>
> max_channel is never set so not sure where that is supposed to come from
> since each child device has different number of channels.  And if the
> user has to populate that information from the DT then it does not make
> sense as the user would already be aware of the number of channels. 
> This information would have to come from the child device some how and
> the children do not have access to the structure to set it.

This was my silent assumption that the child will initialize that.
And I was not thoroughly seeking the most proper place for this
property, just chose first I could think . You are free to
change its location so that it was accessible for the child.

> 
> In checking the chan_nr to the max_channels you are comparing a pointer
> to an integer.  Easy fix but did not solve the registration issues.
> 
> cfg->num_colors is not set anywhere so the registration always goes to
> base led_registration.  Unless we key off a different value to determine
> to register to multicolor class or not.  Or we default this to the
> multi_class registration to figure out how to register based on
> available_colors.

You need to add below at the end of lp55xx_parse_mutli_led():

cfg[child_number].num_colors = num_colors;

and below in led_parse_logical_led() at the end of the
"if (ret)" branch.

cfg[child_number].num_colors = 1;

> That is what I am seeing so far in my debugging and I still don't have
> it working.

I didn't pretend it was flawless, just wanted to show general idea
how I would see that.

-- 
Best regards,
Jacek Anaszewski
