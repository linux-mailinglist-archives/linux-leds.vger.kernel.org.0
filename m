Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B972255098
	for <lists+linux-leds@lfdr.de>; Thu, 27 Aug 2020 23:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbgH0Vcz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 27 Aug 2020 17:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbgH0Vcy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 27 Aug 2020 17:32:54 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39291C061264;
        Thu, 27 Aug 2020 14:32:53 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id n26so1779754edv.13;
        Thu, 27 Aug 2020 14:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q92TxcF2bF3OBrhpEZ4r/j4Ss+4Z6EqFXSY8+h0zQ58=;
        b=CeuV59MD5wT4ZeW8ysub9lGWmMUhVQwM//kZqZV3p9gBQfufzzq1j+LUA+jVm2u6vc
         Q8UlrOMKO4bE2afAFTWz9qmtpoibOm0dSoxFTxrGocEurWsF/vHy/cTQcAAAeIooEg/7
         iQ+IHjRwsA8wmPoHJaK5NoYbSUezA8jKxlwIX97raFXV+/FmO335SB+epy+7c9do2GVk
         nXINmE3N6eHNW5qinXgjUg2+cdwm0e4JjzifQ/+JnuJuNu+Nedh8yKYHLT6urRtpKZPm
         2zkzlcS5f6RO59BkRmpHnlwp4KL6pBGJRw61RUvmyAuIOmzQ2paKta8VtuD7g6CwgeOn
         XE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q92TxcF2bF3OBrhpEZ4r/j4Ss+4Z6EqFXSY8+h0zQ58=;
        b=UrQyl5oiZoHQrYWkqd/KegOdnpukj3xUHKhpZnsRhvtoSnYu5R8/pPBvGO2aU2a88E
         3NhjKBNJ29CZAWYesdU9IqBuUffTa1IOmWq9aIUZHqmQ6F3RutUlWFBYu4EaH5WXD1aS
         eZx8FjJ6f5O1F71WKdSGSVExg0Ww9W/SJmOZSPVkEB13pvx0zZLxKRAnyEW3kjo5rJTD
         hI4brf5b/aD/J38+FqC5DQcKotp3g7ljBxo+nrtvw2Q0GyEn+4u5hG6sW5V1Jtk0udMG
         d6u3tyR8HSp254KlgaoSeGWWZNoClpPOMOoPIqmLG3h03vMjDy3UlP1Ca4JdN0zYxVGJ
         p4pA==
X-Gm-Message-State: AOAM530XWkCQVSg3ebmoQRW5KP6fixprczBTmqP2/7ZmYN5qW2nlxIgC
        TapUwIntqLNSV+WbCScF8LuOmE1KkW4=
X-Google-Smtp-Source: ABdhPJxmpwB7LortCu0lNKqMMPjr/mVyTV3HwYYddAcM9JnoMS8TgfQ04DFMAgvbi1if/WT7NtcOfA==
X-Received: by 2002:a05:6402:2:: with SMTP id d2mr21864641edu.221.1598563969143;
        Thu, 27 Aug 2020 14:32:49 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:a137:4925:7b50:2e1c? ([2a01:110f:b59:fd00:a137:4925:7b50:2e1c])
        by smtp.gmail.com with ESMTPSA id i35sm2345152edi.41.2020.08.27.14.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2020 14:32:48 -0700 (PDT)
Subject: Re: [PATCH 0/2] leds: mt6360: Add LED driver for MT6360
To:     Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1598441840-15226-1-git-send-email-gene.chen.richtek@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <8ec2100d-7156-b8a3-b730-1ec48f88d610@gmail.com>
Date:   Thu, 27 Aug 2020 23:32:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1598441840-15226-1-git-send-email-gene.chen.richtek@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

He Gene,

Please resend the set with updated version (I suppose it should be v3).

On 8/26/20 1:37 PM, Gene Chen wrote:
> In-Reply-To:
> 
> This patch series add MT6360 LED support contains driver and binding document
> 
> Gene Chen (2)
>   leds: mt6360: Add LED driver for MT6360
>   dt-bindings: leds: Add bindings for MT6360 LED
> 
>   Documentation/devicetree/bindings/leds/leds-mt6360.yaml |   50 +
>   drivers/leds/Kconfig                                    |   11
>   drivers/leds/Makefile                                   |    1
>   drivers/leds/leds-mt6360.c                              |  680 ++++++++++++++++
>   4 files changed, 742 insertions(+)
> 

-- 
Best regards,
Jacek Anaszewski
