Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AEE91022C
	for <lists+linux-leds@lfdr.de>; Wed,  1 May 2019 00:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbfD3WFt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Apr 2019 18:05:49 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54105 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfD3WFt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Apr 2019 18:05:49 -0400
Received: by mail-wm1-f65.google.com with SMTP id 26so5483954wmj.3;
        Tue, 30 Apr 2019 15:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=y6vP4hYrf6L2R1nCYtwD5NUV8WoDQGLraizp3UD5ZuE=;
        b=Hsbb4zvGd44HUCIbJdbWWTLQukySYzUkhsL5T8CzT+7rTRFekBh63UBCCyZfNwtwrv
         VeS3crVV12zS4KgF2fsPnxONgmpFFvMDondFbiNfErFa1SqIchaAowYO/zU2yPNvXT9O
         Juxr3Fg0Y6deDVt85knKcv/vp5m4yLAgbZMdw/cNQC4wMfvPryHWrvNRxZLbXi/h6ngO
         LBwYo2/ycFP6q7Y7lsdv7NQBWN3vAYCpFHl3FMw6AhoXdHTbKKA2wddEGXfbX2XyRTEI
         mce2IcyPhfOPKkg8FXFJEuNYaHIERbifPnZRu3Fs/sZNHgjPlXvoEMinfcE5jaoqwsDf
         u+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y6vP4hYrf6L2R1nCYtwD5NUV8WoDQGLraizp3UD5ZuE=;
        b=OMIitKeAObw+mrZY69hMwJkI1MGnvlhi7q1z51ikr5rMi48yG/x4ZgnaVTTeLE+yjo
         hi+Mgt0s25B5Rh5uh3TyIyu6KfjZZU6VW4WPEWoX5ERZ258NVLG7MsGfPLbhD+q+J2/H
         9TPu3w0d8kLcaSFMTxWFngp2JSJf86SdhOO48tBTHrbTvZPDOch4PkH/rJNof99MBmtq
         mRw0bT95X2taquaafpsqFA6IqulKuA55JYEYJ9+IsjxjcG4N9+CPm0mrAYa1G+oA0frx
         Zx+7w3HBTv07bP4D6sT2q8DqbOztL25awB2h9AV5AUvmO/WABW7o5Fn5d/6qwqzj1J9J
         PujA==
X-Gm-Message-State: APjAAAWyEK03rfYswm/H3J/K4vGqD2+RgRrnqZ+JWSznUfXTwBNc6GBX
        6MC5Ly6/02QIEt1+LH2zC8jb4+Jb
X-Google-Smtp-Source: APXvYqxe/y1dIKw3f3ALvCh6x4lw7Q4g+CmKcaCWURZCs21Iw9+80EWdJk4ypeFw+2tUloljPLjpVA==
X-Received: by 2002:a7b:c218:: with SMTP id x24mr4520722wmi.57.1556661947387;
        Tue, 30 Apr 2019 15:05:47 -0700 (PDT)
Received: from [192.168.1.19] (chf176.neoplus.adsl.tpnet.pl. [83.31.3.176])
        by smtp.gmail.com with ESMTPSA id r29sm7087384wra.56.2019.04.30.15.05.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 15:05:46 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] LMU Common code intro
To:     Dan Murphy <dmurphy@ti.com>
Cc:     pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
References: <20190430191730.19450-1-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <34088323-9b40-7dea-5449-6a01bb721c00@gmail.com>
Date:   Wed, 1 May 2019 00:05:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430191730.19450-1-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Lee,

This patch set has dependency on the previous one for lm3532, which
also touches ti-lmu.txt bindings, and for which I already created
immutable branch. Now if I created another immutable branch for
this patch set we would have to resolve conflicts between the two,
as they would both be based on 5.1-rc1. Adds much overhead and
is error prone. Therefore I propose to apply this patch set on
top of my merge of LED tree with the immutable branch for lm3532.

Please let me know if you see it differently. I'll wait for your
response until Friday, and then proceed with the above as I think
it should be harmless for MFD.

Best regards,
Jacek Anaszewski

On 4/30/19 9:17 PM, Dan Murphy wrote:
> Hello
> 
> I have added the Reviewed-by for dt bindings as well as made the Kconfig change
> pointed out for the common code flag
> 
> Dan
> 
> Dan Murphy (7):
>    dt-bindings: mfd: LMU: Fix lm3632 dt binding example
>    dt-bindings: mfd: LMU: Add the ramp up/down property
>    dt-bindings: mfd: LMU: Add ti,brightness-resolution
>    leds: TI LMU: Add common code for TI LMU devices
>    dt-bindings: ti-lmu: Modify dt bindings for the LM3697
>    mfd: ti-lmu: Remove support for LM3697
>    leds: lm3697: Introduce the lm3697 driver
> 
>   .../devicetree/bindings/leds/leds-lm3697.txt  |  73 ++++
>   .../devicetree/bindings/mfd/ti-lmu.txt        |  56 ++-
>   drivers/leds/Kconfig                          |  15 +
>   drivers/leds/Makefile                         |   2 +
>   drivers/leds/leds-lm3697.c                    | 395 ++++++++++++++++++
>   drivers/leds/ti-lmu-led-common.c              | 155 +++++++
>   drivers/mfd/Kconfig                           |   2 +-
>   drivers/mfd/ti-lmu.c                          |  17 -
>   include/linux/mfd/ti-lmu-register.h           |  44 --
>   include/linux/mfd/ti-lmu.h                    |   1 -
>   include/linux/ti-lmu-led-common.h             |  47 +++
>   11 files changed, 712 insertions(+), 95 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
>   create mode 100644 drivers/leds/leds-lm3697.c
>   create mode 100644 drivers/leds/ti-lmu-led-common.c
>   create mode 100644 include/linux/ti-lmu-led-common.h
> 


