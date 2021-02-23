Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38C3B322833
	for <lists+linux-leds@lfdr.de>; Tue, 23 Feb 2021 10:58:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232088AbhBWJ4T (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Feb 2021 04:56:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43522 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232069AbhBWJyM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 23 Feb 2021 04:54:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614073958;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XBaCiawHuHxF7z3D+NjLyiPcqq6H/HI2WrKdgh3jyJY=;
        b=b9DLPeMD6atuMkVs1whn1qAYfmZoo9efvukfnoiULITbaizIeTVq2toOWh3dLOSRDi0hQk
        x3+0MbfLax2PJaZ68RYYyQhEeW1679CTNC15Y6isvabNUJW6ZfKulXs+bmmQ24YLjP4lQ8
        xDdEOuo0A53odgoBbRwDsj+msT1lpU4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-X0XkvfoyMm2WqJ4jCsOuEQ-1; Tue, 23 Feb 2021 04:52:37 -0500
X-MC-Unique: X0XkvfoyMm2WqJ4jCsOuEQ-1
Received: by mail-ej1-f71.google.com with SMTP id yd24so5119854ejb.9
        for <linux-leds@vger.kernel.org>; Tue, 23 Feb 2021 01:52:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XBaCiawHuHxF7z3D+NjLyiPcqq6H/HI2WrKdgh3jyJY=;
        b=gzlng66xRuYygSO2PY1beMLkYrv2IJbL0QO/icCFJ6abrvJlQEX1t/5wxnvh4TsyM7
         1QCbrZo9s+OhBE9pWpGjkMsZF95sY3tOjHAvV5/rLYFTjw1kkyLIhtdnjkLEE/Pj2DDW
         3ld9XDMQ8cah6WThPzxhYxZsTpOUJnCVvNiyPRjZKM0uZsrbj8O7lIhvEz7JEB+G4t7K
         LJLQNOcELzAHafTLiZ0In83R/cUCw0BnGvSrmrSDg3uQdQaIyDSYYE9ofo/dWDK2xyh2
         J9ZrL7eKjgQ3a+2Za0PMOuv22hRwdbs4EKqlXB4ECzkcPrV5HwW8qs0cN7MsobYR0hDE
         mn8A==
X-Gm-Message-State: AOAM531P1zhVwOfCuHwmIfNI4XNh9rnU377lQjvku5RVw1Ciftyl3XYN
        jF1hgtPmmERbpGHzrNGxv1RUykJvG1dRTA/CgVBkBh2FBmKXcbmbrL/Z15FsIL2uGLDQDk2ZLhV
        fzU0jPbZST/rqAg8vlt4b2A==
X-Received: by 2002:a05:6402:893:: with SMTP id e19mr17439894edy.206.1614073955758;
        Tue, 23 Feb 2021 01:52:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweuDHvamB9xP8reZNw7UlHYvMPZ07GR1VWJy1ZAQV5CHfJXceMQoMzDN8k5sn6ryEOwgoLwg==
X-Received: by 2002:a05:6402:893:: with SMTP id e19mr17439880edy.206.1614073955590;
        Tue, 23 Feb 2021 01:52:35 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id bn2sm12402271ejb.35.2021.02.23.01.52.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Feb 2021 01:52:35 -0800 (PST)
Subject: Re: [PATCH v2] leds: trigger: audio: Add an activate callback to
 ensure the initial brightness is set
To:     Pavel Machek <pavel@ucw.cz>
Cc:     =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
        linux-leds@vger.kernel.org, alsa-devel@alsa-project.org,
        Takashi Iwai <tiwai@suse.de>
References: <20210221115208.105203-1-hdegoede@redhat.com>
 <20210223091230.GI9750@amd>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6d5f521e-0484-cb22-fde5-8a6e133075a5@redhat.com>
Date:   Tue, 23 Feb 2021 10:52:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210223091230.GI9750@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 2/23/21 10:12 AM, Pavel Machek wrote:
> Hi!
> 
>> Some 2-in-1s with a detachable (USB) keyboard(dock) have mute-LEDs in
>> the speaker- and/or mic-mute keys on the keyboard.
>>
>> Examples of this are the Lenovo Thinkpad10 tablet (with its USB kbd-dock)
>> and the HP x2 10 series.
>>
>> The detachable nature of these keyboards means that the keyboard and
>> thus the mute LEDs may show up after the user (or userspace restoring
>> old mixer settings) has muted the speaker and/or mic.
>>
>> Current LED-class devices with a default_trigger of "audio-mute" or
>> "audio-micmute" initialize the brightness member of led_classdev with
>> ledtrig_audio_get() before registering the LED.
>>
>> This makes the software state after attaching the keyboard match the
>> actual audio mute state, e.g. cat /sys/class/leds/foo/brightness will
>> show the right value.
> 
> Makes sense.
> 
>> +++ b/drivers/leds/trigger/ledtrig-audio.c
>> @@ -6,10 +6,33 @@
>>  #include <linux/kernel.h>
>>  #include <linux/leds.h>
>>  #include <linux/module.h>
>> +#include "../leds.h"
>>  
>> -static struct led_trigger *ledtrig_audio[NUM_AUDIO_LEDS];
>>  static enum led_brightness audio_state[NUM_AUDIO_LEDS];
>>  
>> +static int ledtrig_audio_mute_activate(struct led_classdev *led_cdev)
>> +{
>> +	led_set_brightness_nosleep(led_cdev, audio_state[LED_AUDIO_MUTE]);
>> +	return 0;
>> +}
> 
> Is mute_activate called from atomic context?

All the other ledtrig-foo.c activate callbacks use led_set_brightness_nosleep(),
so yes I would assume so (I did not check, I assumed the others have good
reasons to do this).

Regards,

Hans

