Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B57E5297E1F
	for <lists+linux-leds@lfdr.de>; Sat, 24 Oct 2020 21:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1760388AbgJXTen (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 24 Oct 2020 15:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760121AbgJXTen (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 24 Oct 2020 15:34:43 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2BDC0613CE
        for <linux-leds@vger.kernel.org>; Sat, 24 Oct 2020 12:34:42 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id gs25so7377164ejb.1
        for <linux-leds@vger.kernel.org>; Sat, 24 Oct 2020 12:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OekLrCgjOMc1z4MsSFJzOI4N47ojNXNiKR6iQIvVycU=;
        b=GJjvbeKKLw4bxJJv9bKPTaC9y0cnhSEYF+XGG3csTa2U9AtGIu1NScD42Sn6zZ2JO5
         CuBk82E44D/GwhogjW21lRfTRyoI0FdSkGLwYOszqU6ipPiB/KLbHZnuiBZJapqTBxZx
         PSeB3pKeBxCq2k3XGuDkakZuwxnLUMoggDZDAQZMKqkcqQ5fwvPCILZHHjchhYiO2cLg
         KdOnui4hT0KXY0rTLBHMvainPyMG5qbM5rBzcd8+eXbiTsPRvtpFdt7j0qAsUyMroNQP
         Lhc5HYZdk2jkhyo3YaGk7K8Xducqn6L1kNi5x1FeWsbdSzUmxEEqrmjfzyuio/yRk0yh
         aHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OekLrCgjOMc1z4MsSFJzOI4N47ojNXNiKR6iQIvVycU=;
        b=F8wS3JQtJBuHN8uX151R6ZuGGZpG0zKkaiTc6lXI91jfOQ51OvGgyNvNx+nbLaFscQ
         Ff2eCE9iUbEuG39bpkAu9261+755qyG90jAwcoHLiJSATjJq3qpCw/g9xaOW1YNSHXaT
         TosHTRR/dBGMUIHIuZ41SYEMldsL8SmL0rmKCsIQNMbSVzl0c19hhouYRBBX3KllLbe5
         XpjJeNWZmDKl1eeIsg9eh5OX1Xp6MgSJ/Fh2CVrpv+JOxiuqba0peiz177mCPutzhru4
         52XXJX+p6eDc4jw6Xx8Dg6Dwe6mbmBIxqIJNXyeEmDt22MEO0MeG1yz6SdQuLz564OXB
         Xcrw==
X-Gm-Message-State: AOAM532KKQYEl+DeS74Ufyf9Ff4Aw4rvndCEWcbChCRaiMqJZSMgH2RW
        nvEbvuPOsLB8rOhZx0/xL98=
X-Google-Smtp-Source: ABdhPJy7+YtSKjgfOxSCircNKyCYiawnPcc1GGeyB2XhUmPQU7anYpsUcoE3ffL9/CsrwSo1wX2D7w==
X-Received: by 2002:a17:906:53d7:: with SMTP id p23mr8058378ejo.232.1603568081398;
        Sat, 24 Oct 2020 12:34:41 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:1410:8273:712c:ac8b? ([2a01:110f:b59:fd00:1410:8273:712c:ac8b])
        by smtp.gmail.com with ESMTPSA id k21sm2550906edv.31.2020.10.24.12.34.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2020 12:34:40 -0700 (PDT)
Subject: Re: Clarification regarding multicolor leds
To:     Luca Weiss <luca@z3ntu.xyz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Cc:     bjorn.andersson@linaro.org
References: <24145961.oFyDssk0vh@g550jk>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <534b4937-b7ec-fc63-325a-c8e1e268b85b@gmail.com>
Date:   Sat, 24 Oct 2020 21:34:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <24145961.oFyDssk0vh@g550jk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Luca,

On 10/24/20 12:48 AM, Luca Weiss wrote:
> Hi,
> I'm currently experimenting with the qcom lpg[0] which is a driver for the rgb
> notification led found on e.g. Snapdragon 801 devices (and many more),
> specifically my example is about the Fairphone 2 (msm8974-fairphone-fp2).
> 
> [0] https://lore.kernel.org/lkml/20201021201224.3430546-1-bjorn.andersson@linaro.org/
> 
> My dts is looking like the following (abbreviated):
> 
>      [in lpg node]
>      multi-led {
>          color = <LED_COLOR_ID_MULTI>;
>          function = LED_FUNCTION_STATUS;
>          ....
>      };
> 
> I'm comparing this to the PinePhone where the leds are defined as follows:
> 
>      [in gpio-leds node]
>      blue {
>          function = LED_FUNCTION_INDICATOR;
>          color = <LED_COLOR_ID_BLUE>;
>      };
>      
>      green {
>          function = LED_FUNCTION_INDICATOR;
>          color = <LED_COLOR_ID_GREEN>;
>      };
>      
>      red {
>          function = LED_FUNCTION_INDICATOR;
>          color = <LED_COLOR_ID_RED>;
>      };
> 
> (sidenote: the LED_FUNCTION_INDICATOR should probably also be
> LED_FUNCTION_STATUS there; the dts was made before the better descriptions for
> the defines have been added)
> 
> This gets the following directories created in /sys/class/leds/:
> 
>      blue:indicator
>      green:indicator
>      red:indicator
> 
> But with the multicolor led on the Fairphone 2 only a directory with the name
> of "multi-led" gets created which I would have expected to be
> "multicolor:status" instead.

This is because the driver from patch set [0] does not use *ext()
multicolor registration API, but follows old-fashion LED name
initialization via 'name' property of struct led_classdev, which is
initialized to DT 'label' value or DT node name if the former is absent.

-- 
Best regards,
Jacek Anaszewski
