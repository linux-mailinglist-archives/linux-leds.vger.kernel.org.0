Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 320CF26CBE
	for <lists+linux-leds@lfdr.de>; Wed, 22 May 2019 21:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387531AbfEVThG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 May 2019 15:37:06 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43407 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732618AbfEVThG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 May 2019 15:37:06 -0400
Received: by mail-lj1-f193.google.com with SMTP id z5so3189475lji.10;
        Wed, 22 May 2019 12:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kTgWZ3K7r6lt/65GKfZw+x+nRdHJpmGBMMkma7644Cc=;
        b=i242Zrk+hzyQGkdfw6ojwHiLhqdtCJt7wsI94VAFO+mwxfAcUxvGjE0cXpVavvPGxp
         NVHkOwxSCSPRHYtv0FmXIDMQaIQYhRADhnFxlByC85Agx2MQ/7Ql3Naj1RTGkOOyx9SY
         zkGDiwl/Y3anJniDbA7CKZ8aM9VNyfSe93gZ3ogJzFBLBCJOQB4qPgdL5ceIzfN7gUI0
         1Ox9LqaZ0vDHrbq3dTf7M9EAHYkUN4wTsf2aAJb8vX9F3Uh0CGkg3tgziF3M8QMotrRM
         MN8ReZOdHd442VrzsAHYnsJvQGH9O0Rsu4Eo5qpAcgk6u4/3eeALC6V398UbR7GipvFw
         7qxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kTgWZ3K7r6lt/65GKfZw+x+nRdHJpmGBMMkma7644Cc=;
        b=KHD0RiTtKu7wbtPa43egFQrRrgZnKxpxgX49d/kKYa23tXveTOAbgpFb3ev3/T+yry
         9WrMRKa6hxxWeQwF906b9ULN0muWrD30wyHty2pNOkJThG0xrs8D2aN6nn3yhl5nVLe6
         DNPjCrA2zfwJDbLHPImb/dIiun0hDAMdYiNHQLXr/4XebNCB0h4bm6uOhsuv+lsM7QiD
         AqIabX8uO8aixMGSA80RV9LSW4v7IjZytNxkqMgN1ZZS2umZfLxFeKnhJ8El/LU8qRR+
         a/CL7zDenDkga2zzL96UVxeJkNr21YLt/qKDl/oxellJ3lJnMer9p6+x0qesaKcrOVVt
         3cTQ==
X-Gm-Message-State: APjAAAWJlfmXHaD2XT7EEK/vTSRmoWYzgVHSfDg+m+H5TLRLDwzPEmUp
        onSdBJ4pMQAdzSx2jZu2hg0EDGPt
X-Google-Smtp-Source: APXvYqww7E+qykMqOU4l7XPoS+TDnZZfFMiOgj6vaK3ZeFXfOjy7KFBjxCC9vKaPrW5F57JpCN5pbA==
X-Received: by 2002:a2e:890c:: with SMTP id d12mr41217504lji.107.1558553823588;
        Wed, 22 May 2019 12:37:03 -0700 (PDT)
Received: from [192.168.1.17] (dma4.neoplus.adsl.tpnet.pl. [83.24.56.4])
        by smtp.gmail.com with ESMTPSA id m63sm5475047lje.44.2019.05.22.12.37.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 12:37:02 -0700 (PDT)
Subject: Re: [PATCH v4 0/6] LM36274 Introduction
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz, broonie@kernel.org,
        lgirdwood@gmail.com
Cc:     lee.jones@linaro.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190522192733.13422-1-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <6501a8b5-8068-4c9d-6b51-ef00fa72c6d5@gmail.com>
Date:   Wed, 22 May 2019 21:37:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190522192733.13422-1-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

On 5/22/19 9:27 PM, Dan Murphy wrote:
> Hello
> 
> This is patch set v4 for the LM36274.  There were no changes made
> to this patch set except to rebase this on top of the latest TI LMU common code
> patchset.

Why the rebase was needed? leds-lm36274.c was already including
leds-ti-lmu-common.h.

> This patch set was rebased on the series at:
> https://lore.kernel.org/patchwork/project/lkml/list/?series=393071
> 
> Dan
> 
> Dan Murphy (6):
>    regulator: lm363x: Make the gpio register enable flexible
>    dt-bindings: mfd: Add lm36274 bindings to ti-lmu
>    mfd: ti-lmu: Add LM36274 support to the ti-lmu
>    regulator: lm363x: Add support for LM36274
>    dt-bindings: leds: Add LED bindings for the LM36274
>    leds: lm36274: Introduce the TI LM36274 LED driver
> 
>   .../devicetree/bindings/leds/leds-lm36274.txt |  82 +++++++++
>   .../devicetree/bindings/mfd/ti-lmu.txt        |  54 ++++++
>   drivers/leds/Kconfig                          |   7 +
>   drivers/leds/Makefile                         |   1 +
>   drivers/leds/leds-lm36274.c                   | 174 ++++++++++++++++++
>   drivers/mfd/Kconfig                           |   5 +-
>   drivers/mfd/ti-lmu.c                          |  14 ++
>   drivers/regulator/Kconfig                     |   2 +-
>   drivers/regulator/lm363x-regulator.c          |  56 +++++-
>   include/linux/mfd/ti-lmu-register.h           |  23 +++
>   include/linux/mfd/ti-lmu.h                    |   4 +
>   11 files changed, 416 insertions(+), 6 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-lm36274.txt
>   create mode 100644 drivers/leds/leds-lm36274.c
> 

-- 
Best regards,
Jacek Anaszewski
