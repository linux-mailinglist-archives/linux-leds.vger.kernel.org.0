Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4C0621CBBE
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2020 00:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgGLWLz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Jul 2020 18:11:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727838AbgGLWLz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 12 Jul 2020 18:11:55 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AAAEC061794;
        Sun, 12 Jul 2020 15:11:55 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id y10so13194530eje.1;
        Sun, 12 Jul 2020 15:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lLj/bs7AsTeL4aQLydn/QJv9f9oPPwS3qEKRHPI9MFU=;
        b=g1kGe88jxl8niV1GOLtWC+yCUgxTT0olqyW4tR2UBJsTuO1yBqofIKAcbF3s6M4+e4
         RssnyRuD9sa/mChrJJrHSL5rjvEH0C+qGOrU8ivDykRcQuUdJpU6G+LZbgChkvikxqhu
         ImRm3CXyhOZFovfNhJiuGGBEqsFmaUzmSTg3Omhs6HbvFSjBGQYJs3ajfNeZEznS87pF
         r2qsokgRkNsNQuY6CPOdNGYaDR5+QQ5Zu6MWw/1OGnARy+kwPYz/sxQClCy8uqwgzKxZ
         iH/onMYvih7ms2TnZqumuCcp0TjoW6YCpY6QeJ6AcpAEwssJq/XrbFwSrCWLZ09qHe03
         W1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lLj/bs7AsTeL4aQLydn/QJv9f9oPPwS3qEKRHPI9MFU=;
        b=WsvLWZtozFbNk0VX1E5fga+3+6nT8/bMclo5KGMs6urhB9zohSEZemiVwaW9Vh8XK3
         q7lFMoz9oqkhRPZPH4glQ4GxSUGsTuzN12IsAOX5mur+6l4xZILGsRAxFPCxnIs0xf5Q
         aO9vrpwLASrTHB8ae0VzZhL9mwynbEjp5LPiNc0J9XDJydenJ8a3+BxnTnalBFuT8oFr
         5x0qkojuFPh197yWCnxZdbCjxkyxQvjOY78jVjgN+GHIpzSao5NQwH9nIumywDhEXSPs
         KBKvMXpZ+0XvswybYRfng1xQXkgE+lzv59lubJhLqP7p0K9RK3s/rWM1VeM11Fa15EiU
         CiMw==
X-Gm-Message-State: AOAM5303cCGNZxSN5J7r0pmToIkUQH1S4RAyjI/6nfWxajY+qI+Owkeb
        Be7oDiWBhT5zI9ORNSjHFAgcsyIG
X-Google-Smtp-Source: ABdhPJzHux4LUj0AkhYEAJf7mPkaMRH/nvN45sVsX1HkLEAhVoDnqU/M6bC0S4cLaNPMQDSV+FZrKA==
X-Received: by 2002:a17:906:c943:: with SMTP id fw3mr69762031ejb.55.1594591913750;
        Sun, 12 Jul 2020 15:11:53 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:416b:3fd:d547:2e80? ([2a01:110f:b59:fd00:416b:3fd:d547:2e80])
        by smtp.gmail.com with ESMTPSA id w20sm10216188eds.21.2020.07.12.15.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2020 15:11:53 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: add cznic,turris-omnia-leds
 binding
To:     Marek Behun <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
References: <20200712210601.5239-1-marek.behun@nic.cz>
 <20200712210601.5239-2-marek.behun@nic.cz>
 <4609c389-4be6-0987-5078-725b43153596@gmail.com>
 <20200712234035.213348aa@nic.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <ff707d34-8fc0-342e-3df2-e96e5493004b@gmail.com>
Date:   Mon, 13 Jul 2020 00:11:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200712234035.213348aa@nic.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 7/12/20 11:40 PM, Marek Behun wrote:
> On Sun, 12 Jul 2020 23:27:07 +0200
> Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
> 
>>> +            multi-led@0 {
>>> +                reg = <0>;
>>> +                color = <LED_COLOR_ID_MULTI>;
>>> +                function = LED_FUNCTION_POWER;
>>
>> Please provide child nodes for each color LED. Let's stick
>> to the bindings closely and not make any deviations from
>> the beginning.
> 
> Why? It would make sense if there were devices using this controller
> having other configuration, but on Omnia, all LEDs are RGB.
> 
> Also, if I do this, should I also make the driver check in the probe
> function whether the per-channel child nodes are correct? Eg. if they
> are always three: one for red, one for green and one for blue? Or
> should the driver ignore this and only the device tree binding specify
> it?
> 
> Because the way the driver is written now, it only registers
> multi-color RGB LEDs.

This is not RGB framework, but multicolor framework. It is not justified
to pretend that RGB is default. Unless you would state that clearly in
the comment in DT, but that should be agreed upon with Rob.

-- 
Best regards,
Jacek Anaszewski
