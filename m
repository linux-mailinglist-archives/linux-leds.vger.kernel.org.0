Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5A1211B7D
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2020 07:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgGBFU2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Thu, 2 Jul 2020 01:20:28 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:60339 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgGBFU1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 2 Jul 2020 01:20:27 -0400
Received: from mail-pf1-f200.google.com ([209.85.210.200])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jqre5-0003nn-73
        for linux-leds@vger.kernel.org; Thu, 02 Jul 2020 05:20:25 +0000
Received: by mail-pf1-f200.google.com with SMTP id y69so18160464pfg.9
        for <linux-leds@vger.kernel.org>; Wed, 01 Jul 2020 22:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=6e32vjSNKDV1WWSzS/D6MXycMTkb/C1potgYwNx0dnw=;
        b=aMGtbi/BbgnaSivrUlDMZtS6yux+UaxX4xbHSPobnkIgajW0lPgReStP5TNf0Zlu2Z
         wVKJNcicoUnpCtMer3axFBW4o101nj1tY3SUXLj5rqbta3q3qNOA/OfyYHBNHhrRD16A
         R/TBa1SEpVM5YF3La0I+zhtYIM3i2dYYkOi279oa6kMGtH6PHHRImiuf8iP5wIHuVFpA
         5MfOSpR+MBCKWuLu9F+yuVziwNLFPhzGhxvFrboszMdUqk8nFCW69ymX4/9kG1TVZcmC
         aPemtMHclLjcEGUJ9ph75WzoNtqDwPGM2BKGcELcCb6+kkHYbQP4P6CpBD6JXLxjO/Dv
         L00g==
X-Gm-Message-State: AOAM531qfuu6P2DY2lyUIYf59VCw/lAuovdrzpRTRfOk7ayin0O9XKXo
        yWRfhCjwjYVpIDZKoS9esPEDsHW+c7fnC1GimpZa50U2TQf+2DgXlDK+BXFFuiTSUlbH+lE6VU9
        9E03S1jKyHl0StSnhWjVJuAhR+wEb57rM0NDkHp0=
X-Received: by 2002:a17:902:8204:: with SMTP id x4mr19055747pln.16.1593667223899;
        Wed, 01 Jul 2020 22:20:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxE1DSUfFIceznr3PtH7TjS1qSOYNMqQsM3HOgI6x3SHa8gkiMPjMvGWgqs93wUsfWDu9bs7g==
X-Received: by 2002:a17:902:8204:: with SMTP id x4mr19055738pln.16.1593667223604;
        Wed, 01 Jul 2020 22:20:23 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id q7sm7378860pfn.23.2020.07.01.22.20.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Jul 2020 22:20:23 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] leds: core: Use blocking op for system suspend
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <38622f5a-4518-cdb4-d1ca-581f470ce797@gmail.com>
Date:   Thu, 2 Jul 2020 13:20:21 +0800
Cc:     pavel@ucw.cz, anthony.wong@canonical.com,
        Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <75B39716-5795-4F19-BC74-A4C21F99B85E@canonical.com>
References: <20200701093541.14191-1-kai.heng.feng@canonical.com>
 <38622f5a-4518-cdb4-d1ca-581f470ce797@gmail.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



> On Jul 2, 2020, at 05:28, Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
> 
> Hi Kai-Heng,
> 
> Thank you for the patch.
> 
> On 7/1/20 11:35 AM, Kai-Heng Feng wrote:
>> Sometimes LED won't be turned off by LED_CORE_SUSPENDRESUME flag upon
>> system suspend.
> 
> Just out of curiosity - are you experiencing that on some hardware?

Yes, mute and micmute LED on laptops sometimes are still on during suspend-to-idle.

> 
>> led_set_brightness_nopm() uses schedule_work() to set LED brightness.
>> However, there's no guarantee that the scheduled work gets executed
>> because no one calls flush_scheduled_work().
>> As flush_scheduled_work() may affect other drivers' suspend routines,
>> take a more contained approach which uses blocking op to make sure the
>> LED gets turned off.
>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> ---
>>  drivers/leds/led-core.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
>> index f1f718dbe0f8..9a5bfcd7a704 100644
>> --- a/drivers/leds/led-core.c
>> +++ b/drivers/leds/led-core.c
>> @@ -269,6 +269,11 @@ EXPORT_SYMBOL_GPL(led_set_brightness);
>>  void led_set_brightness_nopm(struct led_classdev *led_cdev,
>>  			      enum led_brightness value)
>>  {
>> +
>> +	if (led_cdev->flags & LED_SUSPENDED &&
>> +	    !__led_set_brightness_blocking(led_cdev, value))
>> +		return;
>> +
> 
> This function is "nopm" for a reason - we do not make here any
> pm management related operations.
> 
> Instead of that, please just add
> 
> flush_work(&led_cdev->set_brightness_work);
> 
> at the end of led_classdev_suspend()
> 
> in drivers/leds/led-class.c.

Right, will send v2.

Kai-Heng

> 
> -- 
> Best regards,
> Jacek Anaszewski

