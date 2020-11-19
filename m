Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 355092B9C70
	for <lists+linux-leds@lfdr.de>; Thu, 19 Nov 2020 22:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbgKSVDT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Nov 2020 16:03:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbgKSVDT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Nov 2020 16:03:19 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DACEC0613CF;
        Thu, 19 Nov 2020 13:03:19 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id v22so7304075edt.9;
        Thu, 19 Nov 2020 13:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z+6guBZn9GHmdHYk8ZmUrPsCpMGVrAJ66ziNvmZxoyA=;
        b=Cak6NKWhvWwm87Bj0XHStuYGSzcAzR3vwi8cod/Z519qxht6kEtXz7I34XZOH/fqIa
         AWDnlXQw0Tik0Jh+Vk6mXoZbCXPY/DsVFFFE5BYo4PYx4AnFJobLcYza4Hax0QRQt0bp
         qBtfCyOcK7qtMlbs7L/6dOXmP08YDieUuVmibrQ7qZJw5i4SsUGGb8SXEeaX4cL0piOh
         Qq9/vTMUOnfSf52e4stWPzb1iKYxzyLYmCs5CDH52L1aHKHl1cUh2XMkcqGKpnj3SXnm
         4jZMxPVUA8rskSFcyIpTAwWz9QmmzGzORokUafH9sStWRGmcayfnoN0stKhZTUuid9KR
         1Yig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z+6guBZn9GHmdHYk8ZmUrPsCpMGVrAJ66ziNvmZxoyA=;
        b=I37L/0r9WrFIqSZfS5WcS2pWQMrxoqUeOa/HN9zxUMgxrmSULAjsXc2tfPYc3FJZKi
         r7RexzVkVS17ofF0CP392L++y0x5EHOgRmePZjXUgrQOAvY4LvnDLYAe09j9E7Eo+tA7
         ZUK3llS02q/tmg1TnRpaG5BHuWZcSZtH9aVCMR2Pk1b5rIezfTBXj+96O0YFCDn0RDbz
         nr7ci2jBtjlX2IoaiGrm4zZIKJ2LXtwdyb7BX4WmJKAMtyIO2OKx1MxtfXUXzya9sXyl
         Jeb94FcgVOAH2R4qL077XrtXxBpfCBDIPYFrHRrEc9eaM04UOa4jKkh0mj2I4dzQFQV5
         pXag==
X-Gm-Message-State: AOAM532a4Qga8fLkEcl37VXLLLv5AoYMDikSdH5abx/M9wSaQXWz4AX3
        9c4B8nvQt1y3qYFQt7ZJNuA=
X-Google-Smtp-Source: ABdhPJwtMZKYg/8ElqODRGOr6xTnw62vC6bOi+oR6icynu4UyKAd85htDro+/oWjVAG5J8PU/pHF5A==
X-Received: by 2002:a05:6402:8d5:: with SMTP id d21mr2613263edz.11.1605819797950;
        Thu, 19 Nov 2020 13:03:17 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:5807:584b:19c8:e7be? ([2a01:110f:b59:fd00:5807:584b:19c8:e7be])
        by smtp.gmail.com with ESMTPSA id p1sm286020edx.4.2020.11.19.13.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2020 13:03:16 -0800 (PST)
Subject: Re: [PATCH v7 2/5] dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT
 definitions
To:     Pavel Machek <pavel@ucw.cz>,
        Gene Chen <gene.chen.richtek@gmail.com>
Cc:     robh+dt@kernel.org, matthias.bgg@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
 <20201118213712.GA22371@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <6068b1e3-a4c8-6c7d-d33d-f2238e905e43@gmail.com>
Date:   Thu, 19 Nov 2020 22:03:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201118213712.GA22371@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel, Gene,

On 11/18/20 10:37 PM, Pavel Machek wrote:
> Hi!
> 
>> From: Gene Chen <gene_chen@richtek.com>
>>
>> Add LED_COLOR_ID_MOONLIGHT definitions
> 
> Why is moonlight a color? Camera flashes are usually white, no?
> 
> At least it needs a comment...

That's my fault, In fact I should have asked about adding
LED_FUNCTION_MOONLIGHT, it was evidently too late for me that evening...

-- 
Best regards,
Jacek Anaszewski
