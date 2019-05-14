Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1A831CFA7
	for <lists+linux-leds@lfdr.de>; Tue, 14 May 2019 21:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbfENTLf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 14 May 2019 15:11:35 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33127 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbfENTLe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 14 May 2019 15:11:34 -0400
Received: by mail-lf1-f68.google.com with SMTP id x132so79320lfd.0;
        Tue, 14 May 2019 12:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2Qx07JKl5GkNIJfkJZmKe7GgoWrvJJ5py9p3APE6d8M=;
        b=eXlO21opfyJqolVnD2qfwwrlk8MevmQswHYWeS0XR+4qlNGvX16fc3gStZCdao8i2r
         /EVPtwo8gW+SXZq2Tuy5qD9AnOv6wv6WDCCTYjNhjqIVc4PuHMkA+RGSJxffV2Wfq2X6
         jeoCtTNrAdaWQBCPFuR79iPMkRgvcoH9BAWlTSQUvH2HyQczhRMsbEf/OSaJAJINg5ze
         zY0rklApeIHNaG3INYRQ5e1PEmiQli9Lhf96rZSAu0AQ93wYuuT7zQA9ha3FPhreTsf1
         cR8sRgvYcR/9MxGQuKmZnla0qR7ISExLJObaqF/T4zAY9zH4hVPXWjynBd+MV83FGpP0
         Qnbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2Qx07JKl5GkNIJfkJZmKe7GgoWrvJJ5py9p3APE6d8M=;
        b=qA/yrEylCWo9PexZ5yYqUWQXtI/TzRErJXxR0Mym0Uv6ppzpk4+C+ij0wNMkeuEvyl
         rauE8aLgqruVIIh6Dbrfv9/EjJ11tL3GHPLIDihLNpn6+grjjy3ZysRpn7hWqcFVEedg
         ZAuMBTXpxMYYPmI86aVTZQwmZagfdwKun03ZcIqC0W+0CQIcKLfWkD+lFsKok76tJHz6
         DIjstIE3dXBJI1FsiFmGPe1CZq5cJyJJTDjZhyl5QyB5ZBlThNaAQp4+gqwJIffWNW2x
         L/TnJwZiEMC9kQhRqP8F7w5qDmA9fg7s2zG8h38/Clue1YBISsyN1FSFL/i/1xKBdf+6
         UqIQ==
X-Gm-Message-State: APjAAAWaChY7q2OkBlwcsMq+p3H3GpUmPo9KaneEJmCWr1PSNISYH9/C
        60B5zsDGYTZNwcMymwmsImw=
X-Google-Smtp-Source: APXvYqxWP1OuITgZLEGBADLYAweKXherQjhrZyAjJkxTABGIw89hm056ZJ8DVQQkBoRzmx22JfSTFQ==
X-Received: by 2002:ac2:5474:: with SMTP id e20mr16957118lfn.59.1557861092628;
        Tue, 14 May 2019 12:11:32 -0700 (PDT)
Received: from [192.168.1.16] (chn228.neoplus.adsl.tpnet.pl. [83.31.11.228])
        by smtp.gmail.com with ESMTPSA id h23sm1922242ljf.28.2019.05.14.12.11.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 12:11:31 -0700 (PDT)
Subject: Re: [PATCH v4 0/6] LM36274 Introduction
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     lee.jones@linaro.org, rdunlap@infradead.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
References: <20190507201159.13940-1-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <aface058-d34c-9ae0-838d-7e8b0cfe6e10@gmail.com>
Date:   Tue, 14 May 2019 21:11:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507201159.13940-1-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

I need acks from regulator framework maintainer for patches
1/6 and 4/6.

Adding Liam and Mark.

On 5/7/19 10:11 PM, Dan Murphy wrote:
> Hello
> 
> This is patch set v4 for the LM36274.  There were no changes made
> to this patch set except to rebase this on top of the latest TI LMU common code
> patchset.
> 
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
