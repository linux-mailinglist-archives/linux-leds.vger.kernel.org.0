Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66C9F615D89
	for <lists+linux-leds@lfdr.de>; Wed,  2 Nov 2022 09:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbiKBIVZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Nov 2022 04:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230241AbiKBIVX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Nov 2022 04:21:23 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51B7525C46
        for <linux-leds@vger.kernel.org>; Wed,  2 Nov 2022 01:21:22 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id j15so23356206wrq.3
        for <linux-leds@vger.kernel.org>; Wed, 02 Nov 2022 01:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YHCz1IQKO8CdYIXmRoFPXUYt9Y4HACcIA9wrhRlMDyI=;
        b=S0umXvvU6kMFaRahNQ1wf+3Kc66JPFwARDt4Xr7L0gocgoW+JI8bnpuoBiYOxVMOYK
         v2TeAURtVvN9lxSI2A7f4wPibmsLKJzlMQJLqd2x5JoNfyDG76WkxrRk3qagt2zeJ/1t
         PZnQkYZBpvMlxEdI0qguy8bLgiEUtw68+5D2WnakQfR131hYEEt6/DK5zxXcdOflYcLM
         dyBW2TcYkU8ZrWpineg/5wkuJkRcDwgWpvgEI3kJLUWAg3sT14/ZIOma5j612ZLB4dD9
         CGf3B7YvnCifdFHtRh7Lrbcjp/dThznL7fyzXPLSgInHUr/ai/8riLyAEMDb2Q313p4f
         lyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YHCz1IQKO8CdYIXmRoFPXUYt9Y4HACcIA9wrhRlMDyI=;
        b=r4pDaDL0jLX/27GRU0X8oGfvTV2qdPyqls4wJTAmJ81qaQSomUW82GdeuaxiUhbLyU
         xv/22dXyT50iYwlmcdRSRdP9U9ZDr5EiaSCwGGp/Uznedr1yK/zAXo9bBY2OJ6mqKwTP
         UM3KB2cVZdKyjvnQn3arrMVFkzO1730HklnTmxfjTo3v2EgqsJ/lid6D0nafXdTK8AyG
         jDopVu7hWx3Tg/8ey7m0vKttVVhKHMP39KzIthS4aVj9mptGzYf5cT2caW4P8IAkTCWw
         AGfTRCN7b5fpcW2n1weHj9Gz687fcr7VTKzJxTvcBuKSEC69/Dk4bxlJ+ITlceu8mPhS
         0LsA==
X-Gm-Message-State: ACrzQf0yYmbGnEiG7MDs2V3TX9Kiz9nk4DRLuRnRFF/EPUopF0THzjeG
        Bh52c1f/yY6/vqwQX0ud8SiLjA==
X-Google-Smtp-Source: AMsMyM5E/G3e51Qa7DpAGCsd5dZQoxdLgRYPiSwc1BpQBtksScg6LmysSYVuuj+70B/6cQ/FLYuUZg==
X-Received: by 2002:adf:bd81:0:b0:236:dc6d:44a0 with SMTP id l1-20020adfbd81000000b00236dc6d44a0mr7069715wrh.175.1667377280861;
        Wed, 02 Nov 2022 01:21:20 -0700 (PDT)
Received: from [192.168.2.9] (78-22-137-109.access.telenet.be. [78.22.137.109])
        by smtp.gmail.com with ESMTPSA id w12-20020a05600c474c00b003b4a699ce8esm1303596wmo.6.2022.11.02.01.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 01:21:20 -0700 (PDT)
Message-ID: <eaa66c56-de8b-ea8e-6907-41535c4c16ac@mind.be>
Date:   Wed, 2 Nov 2022 09:21:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] leds: lp5523: fix out-of-bounds bug in lp5523_selftest()
Content-Language: en-US
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Arne Staessen <a.staessen@televic.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221028105643.45300-1-maarten.zanders@mind.be>
 <20221028153457.GA14936@duo.ucw.cz>
From:   Maarten Zanders <maarten.zanders@mind.be>
In-Reply-To: <20221028153457.GA14936@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On 10/28/22 17:34, Pavel Machek wrote:
> I wonder, should we do these kind of actions on attribute _read_? I'd
> preffer some kind of write action to trigger this.
>
Yes I agree that doing these kind of things on a file read feels somehow 
strange. Strictly speaking, I guess you would implement an IOCTL to 
initiate the action and then perform a read to get the result. But that 
would needlessly complicate things on both ends? I'll keep it in mind 
and when I encounter similar interfaces in other drivers get back to 
this if needed.


