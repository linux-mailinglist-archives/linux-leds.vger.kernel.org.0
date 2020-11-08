Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7E02AAC4E
	for <lists+linux-leds@lfdr.de>; Sun,  8 Nov 2020 17:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728709AbgKHQxC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Nov 2020 11:53:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728104AbgKHQxB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Nov 2020 11:53:01 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 925C9C0613CF;
        Sun,  8 Nov 2020 08:53:01 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id 7so8884153ejm.0;
        Sun, 08 Nov 2020 08:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Rikl1cMUQrKKRfEty9vlE0bbTP/gldAUaSt6ZFA6Ac4=;
        b=O7ZSLo3dzGjafmpqqFnclreHOVe9FkJWqozL3Ixox4tRNR66EfsvsldQX1ywpxfjsN
         RxLCV/t8rwjqoS0VNyMR9fAvqEPMRCKifgbUkEpBu4oXxgck+aKQ9vQfihDe31SW7T2+
         HF9wV5lavJbBkjFH6CL5mrwyIfFsF5B8Q+Sm4Rp5j0ti2oDzuuNc71na6PoL1/31jGTf
         WYBg/D3Dz3clJFZmKqg7M+Xukf6JxXQKulyUYLP7osdyFrPVBXlNXIg/gRSMcBLLA9sq
         TOzmPfq0y0Nv4So+3kAdpzo7RU/NUEXay5V1Wl9GmjFupYnCUkQFXnl91YAv/lerJSCq
         6Z7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Rikl1cMUQrKKRfEty9vlE0bbTP/gldAUaSt6ZFA6Ac4=;
        b=OlUrt2vLc3eKwbna8ayh0DL28QpmRWo6RwKDO2aQy7Ug1yPYzgov5XpPykNmBgj0TX
         Z2qsBZMEgMX0JyNCdUfGRob1NQyRTUVHyndehJ47Zg/5uW0sO/Ge5azcKhiIoDwvD61x
         dT9A8MJDTfaqExYigKolEUGw5zqJX1p81afJNfKXBsKNFQVrBu/vDzJ9EYs9fnnGv2pj
         //LNspaF+1PY9iO2ASbmqZNMr8HIIWXG0LZAX96gY6OXO1I/fKyAX/H7StJKdqVFEvOZ
         Rgv4rbPZ+VlpL/rhNOOeLvzMwa7UVDa+vBjcudbuMZxc71P14XM99xDY3nkGjHvuKnSZ
         xrbA==
X-Gm-Message-State: AOAM533OIUr44fedt6CyX7zjBBq7QSUvrn/wF6eSB8ycVR7FWu+od19U
        PtmFH6usjydv+Yp0gPGflFc=
X-Google-Smtp-Source: ABdhPJzKeFZ4YDUaRqvql2Gqeb1pkAFCZ/bH4q99bP/i+x+1fPoTwk4Ei85xGYCuw3ehxLZ+6mSYeA==
X-Received: by 2002:a17:906:74c6:: with SMTP id z6mr11832276ejl.448.1604854380356;
        Sun, 08 Nov 2020 08:53:00 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:a483:75f7:76d4:f590? ([2a01:110f:b59:fd00:a483:75f7:76d4:f590])
        by smtp.gmail.com with ESMTPSA id b6sm6684948edu.21.2020.11.08.08.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2020 08:52:59 -0800 (PST)
Subject: Re: [RFC PATCH 1/3] leds: Add driver for QPNP flash led
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@protonmail.com>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Russell King <linux@armlinux.org.uk>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org,
        andrealmeid@collabora.com
References: <20201106165737.1029106-1-nfraprado@protonmail.com>
 <20201106165737.1029106-2-nfraprado@protonmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <e132bb75-66fb-0cbb-c636-5ef5f279d161@gmail.com>
Date:   Sun, 8 Nov 2020 17:52:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201106165737.1029106-2-nfraprado@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Nicolas,

We have LED flash class framework since 2015. Please refer to the
following files:

Documentation/leds/leds-class-flash.rst
Documentation/ABI/testing/sysfs-class-led-flash
Documentation/devicetree/bindings/leds/common.yaml
drivers/leds/led-class-flash.c

Thare are also few LED flash drivers in the tree. Since there seems to
be boost feature present on the the device then you might want to
compare drivers/leds/leds-max77693.c with its bindings
Documentation/devicetree/bindings/mfd/max77693.txt (refer to LED part).

Please also remember to include DT bindings patch to your series.

On 11/6/20 5:58 PM, Nícolas F. R. A. Prado wrote:
> Add driver for the QPNP flash LED. It works over SPMI and is part of the
> PM8941 PMIC.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@protonmail.com>
> ---
>   drivers/leds/Kconfig     |    9 +
>   drivers/leds/Makefile    |    1 +
>   drivers/leds/leds-qpnp.c | 1351 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 1361 insertions(+)
>   create mode 100644 drivers/leds/leds-qpnp.c
> 

-- 
Best regards,
Jacek Anaszewski
