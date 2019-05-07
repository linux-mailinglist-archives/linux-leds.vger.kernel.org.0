Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2CD116AE2
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2019 21:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbfEGTIy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 May 2019 15:08:54 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:40998 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfEGTIy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 May 2019 15:08:54 -0400
Received: by mail-lj1-f169.google.com with SMTP id k8so15310228lja.8
        for <linux-leds@vger.kernel.org>; Tue, 07 May 2019 12:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=K4SAe1uE51E/qcnqirhzGBB2y2hxVILXUoaFnngpIoI=;
        b=F9VcrDUc4J5rkHk2Gjid0GiMJHgfrl0tmz5N5SUMAx/H8oFBoA1AWB4SWn7mm2CpTB
         GSE6wrmov6jZVay7KeZ2XN76s0IL7TMOeginvEbf4ZOokZl4z8lypAgueIK81i5vWTHh
         Q13WdmfDEeaEvDzwHongOklIkMTUVw4v6bpU45m+bhm2Yn3Db7LupooywdnGfd+pwBfO
         gsYicqu2cKuXzfdlFFuqzFbU0mDrU0+laApggS/lcO9wmgvPbmxovCR+qsHSKsosz15j
         LFXEhQLMcyuOyGqbsw81PN8V7zSVqVLzctTDR5EUwUro2BAPbH2WSYPX0OHS1xBfV+1i
         4/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=K4SAe1uE51E/qcnqirhzGBB2y2hxVILXUoaFnngpIoI=;
        b=d0RNEo6XxPQv6GTPdSpMh2/krrS44yBk1NZ42viEc7C5fi3+IGAmUcRFb2sjGABpAM
         7CQp/Zsf9cCqRz4VEHbzlsIpzkYXsfoxM8vyxZfMbmk+PQuInzPhUXgSunPSDop2Vgu8
         owd2iCF8tLTGlU6kXLts+aU4Gi/FLCC479ZReqNCuUO8ZnF9a7NELHaaLqcCOfisDMYG
         4uzmyHkRPx3cnrKiTsKNlneEIJ9W77cl2qY/yIpOddjdre/HnyDpWZVSJ1ppNwW7dRZg
         c8FjuB2DUzuuUD3gopSqwTTYBpQJ4TxzzScBiFVTeqRrlfHF+30tamVGxHRzyMAxi9J2
         K8GQ==
X-Gm-Message-State: APjAAAX2/T4A5l7LkNDy+G5kOcJ9jkoVwDDzlgVUNHRuia1xijVwfqe9
        dqmcsjx6biE7fykkTecrG5XUUOJ+o/w=
X-Google-Smtp-Source: APXvYqwyV0VPZuFCdqu6I3k4h7r12nNgd82aa3NZ69Ue6mmbnYd4Pr7JIDXMYqT2CzcaTWPagsq22g==
X-Received: by 2002:a2e:9002:: with SMTP id h2mr3208849ljg.164.1557256131890;
        Tue, 07 May 2019 12:08:51 -0700 (PDT)
Received: from [192.168.1.19] (bgw158.neoplus.adsl.tpnet.pl. [83.28.86.158])
        by smtp.gmail.com with ESMTPSA id e14sm3862766ljk.45.2019.05.07.12.08.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 12:08:50 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: LEDs on thinkpad
To:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
References: <20190505211117.GA30428@amd>
Message-ID: <b0674601-fe27-532a-8a23-57229959a74d@gmail.com>
Date:   Tue, 7 May 2019 21:08:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190505211117.GA30428@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 5/5/19 11:11 PM, Pavel Machek wrote:
> Hi!
> 
> Thinking about standartized names... would we have good mapping for
> thinkpad in the "new" framework?
> 
> 									Pavel
> 
> tpacpi::power -- system is on

Initially there was "system" on my list, but here the question
is when the LED is lit. After system boot completes?

> tpacpi::standby -- system is sleeping, blinking when system is
> 		   entering hibernation

All power saving states are defined to "System sleep states"
in Documentation/admin-guide/pm/sleep-states.rst, so maybe
having "sleep" function name is not that redundant.

Effectively, I propose: ":sleep"

> tpacpi:green:batt -- battery LED, off when battery is not present,
> 		     yellow / blinking when it is low.

And green when it is full I assume? Is it multi color LED?

> tpacpi:orange:batt

When is it lit?

> tpacpi::thinklight -- keyboard light (on top of display) -- would we
> call it kbd_backlight even if it is not technically a backlight?

It is not __back__ light. kbd_frontlight ? kbd_toplight ?

> It also has these leds not controlled by software (in my config):

What does it mean? Is it possible to control them via GPIOs or so?

> 
> "AC is connected"
> "disk activity"
> "bluetooth"
> "wifi"
> 

-- 
Best regards,
Jacek Anaszewski
