Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F250F1BA5F7
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 16:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727098AbgD0OM4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 10:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727059AbgD0OM4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Apr 2020 10:12:56 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DAEBC0610D5;
        Mon, 27 Apr 2020 07:12:55 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id r26so20666921wmh.0;
        Mon, 27 Apr 2020 07:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hXzFCii8TK+6j4aoUMO+iQEJf8FgxRpxLE2R58+xhnU=;
        b=oAbzNbnGmUqYwp1txITipiEvjxihbS2UCHOaOjmg8ovkCNQAlfLRuGTyWQwyIjgWD3
         E073JSClILB1nA3qt8tGjq+VRPpC7UfwW299JgADbvNkeXyEC+1y0OUTeXhWEP4CZx/Y
         Hwy6cHauz07E0P2uR6KIlRaU181SkT8g0ollwYYgCEAWxHEafxWNphYdzrnGdZwTD2v3
         AWzP4/tjFBVKACwEHa/nmOj3X4idoIRmtZs25KcEtEOa31ZTkwHOhmt7gquE/kY/ImN2
         K0RlE8d0zVjzM4IOgHIGC3xlzS1/ooV/olNIbhDzTPufkQRMgcnxjiOjfnhZBf17eU/A
         Z5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hXzFCii8TK+6j4aoUMO+iQEJf8FgxRpxLE2R58+xhnU=;
        b=EDBdRhhWi5wIucHuw2ohQDd4fEtdja4I44xw0+WUBKb4vUJ+YVsRHn7IvKByyHaC1w
         +sSAgP6lrF9o/8NjNMwtR75BZSXUXpaz02INapyH60TilqWGiTBn07hv92RYvKKtVAZz
         18BMnDiFVTOx24rIQUWj4RThuQP/kigfo7ApoCIuN2Oi2MG8XRsEQ3pWtcM02NIZjpRr
         diFN6flyx4COy5XORbqXlPf60Of6e3RCLMOGra4VRx5BEXiJJyM8wgwj0+QxK/CcSk7z
         jpAgHAcm8Mm/6wPO8Ir1vjU3Pz237yikyCNZApfBA3xD+DqTzG7WR/xZxgqGaCT4qqsz
         boUg==
X-Gm-Message-State: AGi0PuaNec8mS1OUgBM+lefDeMKdmG///YSN3YALKnC4gqEaJdzWACXW
        Fd1qGjg2ZPbBnmakEy4VnUA=
X-Google-Smtp-Source: APiQypJiOnJfu2lTVpb0BgX484TchdDbu6LXcPdFTw2LgdaUXl1ACqMYRiadebISaSMGvTJodU5KsQ==
X-Received: by 2002:a1c:99d3:: with SMTP id b202mr27301491wme.126.1587996774461;
        Mon, 27 Apr 2020 07:12:54 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id e13sm11841282wrp.15.2020.04.27.07.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 07:12:53 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: rk3399-roc-pc: Fix MMC
 numbering for LED triggers
From:   Johan Jonker <jbx6244@gmail.com>
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     devicetree <devicetree@vger.kernel.org>, dmurphy@ti.com,
        =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
        jacek.anaszewski@gmail.com,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
References: <20200427073132.29997-3-wens@kernel.org>
 <684132b8-4a84-8295-474b-38ccb992bba7@gmail.com>
 <CAGb2v66Piu5_2bdqvWV3eEn2Se_y1MNKWvvYBv_J7DA-8jBhbQ@mail.gmail.com>
 <65d15254-08da-895c-1a0c-ef6ce231b620@gmail.com>
 <CAGb2v65fGYguNoksq5Dyx3HTKeYg+U82TiQSL+NO8AUcQJQj5w@mail.gmail.com>
 <74a984fc-ce57-211b-936c-2d77e2e642bb@gmail.com>
Message-ID: <a81840d3-813b-51b5-767c-e0d9d270200e@gmail.com>
Date:   Mon, 27 Apr 2020 16:12:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <74a984fc-ce57-211b-936c-2d77e2e642bb@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

>> So for fixing up the LED node names, we'd probably want the following:
>>
>>     diy_led: led-0
>>     yellow_led: led-1
>>     work_led: led-2

Change proposal for led nodes to comply with preexisting dts.
Does this work?

diy_led: led_0: led-0
yellow_led: led_1: led-1
work_led: led_2: led-2


blue: led_0: led-0

A check does not give any warnings.

make -k ARCH=arm dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/leds/leds-gpio.yaml

> 
> That doesn't look pretty either.
> Would like to hear the maintainers view on how to handle other cases
> without 'led' like for example 'blue' for mk808.
> 
