Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A590196D8B
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2020 14:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728065AbgC2MyC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 29 Mar 2020 08:54:02 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42851 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727951AbgC2MyB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 29 Mar 2020 08:54:01 -0400
Received: by mail-wr1-f67.google.com with SMTP id h15so17586115wrx.9
        for <linux-leds@vger.kernel.org>; Sun, 29 Mar 2020 05:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9ULzXhLiAYaATPFpvnEalIX5kXyLs1u7brOKKiaSR7o=;
        b=d4E6hpK5d326/XLdBGg7XHnbgY0IJ7RDh1vduK/f0aeQwyqTg1sbmKPjmEKVe7NReS
         k9hd8QJ3k9ZJCw+rKefNg8V4/u95t8URgyXurnGJh2bfuc4EuKlktrwBEcqnWlVipBTh
         nsOhubwRweli/Be+VFFWAKYcTYgYOpAuIQY4M3AfNgcupRR6WaangvzUd7FLA9n94Rcf
         tSSJ2kR3KhowOrMUE4JQ4sXSLXBdUETSMCvmZtAP/VTucDCa4xTWB4baK5Txq/ozpDZs
         2fdXs/Aure5+vmTLi69VA/HLwxJsKjPZUZQRiO1LFgh57cLyNxaOSJzMz0OFpBWRXjeC
         R8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=9ULzXhLiAYaATPFpvnEalIX5kXyLs1u7brOKKiaSR7o=;
        b=C7kq8dD7nv99WdQrgVvTGRigVN3XuZ5Plgl1pSv+ZTtMCcMzqScjTNWdT3l18Pfckf
         S90Qnfo7Ko5lw7wuVbmuiZJbcQDyl9DiqzGh3/bq9Pn7WpfzeGTsBezKpcnqKVtgK5Lj
         u5vaDPJLN0B05mxPvWhaeNZdXMXt6vtiYR7OF83J3E2lYmu7CRtfMqXl1ObbLog3gOwX
         nmI3OICtG4WngxlQkj1CZi96KJhOzYqN5Lp5aeBFr/LKUcMisVDRtogdcnIBpRh67ADA
         /s8kLIRRmkvoF0t7php/Clu+8mpBn6vDnJYyM2rCjLoOubnhkuT73BHdnyb1O5sJLnOa
         dgQA==
X-Gm-Message-State: ANhLgQ0OYE0AN2Ej6O9u1OdRhbleVx1H9w1aGD/iP7R37cZVCrVr3vDr
        HluB9Iemv+NlJjezzeb93mkG6scn
X-Google-Smtp-Source: ADFU+vv9+6fyE21vcNOGhawWGd1h4ivrL6AlVelyD2qq9DfuLodBHPvmsfUSII1Z02kMdigxSBsafA==
X-Received: by 2002:a5d:6045:: with SMTP id j5mr9583166wrt.401.1585486439232;
        Sun, 29 Mar 2020 05:53:59 -0700 (PDT)
Received: from [192.168.1.23] (afdc26.neoplus.adsl.tpnet.pl. [95.49.80.26])
        by smtp.gmail.com with ESMTPSA id b199sm13186326wme.23.2020.03.29.05.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2020 05:53:58 -0700 (PDT)
Subject: Re: [PATCH RFC leds-next] leds: initial support for Turris Omnia LEDs
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
References: <20200319181604.2425-1-marek.behun@nic.cz>
 <20200321153325.GD8386@duo.ucw.cz>
 <943a5770-ea9c-24ac-5ab3-a9a24fc6a856@gmail.com>
 <20200328132729.5e628fe6@nic.cz> <20200328133629.79603fe3@nic.cz>
 <00b6737b-47f8-7ea4-74b7-eee3d2aefdf3@gmail.com>
 <20200328182025.0b33200e@nic.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <7a12c510-605c-b31f-79e6-cccf3e29c682@gmail.com>
Date:   Sun, 29 Mar 2020 14:53:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200328182025.0b33200e@nic.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Marek,

On 3/28/20 6:20 PM, Marek Behun wrote:
> On Sat, 28 Mar 2020 14:01:47 +0100
> Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
> 
>> I already proposed adding a "luma" LED class device for similar
>> case [0], but didn't here any feedback from Pavel so far.
>>
>> [0]
>> https://lore.kernel.org/linux-leds/1583502010-16210-1-git-send-email-nbelin@baylibre.com/T/#mf52c8d4f68260a445223c26957c61e6267e0932d
>>
> 
> Hi Jacek,
> 
> in the case you mentioned there is a one "global" brightness setting per
> each RGB LED. On Omnia, all 12 RGB LEDs have just one "global"
> brightness property. Ie. I press the button, and all 12 LEDs glow get
> dimmer. So there could be a 13th LED device with color LUMA, but what
> function should it be given in DTS?

Then, in this particular case, adding devicename prefix for the whole
family of LEDs would be justified. The question is whether it should be
hardware related name or rather something different.

-- 
Best regards,
Jacek Anaszewski
