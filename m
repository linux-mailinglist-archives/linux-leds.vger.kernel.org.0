Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F14FE26A67
	for <lists+linux-leds@lfdr.de>; Wed, 22 May 2019 21:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729372AbfEVTBz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 May 2019 15:01:55 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39434 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728615AbfEVTBz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 May 2019 15:01:55 -0400
Received: by mail-lf1-f68.google.com with SMTP id f1so2503567lfl.6;
        Wed, 22 May 2019 12:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uEoVEnOgoQIOVsUijdbKY5vuM1nX7A0dv6I/3RSy7ew=;
        b=Q8GR7AyCgLLiDA4J1oHptuCGq2386/u829OxE/F/wSmCPL7tuT77T50TsbIMepsZ+l
         9hIIEur2w3pOEFSEVkPD15+TtcHkjbT/x78AsgnQhTxkMXy6sB/Wc4DHXgS4kc3XmG77
         9+zNnpQrQBWfzUnjSoUIem/ToLjKK8XmPdfRM7JCSE/XT4vVlcSdhaVnVJwvV//McFyH
         o1/eVZiruvm5/Ykfqj1CHN9Sn9v3IBflAmOCFxtJPCWLvhv7pQOehlmk0hkerIUED4XF
         v6LoxtTxm+Wteg5gyDwhhq6b9ngi0XAKvF7XI29EaDxslo4q5jKlO0IfAamH8hhbAzNc
         mMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uEoVEnOgoQIOVsUijdbKY5vuM1nX7A0dv6I/3RSy7ew=;
        b=cYgN5nSa5fZKT1IuJi2agCe2jpt7oLxWTEvsYIX46I6Jv/7xLYaA0o+qaPabJBgVNp
         SPA+bmCE+eQ1dGo500VssdNHi7u0aqGmeq0t8Rze6Bz/VMkuQ92A+8N2SYn5nDZYb6o9
         HZhuBLTaAoA3wW3Gd2Wy7jC3yzOsI/gYW0LCeiHzGUlPLDK4IhGqmE7mA0V+/JtnruOS
         PFvoiaVBzRFq0HT89hB0cHLhRpaGctcRp40iRtT2Fd1UemG6XlfoxPmmgo7bwqOlXl+/
         n8ub0Jjs9Vm1VlrsNTOe/JfZIRGEDCKGA7TGSfUTbF/8Scv6GHAcM29ZKS2lsskrkeEG
         7c4Q==
X-Gm-Message-State: APjAAAUo9b63psenJjNEMUQzwCTnNwI1oRljhjRRIVI5dpc/LapTXfvm
        p1Ut3oJR+B0tJBzmSTI26hI=
X-Google-Smtp-Source: APXvYqxBYdLOI2//w1W2gCTjZiE/KSvb+hglt6yWk7FOw9OymtOdhrugJi7UsI1c3vjk9A1WiZQ38A==
X-Received: by 2002:a05:6512:507:: with SMTP id o7mr24052117lfb.137.1558551712814;
        Wed, 22 May 2019 12:01:52 -0700 (PDT)
Received: from [192.168.1.17] (dma4.neoplus.adsl.tpnet.pl. [83.24.56.4])
        by smtp.gmail.com with ESMTPSA id d2sm4266204ljc.84.2019.05.22.12.01.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 12:01:52 -0700 (PDT)
Subject: Re: [GIT PULL] Immutable branch between LEDs, MFD and REGULATOR
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org
References: <20190521203038.31946-1-jacek.anaszewski@gmail.com>
 <20190522054256.GA4574@dell>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <3492171a-bcdc-bee2-684c-e1029653a811@gmail.com>
Date:   Wed, 22 May 2019 21:01:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190522054256.GA4574@dell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 5/22/19 7:42 AM, Lee Jones wrote:
> On Tue, 21 May 2019, Jacek Anaszewski wrote:
> 
>> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
>>
>>    Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
>>
>> are available in the git repository at:
>>
>>    git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/ti-lmu-led-drivers
>>
>> for you to fetch changes up to 13f5750a60b923d8f3f0e23902f2ece46dd733d7:
>>
>>    leds: lm36274: Introduce the TI LM36274 LED driver (2019-05-21 20:34:19 +0200)
>>
>> ----------------------------------------------------------------
>> TI LMU LED support rework and introduction of two new drivers
>> with DT bindings:
>>
>> - leds-lm3697 (entails additions to lm363x-regulator.c)
>> - leds-lm36274
>> ----------------------------------------------------------------
>> Dan Murphy (12):
> 
>>        dt-bindings: mfd: LMU: Add the ramp up/down property
>>        dt-bindings: mfd: LMU: Add ti,brightness-resolution
>>        mfd: ti-lmu: Remove support for LM3697
>>        mfd: ti-lmu: Add LM36274 support to the ti-lmu
> 
> These patches were Acked "for my own reference", which means I'd
> at least expect a discussion on how/where they would be applied.
> 
> It's fine for them to go in via the LED tree in this instance and I do
> thank you for sending a PR.  Next time can we at least agree on the
> route-in though please?

Usually ack from the colliding subsystem maintainer means he
acknowledges the patch and gives silent approval for merging
it via the other tree.

This is the usual workflow e.g. in case of massive reworks
of commonly shared kernel APIs.

Your Acked-for-MFD-by tag is not documented anywhere and I've just
found out about its exact meaning :-) Note also that it percolated
to the mainline git history probably because people mistakenly assumed
it was some new convention (despite that checkpatch.pl complains about
it). So far there are 12 occurrences thereof in git. I must admit that
I once unduly made my contribution to that mess.

Of course, now being taught about the exact meaning of the tag,
I will proceed accordingly.

Regarding this one - please hold on for a while with pulling
the stuff, since we may have some updates from REGULATOR maintainers
(hopefully Acked-by).

-- 
Best regards,
Jacek Anaszewski
