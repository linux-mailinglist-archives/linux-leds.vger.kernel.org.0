Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E93B25A074
	for <lists+linux-leds@lfdr.de>; Tue,  1 Sep 2020 23:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728029AbgIAVIP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 1 Sep 2020 17:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726355AbgIAVIO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 1 Sep 2020 17:08:14 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3D47C061244;
        Tue,  1 Sep 2020 14:08:13 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id c18so3010526wrm.9;
        Tue, 01 Sep 2020 14:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+CKclAjRFtFzzHuH4Z+cc0RleEsFQT6/9G8VarpeaFQ=;
        b=iJ9INBN/zOJ9tXPac/L7ys8thnkeloE8N27/kaWQj56mYdS+iVScqRJoY9x+0l+w7w
         nB+0SkQRMzFybROIgHKwNNcZzDclvoWi+ahM2izct3hxG/kacC4D41FpkC8PooTrVEkM
         Q/0Ix4PkDgDJR/EhGKSFwZ9lkwcRW3X04wdBWx9nx6KeOBU+e9lk7Xw6iU77ZDjVv4Dd
         AtO5iZoav85K1E4+x5Qluz6mPKNRYCaCxPq5S53E3PsyXk5ZuQcW59G29KmqGX7SjmtV
         yu6pn5fcm2Vb1WDLLtIP8bAXF9oVHveJz8jaDpvCEK2FmvAcFCE0eBJFxJXaVpfJWQIv
         rFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+CKclAjRFtFzzHuH4Z+cc0RleEsFQT6/9G8VarpeaFQ=;
        b=pi2od7yiD3/JEpG9tMv8lyHFcctX1dwRRoWy16jAWFnzMFLsUSYG9uKyhNBrpaxXRC
         hzZgkluEa8R86IWQD/FnAXv6IOX6FvfB89SJzy55mBuIUBJxpDIcijy3cFZLkOqPw6fU
         MiRKz7BJPezeufQ5UQaqHw0fgiWn7Vrz0qTLxJFxgX1R+TJPDzC8Ijp6WVzX2FIMgNCQ
         zi7vcB3FzACbwIX8CTJej9r9tzOnLcz7D+8viPLYh887jfjG6VDjFOZrhG/rpvOMixMj
         GvqlSRk60OumR+OkwQYdoaj6Huey2GJZCfdPnYjpWvpkTaovxnU8Yz20BA6F2Q4g5uUD
         qQ/g==
X-Gm-Message-State: AOAM531e/x4qdMwkYBw4rw3nyuOYaOaLPlxlQha8TR3eyJGovYHVi2WC
        MUzc0b+p0a3Tq1fhefNrBLw=
X-Google-Smtp-Source: ABdhPJyrtR37csheuTld/JwsHQAsd681gBqX8t+zpuP+aWyKKRFXAtGGsoe2rsyy8mv1hcnFb3M7VA==
X-Received: by 2002:adf:c182:: with SMTP id x2mr3772220wre.400.1598994491962;
        Tue, 01 Sep 2020 14:08:11 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:a062:770b:28ce:a41e? ([2a01:110f:b59:fd00:a062:770b:28ce:a41e])
        by smtp.gmail.com with ESMTPSA id o4sm3718405wrv.86.2020.09.01.14.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2020 14:08:11 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] leds: pwm: Make automatic labels work
To:     Alexander Dahl <post@lespocky.de>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Alexander Dahl <ada@thorsis.com>
References: <20200831210232.28052-1-post@lespocky.de>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <a8f9068b-d78d-3ba5-6747-f79ed8e641bd@gmail.com>
Date:   Tue, 1 Sep 2020 23:08:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200831210232.28052-1-post@lespocky.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Alexander,

Thanks for the v2.

On 8/31/20 11:02 PM, Alexander Dahl wrote:
> Hei hei,
> 
> for leds-gpio you can use the properties 'function' and 'color' in the
> devicetree node and omit 'label', the label is constructed
> automatically.  This is a common feature supposed to be working for all
> LED drivers.  However it did not yet work for the 'leds-pwm' driver.
> This series fixes the driver and takes the opportunity to update the
> dt-bindings accordingly.
> 
> v1: based on v5.9-rc2, backport on v5.4.59 tested and working
> 
> v2: based on v5.9-rc3, added the dt-bindings update patch
> 
> Greets
> Alex
> 
> Alexander Dahl (2):
>    leds: pwm: Allow automatic labels for DT based devices
>    dt-bindings: leds: Convert pwm to yaml
> 
>   .../devicetree/bindings/leds/leds-pwm.txt     | 50 -----------
>   .../devicetree/bindings/leds/leds-pwm.yaml    | 85 +++++++++++++++++++
>   drivers/leds/leds-pwm.c                       |  9 +-
>   3 files changed, 93 insertions(+), 51 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.yaml
> 

For both patches:

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
