Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9A252AD9E
	for <lists+linux-leds@lfdr.de>; Tue, 17 May 2022 23:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbiEQVne (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 May 2022 17:43:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiEQVnd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 May 2022 17:43:33 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F239450441
        for <linux-leds@vger.kernel.org>; Tue, 17 May 2022 14:43:31 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id b32so406465ljf.1
        for <linux-leds@vger.kernel.org>; Tue, 17 May 2022 14:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/Lk0dWnUYL2GcfZS9ii9vHWgDU624+QC25Fbs9XMckM=;
        b=noyrKMjChMr0sDD0K70OVv/zTro0c6/wfcxXea24yl++tG+smEHmpiIoDoUCtKhuYY
         ZN/hiy3EeTWwHsDOpll56FSeFam5XoLHQ9CLgP2/4hpWz/hwlK/oIu7bmF9GEPnvqkLo
         xfhiNB3vZzHcx2m19iIBboUBIovROpRMr1xVQ8c+UAfzTt751rM9f/cJSxFmR4XQR+UC
         exauOVU3yLh/KVL1ZhliVtGD94UiHoPQBirGHDlbGsv2DQNpshjHBeKjcNribckjYKc0
         Y50IWDjECjg0vByfoBgba2LIoMUM2C2AMho8zTYvZkCwrhIttJmvxIrEUX3oNwCKXc5i
         Sufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/Lk0dWnUYL2GcfZS9ii9vHWgDU624+QC25Fbs9XMckM=;
        b=ymO4/1DTR6NcBTq0bu1IoyY2BWk0B3alwgHVGf+P6SuIoExzobAyJVO8msx66SC9aP
         lIKKVTUFidY8g5PvvV3hOLpHQEtlFKrYas16pLdmU5S7xbsAYKwKIyeXtqiWBn3DqprV
         t37tZwysgCDJvTwHzaXOCD7SD6fxdFcG8ymqoRaUOUTpWSasc4U70qh/W64URT5Nwmt2
         rJDzvAUCRHqBUfEzSqoGixwx1YSv1H8BEo51UoM9aRjbfZ/yZhKpL1BkCQ57RP9ePIY1
         3EoDENK6we/3fqCM8/IHrnQA1jJc0KwxKlGv48VMRkJV+QfYIpIMhaQotZMkzwIudmPH
         +xTA==
X-Gm-Message-State: AOAM532l1agDo77ZTEpm5fY+1wdGClIPONRxY9/npul3bxFC8eFCBd35
        3BAQi/Ip3q8i5jFdjWOyK29c5eCrplM=
X-Google-Smtp-Source: ABdhPJxT8Sr6vQXFiLWcMF5nvuUwKI6TByCVqi5GCGeWVbDTXVgPA6YT5XdjS56aHVfyHrXoMVwe8A==
X-Received: by 2002:a2e:3908:0:b0:253:c4c5:e82b with SMTP id g8-20020a2e3908000000b00253c4c5e82bmr1256929lja.367.1652823810156;
        Tue, 17 May 2022 14:43:30 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id q8-20020a19a408000000b0047255d2116csm6792lfc.155.2022.05.17.14.43.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 14:43:29 -0700 (PDT)
Message-ID: <4f672091-07da-8815-a00f-659f5a478b0e@gmail.com>
Date:   Tue, 17 May 2022 23:43:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: AW: Setting multi-color intensities stops software blink
Content-Language: en-US
To:     Sven Schuchmann <schuchmann@schleissheimer.de>,
        Sven Schwermer <sven@svenschwermer.de>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Cc:     "pavel@ucw.cz" <pavel@ucw.cz>
References: <4e88850e-9e45-2b47-c857-7070ec87440f@svenschwermer.de>
 <GVXP190MB19172D8DD26648FC9F2EB4D6D9CE9@GVXP190MB1917.EURP190.PROD.OUTLOOK.COM>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <GVXP190MB19172D8DD26648FC9F2EB4D6D9CE9@GVXP190MB1917.EURP190.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 5/17/22 12:29, Sven Schuchmann wrote:
> Hi Sven,
> 
>> -----Ursprüngliche Nachricht-----
>> Von: Sven Schwermer <sven@svenschwermer.de>
>> Gesendet: Dienstag, 3. Mai 2022 14:17
>> An: linux-leds@vger.kernel.org
>> Cc: pavel@ucw.cz
>> Betreff: Setting multi-color intensities stops software blink
>>
>> Hi,
>>
>> I'm experiencing an issue with multi-color LEDs when setting the
>> intensities while software blinking is active (e.g. trigger=timer). This
>> manifests itself by delay_on and delay_off being set to 0 when writing
>> multi_intensities while the LED is off. If doing this while the LED is
>> on, everything works as expected.
> 
> At least I can see the same thing. Setup a led like this:
> echo 255 0 0 | sudo tee /sys/class/leds/rgb\:fbx-led-1/multi_intensity
> echo 100 | sudo tee /sys/class/leds/rgb\:fbx-led-1/brightness
> echo "timer" | sudo tee /sys/class/leds/rgb\:fbx-led-1/trigger
> echo 5000 | sudo tee /sys/class/leds/rgb\:fbx-led-1/delay_on
> echo 5000 | sudo tee /sys/class/leds/rgb\:fbx-led-1/delay_off
> 
> Change the color afterwards while the LED is in the "on" cycle
> echo 0 255 0 | sudo tee /sys/class/leds/rgb\:fbx-led-1/multi_intensity
> no problem, on the next "on" cycle the led has the new intensity
> 
> Change the color afterwards while the LED is in the "off" cycle
> echo 0 255 0 | sudo tee /sys/class/leds/rgb\:fbx-led-1/multi_intensity
> the led stays off because delay_on and delay_off is 0.
> 
> This also looks like incorrect behavior to me.
> 
>> I suspect that this happens because multi_intensity_store() calls
>> led_set_brightness(led_cdev, led_cdev->brightness) at the end. It seems
>> like the software blinking modifies led_cdev->brightness directly, so if
>> the LED is in its off-phase, we're effectively switching the LED off
>> because we're setting its brightness to 0 which clears delay_on and
>> delay_off to 0:
>>
>> led_set_brightness(brightness=0): sets LED_BLINK_DISABLE
>>    -> set_brightness_delayed()
>>     -> led_stop_software_blink(): clears blink delays
>>
>> How would one fix this properly? Should multi_intensity_store() call
>> led_set_brightness() with brightness=led_cdev->blink_brightness if
>> blinking is active? That feels like an unclean solution.
>>
>> I'm hoping for some input. Thanks :)
> 
> To me this looks wrong:
> 
> void led_set_brightness(struct led_classdev *led_cdev, unsigned int brightness)
> {
> 	/*
> 	 * If software blink is active, delay brightness setting
> 	 * until the next timer tick.
> 	 */
> 	if (test_bit(LED_BLINK_SW, &led_cdev->work_flags)) {
> 		/*
> 		 * If we need to disable soft blinking delegate this to the
> 		 * work queue task to avoid problems in case we are called
> 		 * from hard irq context.
> 		 */
> 		if (!brightness) {
> 			set_bit(LED_BLINK_DISABLE, &led_cdev->work_flags);
> 
> I think it is wrong to ask for the brightness over here when we know
> that the led is blinking and could be currently in it's off cycle.
> 
> 			schedule_work(&led_cdev->set_brightness_work);
> 		} else {
> 			set_bit(LED_BLINK_BRIGHTNESS_CHANGE,
> 				&led_cdev->work_flags);
> 			led_cdev->new_blink_brightness = brightness;
> 
> I think the else path could always be done regardless of the brightness?

This construct was introduced to let the new brightness be applied only
upon the next blink, so as to avoid an interference of the blink
sequence.

To fix the issue it could suffice to let led_set_brightness()
be called in multi_intensity_store() only if SW blinking is disabled.
When enabled the new color will be applied upon the next blink anyway,
and the behavior will match that of monochrome LEDs.

-- 
Best regards,
Jacek Anaszewski
