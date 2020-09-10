Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB512650F1
	for <lists+linux-leds@lfdr.de>; Thu, 10 Sep 2020 22:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbgIJUgs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Sep 2020 16:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbgIJUbd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Sep 2020 16:31:33 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF096C061757;
        Thu, 10 Sep 2020 13:31:32 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id l17so7661623edq.12;
        Thu, 10 Sep 2020 13:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A48ne1NZlAQmHWx3dwlyO17eMOtVRiN/7Bebdr8XWds=;
        b=qAkJzsOTQfBfqX4KhmgLrREZOhXSHGek4jbzsfgSuMFFH08Wf35AoC/0ivbDoEao+d
         ltUXZhmvykpyQPtAkjR+EB2M+fIDoUOOnbPqLvJqDRAasaLKHHebM3+4OJp49dAzAjm+
         HlT+ha/16Fm+9/z4MAjMexCaHaNc7/FSdIvo2Q2wcwlo+CS7amwG4/HPSfPmwJig1yvY
         GMyUBSUL6B/J1YIomto7fZoQBYOHp7Ja9ZxpDLFBlfwmxPB1X8jI7e0zaQEpWWMo3FnK
         l4+I1llshFvj22o62w8UMZ7Po1b6eRreNY2IOZkEqhNz4aJF+S7XGmQEtVUi1FHlPU4O
         b9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A48ne1NZlAQmHWx3dwlyO17eMOtVRiN/7Bebdr8XWds=;
        b=OYOiSO8zx5Xe/9Yt9VBFyMRRYrrcB6f/SeaLWp3kBE6taLJwoGRJElhl+/UItCYQnX
         upmQupaNgWfMv+eMIlv19MjslkwUOw424ercgs6gBbkv2Fp21pLNZetblc8ckm2d1y4r
         EbiecqAbZgIhOKkINIzXv1qRpHT9wUME+wxi4ziaT45VRx55R4NskY4vwnApPS3t7zhx
         KDcLTzaT58cM3JFk99SEqY7pM2QOLhbLkko1iDNq/YBF3UR/w9kTJCNZi9wAgWHzwDHF
         HhYo7BLLwuVEJy2LE2nfyHKUMlGsJ3lwMYxH9Yjl1fphajMBDFPyGJ0DmB64ZNd7dI8j
         PzwQ==
X-Gm-Message-State: AOAM532zKNSZXAu+6WGoK5DZLRhu8J+xkmDlQYBD05d6gyHVI73nnirp
        rbXnTn0BwgTdqsv7zT5+atE=
X-Google-Smtp-Source: ABdhPJw+zf8rBSPAdo8LdqmvoKcln9GQDEKYZZoP7GcqLXI4914UllNCnLTRXClIOmfeYbqwRTbxIA==
X-Received: by 2002:a50:fc91:: with SMTP id f17mr11652949edq.319.1599769891532;
        Thu, 10 Sep 2020 13:31:31 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:a856:4fc0:9f1:73f6? ([2a01:110f:b59:fd00:a856:4fc0:9f1:73f6])
        by smtp.gmail.com with ESMTPSA id v5sm8181205ejv.114.2020.09.10.13.31.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 13:31:30 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Gene Chen <gene.chen.richtek@gmail.com>, robh+dt@kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
 <20200908222544.GF1005@bug>
 <CAE+NS34h9qbdHkYDYDnHGgk+9mFNTRpKEMKNEFZ+Secf6JyoZg@mail.gmail.com>
 <20200910122958.GF7907@duo.ucw.cz>
 <489fc92f-f6f5-839e-e417-7761d404e6ae@gmail.com>
 <20200910202510.GB18431@ucw.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <7ce924da-5119-0406-7995-560c32097040@gmail.com>
Date:   Thu, 10 Sep 2020 22:31:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910202510.GB18431@ucw.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/10/20 10:25 PM, Pavel Machek wrote:
> Hi!
> 
>>>> 1. set FLED1 brightness
>>>> # echo 1 > /sys/class/leds/white:flash1/flash_brightness
>>>> 2. enable FLED1 strobe
>>>> # echo 1 > /sys/class/leds/white:flash1/flash_strobe
>>>> 3 . turn off FLED1 strobe (just used to gaurantee the strobe mode
>>>> flash leds must be turned off)
>>>> # echo 0 > /sys/class/leds/white:flash1/flash_strobe
>>>
>>> I believe I'd preffer only exposing torch functionality in
>>> /sys/class/leds. .. strobe can be supported using v4l2 APIs.
>>
>> Actually having LED flash class without strobe is pointless.
>> If you looked at led_classdev_flash_register_ext() you would see that
>> it fails with uninitialized strobe_set op. And V4L2 API for strobing
>> flash calls strobe_set from LED flash class beneath.
>>
>> That was the idea behind LED and V4L2 flash API unification - there
>> is one hardware driver needed, the V4L2 Flash layer just takes over
>> control over it when needed.
> 
> I agree that one driver is enough.
> 
> But we should not need flash_strobe file in sysfs. Simply use V4L2 for
> that.

Apart from the fact that we can't remove it from LED flash class ABI
now, why would you like to prevent the user from exploiting main feature
of the hardware?

-- 
Best regards,
Jacek Anaszewski
