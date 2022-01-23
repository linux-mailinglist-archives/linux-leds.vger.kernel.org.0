Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E697497563
	for <lists+linux-leds@lfdr.de>; Sun, 23 Jan 2022 20:55:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239507AbiAWTzg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 23 Jan 2022 14:55:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234957AbiAWTzg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 23 Jan 2022 14:55:36 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99BFBC06173B
        for <linux-leds@vger.kernel.org>; Sun, 23 Jan 2022 11:55:35 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id z7so5454244ljj.4
        for <linux-leds@vger.kernel.org>; Sun, 23 Jan 2022 11:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BK8fgEA7KP1KuMFzoa+PSg6RkvBYi+EKDKvP7v8ocxM=;
        b=XTLPyOGy8UuO8AV6yDvug8AaThgsiyRsPePEk84dVqRBDlmV6pqcW2Z7+Ci7/gKFXi
         d5S/r+JPJC1yvaWSHqo46OVU0/83RoNXeZV+4YZnk3DoIgCaStHDSvVh7ltTvfGUUsHg
         Yw4qpm5TL97fa8OElw6qsGtj46IiPIsQ3mlIeEW2z60DchCyNyqsyBEwsReV3ixosoZr
         LVbc+P9JMQ6lVQ7K/IxxN933C+qH8nfdjzv18K+zzcGrR1ydrmOcbXFkj7VBlwQQYESE
         SkQq6dsgtvjsWLCo+cKbLQToQ36q8n/mNNm+FvJBvbGZJkJzW3MYzSFuDqXvmKy46OaJ
         fH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BK8fgEA7KP1KuMFzoa+PSg6RkvBYi+EKDKvP7v8ocxM=;
        b=TBanDVhWzwCGKYF5kfAP6m8RIrbjnoaD+bAQ9W+5T3Q5PbiHyNzxm0JsLi8iYlv1Ti
         hSvk+2o02yjuLONz/gWKiLcnCSfeJln6nYgkdaLrDyLs4hKhtfNcrSajBYeeWaEXEYue
         ceiq8yeVvWKvE93by1i65AA9PWqnTjYhxW4BfEK1fBh/emyThSiXwnW0WU8snim6QsDi
         wgUM0c6Yh3ssd36l7bxcrSQLVOvzoLUvWN90b7EHX7+f0ZFScNPTX+dFyS2UhO840pwV
         Nsv8JZ6TJ0pnb2joNckIUuwvLhBvXZXzabSWHovu5R60n3Ye/b0MJtfpD1zGoceBTi2O
         SEPA==
X-Gm-Message-State: AOAM5305PPJRqIH9Na25vfxYoK8EBqSLdtR8kmROAJJM6y2NzgMZgvfj
        16kQulKbLuVOj6hEzC068Tc=
X-Google-Smtp-Source: ABdhPJybc0LWRXH1SFqJLAky9kNgc4cnGcIsG8QjVGIxV7EI+ktdfbt+W+WID/5+b3ekwYYnlF9CzQ==
X-Received: by 2002:a2e:a809:: with SMTP id l9mr8790921ljq.139.1642967733895;
        Sun, 23 Jan 2022 11:55:33 -0800 (PST)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id d13sm565816lfv.172.2022.01.23.11.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jan 2022 11:55:33 -0800 (PST)
Subject: Re: Combining multiple PWM LEDs into RGB LED?
To:     Sven Schwermer <sven@svenschwermer.de>, linux-leds@vger.kernel.org
Cc:     pavel@ucw.cz, lee.jones@linaro.org, u.kleine-koenig@pengutronix.de,
        thierry.reding@gmail.com
References: <37540afd-f2f1-52dd-f4f1-6e7b436e9595@svenschwermer.de>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <b48eed49-a18e-eed1-f1f4-77b9f1eab39b@gmail.com>
Date:   Sun, 23 Jan 2022 20:55:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <37540afd-f2f1-52dd-f4f1-6e7b436e9595@svenschwermer.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Sven,

On 1/20/22 3:07 PM, Sven Schwermer wrote:
> Hi,
> 
> I'm wondering about the correct device tree syntax for organizing 
> multiple PWM LEDs into a multi-color (RGB) LED. This is my device tree:
> 
> / {
>    rgb-led {
>      pinctrl-names = "default";Hi Sven,
>      pinctrl-0 = <&pinctrl_leds>;
>      compatible = "pwm-leds";
>      multi-led@0 {
>        color = <LED_COLOR_ID_RGB>;
>        led-red {
>          pwms = <&pwm1 0 1000000>;
>          color = <LED_COLOR_ID_RED>;
>          max-brightness = <65535>;
>        };
>        led-green {
>          pwms = <&pwm2 0 1000000>;
>          color = <LED_COLOR_ID_GREEN>;
>          max-brightness = <65535>;
>        };
>        led-blue {
>          pwms = <&pwm3 0 1000000>;
>          color = <LED_COLOR_ID_BLUE>;
>          max-brightness = <65535>;
>        };
>      };
>    };
>    /* ... */
> };
> 
> My kernel complains as follows:
> 
> of_pwm_get(): can't parse "pwms" property
> leds_pwm rgb-led: unable to request PWM for multi-led: -2
> leds_pwm: probe of rgb-led failed with error -2
> 
> Is my syntax incorrect or is this not a use case that is currently 
> supported? I should also note that I back-ported the multi-LED feature 
> to 5.4.158 so I may have missed some relevant patches.
> 
> Any insight is appreciated.

leds-pwm driver doesn't have support for multicolor LEDs. You'd have to
write a new driver, say leds-pwm-multicolor.

-- 
Best regards,
Jacek Anaszewski
